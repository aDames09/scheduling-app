<?php
/**
 * SASUtils plugin for Craft CMS 3.x
 *
 * SAS Utils
 *
 * @link      https://billymedia.co.uk
 * @copyright Copyright (c) 2018 Billy Patel
 */

namespace billymedia\sasutils\twigextensions;

use billymedia\sasutils\SASUtils;

use Craft;
use Twig_Extension;
use Twig_Filter_Method;

/**
 * Twig can be extended in many ways; you can add extra tags, filters, tests, operators,
 * global variables, and functions. You can even extend the parser itself with
 * node visitors.
 *
 * http://twig.sensiolabs.org/doc/advanced.html
 *
 * @author    Billy Patel
 * @package   SASUtils
 * @since     1
 */
class SASUtilsTwigExtension extends \Twig_Extension
{
    // Public Methods
    // =========================================================================

    /**
     * Returns the name of the extension.
     *
     * @return string The extension name
     */
    public function getName()
    {
        return 'SASUtils';
    }

    /**
     * Returns an array of Twig filters, used in Twig templates via:
     *
     *      {{ 'something' | someFilter }}
     *
     * @return array
     */
    public function getFilters()
    {
        return [
            new \Twig_SimpleFilter('stripDomainFromString', [$this, 'stripDomainFromString']),
        ];
    }

    /**
     * Returns an array of Twig functions, used in Twig templates via:
     *
     *      {% set this = someFunction('something') %}
     *
    * @return array
     */
    public function getFunctions()
    {
        return [
            // new \Twig_SimpleFunction('stripDomainFromString', [$this, 'stripDomainFromString']),
        ];
    }

    public function stripDomainFromString($text = null){
        $craft = \Craft::$app;
        $domains = $craft->config->general->stripDomainFromString;
        foreach ($domains as $domain ) {
            $text = str_ireplace('http://'.$domain, '', $text);
            $text = str_ireplace('https://'.$domain, '', $text);
        }
        return $text;
    }

}
