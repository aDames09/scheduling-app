<?php
/**
 * Pushdb plugin for Craft CMS 3.x
 *
 * Clones a database from source to destination
 *
 * @link      https://billymedia.co.uk
 * @copyright Copyright (c) 2018 Billy Patel
 */

namespace billymedia\pushdb\assetbundles\indexcpsection;

use Craft;
use craft\web\AssetBundle;
use craft\web\assets\cp\CpAsset;

/**
 * @author    Billy Patel
 * @package   Pushdb
 * @since     1
 */
class IndexCPSectionAsset extends AssetBundle
{
    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function init()
    {
        $this->sourcePath = "@billymedia/pushdb/assetbundles/indexcpsection/dist";

        $this->depends = [
            CpAsset::class,
        ];

        $this->js = [
            'js/Index.js',
        ];

        $this->css = [
            'css/Index.css',
        ];

        parent::init();
    }
}
