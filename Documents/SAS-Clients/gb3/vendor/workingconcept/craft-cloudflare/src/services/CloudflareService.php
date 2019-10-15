<?php
/**
 * Cloudflare plugin for Craft CMS 3.x
 *
 * Purge Cloudflare caches from Craft.
 *
 * @link      https://workingconcept.com
 * @copyright Copyright (c) 2017 Working Concept
 */

namespace workingconcept\cloudflare\services;

use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\Exception\RequestException;
use workingconcept\cloudflare\Cloudflare;

use Craft;
use craft\base\Component;
use craft\console\Application as ConsoleApplication;
use GuzzleHttp\Client;
use stdClass;
use workingconcept\cloudflare\helpers\UrlHelper;

/**
 * @author    Working Concept
 * @package   Cloudflare
 * @since     1.0.0
 */
class CloudflareService extends Component
{
    // Constants
    // =========================================================================

    const API_BASE_URL = 'https://api.cloudflare.com/client/v4/';


    // Public Properties
    // =========================================================================

    /**
    * @var stdClass
    */
    protected $responseItems;


    // Private Properties
    // =========================================================================

    /**
     * @var \GuzzleHttp\Client
     */
    private $_client;


    // Public Methods
    // =========================================================================

    /**
     * Get a configured Guzzle client if we have an API key and email. Otherwise
     * returns null.
     *
     * @return Client|null
     */
    public function getClient()
    {
        if ($this->_client === null && $this->isConfigured())
        {
            $this->_client = new Client([
                'base_uri' => self::API_BASE_URL,
                'headers' => [
                    'X-Auth-Key'   => $this->_getApiSetting('apiKey'),
                    'X-Auth-Email' => $this->_getApiSetting('email'),
                    'Content-Type' => 'application/json',
                    'Accept'       => 'application/json'
                ],
                'verify' => false,
                'debug' => false
            ]);
        }

        return $this->_client;
    }

    /**
     * Returns true if we're ready to make REST API calls.
     *
     * @return bool
     */
    public function isConfigured(): bool
    {
        return $this->_getApiSetting('apiKey') !== null &&
            $this->_getApiSetting('email') !== null;
    }

    /**
     * Get a list of zones (domains) available for the provided Cloudflare account.
     * https://api.cloudflare.com/#zone-list-zones
     *
     * @return array|null zones from response.result (combined if there was pagination)
     */
    public function getZones()
    {
        if ( ! $this->getClient())
        {
            return null;
        }

        $this->responseItems = [];

        $currentPage = 0;
        $totalPages  = 1; // temporary
        $perPage     = 50;

        while ($currentPage < $totalPages)
        {
            $currentPage++;

            if ($response = $this->_getPagedZones($currentPage, $perPage))
            {
                if (count($response->result) > 0)
                {
                    $totalRecords = $response->result_info->total_count;
                    $totalPages   = ceil($totalRecords / $perPage);

                    $this->responseItems = array_merge(
                        $this->responseItems,
                        $response->result
                    );
                }
                else 
                {
                    return [];
                }
            }
        }

        return $this->responseItems;
    }

    /**
     * Get details for a zone.
     * https://api.cloudflare.com/#zone-zone-details
     *
     * @param string $zoneId
     * @return \stdClass|null
     */
    public function getZoneById($zoneId)
    {
        if (! $this->getClient())
        {
            return null;
        }

        $response = $this->getClient()->get(sprintf(
            'zones/%s',
            $zoneId
        ));

        if ( ! $response->getStatusCode() == 200)
        {
            Craft::info(sprintf(
                'Request failed: %s',
                $response->getBody()
            ), 'cloudflare');

            return null;
        }

        Craft::info(sprintf(
            'Retrieved zone #%s',
            $zoneId
        ),
        'cloudflare');

        return json_decode($response->getBody())
            ->result;
    }

    /**
     * Purge the entire zone cache.
     * https://api.cloudflare.com/#zone-purge-all-files
     *
     * @return \stdClass|null Cloudflare's response
     */
    public function purgeZoneCache()
    {
        if ( ! $this->getClient())
        {
            return null;
        }

        try
        {
            $response = $this->getClient()->delete(sprintf(
                'zones/%s/purge_cache',
                Cloudflare::$plugin->getSettings()->zone
            ),
                [
                    'body' => json_encode(['purge_everything' => true])
                ]
            );

            $responseBody = json_decode($response->getBody());

            if ( ! $response->getStatusCode() == 200)
            {
                Craft::info(sprintf(
                    'Request failed: %s',
                    json_encode($responseBody)
                ), 'cloudflare');

                return (object) [ 'result' => [] ];
            }

            Craft::info(sprintf(
                'Purged entire zone cache (%s)',
                $responseBody->result->id
            ), 'cloudflare');

            return $responseBody;
        }
        catch(RequestException $exception)
        {
            // if there is a response, we'll use it's body, otherwise we default to the request URI
            $reason = ( $exception->hasResponse()
                ? $exception->getResponse()->getBody()
                : $exception->getRequest()->getUri()
            );

            Craft::info('Request failed: ' . $reason, 'cloudflare');
            return (object) [ 'result' => [] ];
        }
    }

