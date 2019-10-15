<?php
/**
 * Pushdb plugin for Craft CMS 3.x
 *
 * Clones a database from source to destination
 *
 * @link      https://billymedia.co.uk
 * @copyright Copyright (c) 2018 Billy Patel
 */

namespace billymedia\pushdb;

use billymedia\pushdb\services\PushdbService as PushdbServiceService;

use Craft;
use craft\base\Plugin;
use craft\services\Plugins;
use craft\events\PluginEvent;
use craft\web\UrlManager;
use craft\events\RegisterUrlRulesEvent;

use yii\base\Event;

/**
 * Class Pushdb
 *
 * @author    Billy Patel
 * @package   Pushdb
 * @since     1
 *
 * @property  PushdbServiceService $pushdbService
 */
class Pushdb extends Plugin
{
    // Static Properties
    // =========================================================================

    /**
     * @var Pushdb
     */
    public static $plugin;

    // Public Properties
    // =========================================================================

    /**
     * @var string
     */
    public $schemaVersion = '1';

    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        self::$plugin = $this;

        // CP URLs
        Event::on(
            UrlManager::class,
            UrlManager::EVENT_REGISTER_CP_URL_RULES,
            [$this, 'onRegisterCPUrlRules']
        );

        Craft::info(
            Craft::t(
                'pushdb',
                '{name} plugin loaded',
                ['name' => $this->name]
            ),
            __METHOD__
        );
    }

    public function onRegisterCPUrlRules (RegisterUrlRulesEvent $event)
    {
        $event->rules['pushdb'] = 'pushdb/main/index';
        $event->rules['pushdb/push'] = 'pushdb/main/push';
    }


}