    /**
     * Clear specific URLs in Cloudflare's cache.
     * https://api.cloudflare.com/#zone-purge-individual-files-by-url-and-cache-tags
     *
     * @param  array  $urls  array of absolute URLs
     *
     * @return mixed|null  API response data or null
     */
    public function purgeUrls(array $urls = [])
    {
        if ( ! $this->getClient())
        {
            return null;
        }

        $urls = UrlHelper::prepUrls($urls);

        // don't do anything if URLs are missing
        if (count($urls) === 0)
        {
            Craft::info(
                'No valid URLs provided for purge.',
                'cloudflare'
            );

            return (object) [
                'result' => []
            ];
        }

        try
        {
            $response = $this->getClient()->delete(sprintf(
                    'zones/%s/purge_cache',
                    Cloudflare::$plugin->getSettings()->zone
                ),
                [ 'body' => json_encode(['files' => $urls]) ]
            );

            $responseBody = json_decode($response->getBody());

            if ( ! $response->getStatusCode() == 200)
            {
                Craft::info(sprintf(
                    'Request failed: %s',
                    json_encode($responseBody)
                ), 'cloudflare');

                return (object) [
                    'result' => []
                ];
            }

            $urlString = implode(',', $urls);

            Craft::info(sprintf(
                'Purged URLs (%d): %s',
                $responseBody->result->id,
                $urlString
            ), 'cloudflare');

            return $responseBody;
        }
        catch(ClientException $exception)
        {
            return $this->_handleApiException($urls, $exception);
        }
        catch(RequestException $exception)
        {
            return $this->_handleApiException($urls, $exception);
        }
    }

    /**
     * Get Cloudflare's base API URL.
     *
     * @return string
     */
    public function getApiBaseUrl(): string
    {
        return self::API_BASE_URL;
    }


    // Private Methods
    // =========================================================================

    /**
     * Fetch zones via API, which returns paginated results.
     *
     * @param int $page
     * @param int $perPage
     *
     * @return \stdClass|null
     */
    private function _getPagedZones($page = 1, $perPage = 50)
    {
        if ( ! $this->getClient())
        {
            return null;
        }

        Craft::info(sprintf(
            'Getting zones (page %d).',
            $page
        ), 'cloudflare');

        try 
        {
            $response = $this->getClient()->get(sprintf(
                'zones?per_page=%d',
                $perPage
            ));

            if ( ! $response->getStatusCode() == 200)
            {
                Craft::info(sprintf(
                    'Request failed: %s',
                    $response->getBody()
                ), 'cloudflare');

                return (object) [
                    'result' => []
                ];
            }

            Craft::info('Retrieved zones.', 'cloudflare');

            return json_decode($response->getBody());
        }
        catch (RequestException $exception)
        {
            // if there is a response, we'll use it's body, otherwise we default to the request URI
            $reason = ( $exception->hasResponse()
                ? $exception->getResponse()->getBody()
                : $exception->getRequest()->getUri()
            );

            Craft::info(sprintf(
                'Request failed: %s',
                $reason
            ), 'cloudflare');

            return (object) [
                'result' => []
            ];
        }
    }

    /**
     * Get either of the credentials needed to connect to the REST API.
     *
     * @param string $key `apiKey` or `email`
     *
     * @return string|null
     */
    private function _getApiSetting($key)
    {
        $request   = Craft::$app->getRequest();
        $isConsole = Craft::$app instanceof ConsoleApplication;
        $isCraft31 = version_compare(Craft::$app->getVersion(), '3.1', '>=');

        /**
         * Check post params if we're in the control panel, where we use AJAX
         * for initially checking new parameters.
         */
        $usePost = ! $isConsole &&
            $request->getIsAjax() &&
            ! empty($request->getParam($key)) &&
            is_string($request->getParam($key));

        $settingValue = $usePost ? $request->getParam($key) : 
            Cloudflare::$plugin->getSettings()->{$key} ?? null;

        if ($isCraft31 && $settingValue)
        {
            return Craft::parseEnv($settingValue);
        }

        return $settingValue;
    }

    /**
     * Quietly handle an exception from the Cloudflare API.
     *
     * @param array  $urls
     * @param mixed  $exception (ClientException or RequestException)
     * 
     * @return \stdClass with populated `result` property array
     */
    private function _handleApiException($urls, $exception): \stdClass
    {
        if ($responseBody = json_decode($exception->getResponse()->getBody()))
        {
            $message = "URL purge failed.\n";
            $message .= '- urls: ' . implode($urls, ',') . "\n";

            foreach ($responseBody->errors as $error)
            {
                $message .= "- error code {$error->code}: " . $error->message . "\n";
            }

            Craft::info($message, 'cloudflare');

            return (object) [ 'result' => [] ];
        }

        $reason = ( $exception->hasResponse()
            ? $exception->getResponse()->getBody()
            : $exception->getRequest()->getUri()
        );

        Craft::info(sprintf(
            'Request failed: %s',
            $reason
        ), 'cloudflare');

        return (object) [ 'result' => [] ];
    }

}
