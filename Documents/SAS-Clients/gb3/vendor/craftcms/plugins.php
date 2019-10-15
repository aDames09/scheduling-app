<?php

$vendorDir = dirname(__DIR__);

return array (
  'mmikkel/retcon' => 
  array (
    'class' => 'mmikkel\\retcon\\Retcon',
    'basePath' => $vendorDir . '/mmikkel/retcon/src',
    'handle' => 'retcon',
    'aliases' => 
    array (
      '@mmikkel/retcon' => $vendorDir . '/mmikkel/retcon/src',
    ),
    'name' => 'Retcon',
    'version' => '2.0.12',
    'schemaVersion' => '1.0.0',
    'description' => 'Powerful Twig filters for mutating and querying HTML',
    'developer' => 'Mats Mikkel Rummelhoff',
    'developerUrl' => 'https://vaersaagod.no',
    'changelogUrl' => 'https://raw.githubusercontent.com/mmikkel/Retcon-Craft/master/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
    'components' => 
    array (
    ),
  ),
  'mikestecker/craft-videoembedder' => 
  array (
    'class' => 'mikestecker\\videoembedder\\VideoEmbedder',
    'basePath' => $vendorDir . '/mikestecker/craft-videoembedder/src',
    'handle' => 'video-embedder',
    'aliases' => 
    array (
      '@mikestecker/videoembedder' => $vendorDir . '/mikestecker/craft-videoembedder/src',
    ),
    'name' => 'Video Embedder',
    'version' => '1.1.1',
    'schemaVersion' => '1.0.0',
    'description' => 'Craft plugin to generate an embed URL from a YouTube or Vimeo URL.',
    'developer' => 'Mike Stecker',
    'developerUrl' => 'http://github.com/mikestecker',
    'changelogUrl' => 'https://raw.githubusercontent.com/mikestecker/craft-videoembedder/v1/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
  ),
  'craftcms/element-api' => 
  array (
    'class' => 'craft\\elementapi\\Plugin',
    'basePath' => $vendorDir . '/craftcms/element-api/src',
    'handle' => 'element-api',
    'aliases' => 
    array (
      '@craft/elementapi' => $vendorDir . '/craftcms/element-api/src',
    ),
    'name' => 'Element API',
    'version' => '2.5.4',
    'description' => 'Create a JSON API for your elements in Craft',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'changelogUrl' => 'https://raw.githubusercontent.com/craftcms/element-api/v2/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/craftcms/element-api/archive/v2.zip',
  ),
  'nystudio107/craft-cookies' => 
  array (
    'class' => 'nystudio107\\cookies\\Cookies',
    'basePath' => $vendorDir . '/nystudio107/craft-cookies/src',
    'handle' => 'cookies',
    'aliases' => 
    array (
      '@nystudio107/cookies' => $vendorDir . '/nystudio107/craft-cookies/src',
    ),
    'name' => 'Cookies',
    'version' => '1.1.11',
    'schemaVersion' => '1.0.0',
    'description' => 'A simple plugin for setting and getting cookies from within Craft CMS templates.',
    'developer' => 'nystudio107',
    'developerUrl' => 'https://nystudio107.com/',
    'changelogUrl' => 'https://raw.githubusercontent.com/nystudio107/craft-cookies/v1/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
    'components' => 
    array (
      'cookies' => 'nystudio107\\cookies\\services\\CookiesService',
    ),
  ),
  'nystudio107/craft-minify' => 
  array (
    'class' => 'nystudio107\\minify\\Minify',
    'basePath' => $vendorDir . '/nystudio107/craft-minify/src',
    'handle' => 'minify',
    'aliases' => 
    array (
      '@nystudio107/minify' => $vendorDir . '/nystudio107/craft-minify/src',
    ),
    'name' => 'Minify',
    'version' => '1.2.9',
    'schemaVersion' => '1.0.0',
    'description' => 'A simple plugin that allows you to minify blocks of HTML, CSS, and JS inline in Craft CMS templates.',
    'developer' => 'nystudio107',
    'developerUrl' => 'https://nystudio107.com/',
    'changelogUrl' => 'https://raw.githubusercontent.com/nystudio107/craft-minify/v1/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
    'components' => 
    array (
      'minify' => 'nystudio107\\minify\\services\\MinifyService',
    ),
  ),
  'billymedia/pushdb' => 
  array (
    'class' => 'billymedia\\pushdb\\Pushdb',
    'basePath' => $vendorDir . '/billymedia/pushdb/src',
    'handle' => 'pushdb',
    'aliases' => 
    array (
      '@billymedia/pushdb' => $vendorDir . '/billymedia/pushdb/src',
    ),
    'name' => 'Pushdb',
    'version' => '1.0',
    'description' => 'Clones a database from source to destination',
    'developer' => 'Billy Patel',
    'developerUrl' => 'https://billymedia.co.uk',
    'documentationUrl' => '???',
    'changelogUrl' => '???',
    'hasCpSettings' => false,
    'hasCpSection' => true,
    'components' => 
    array (
      'pushdbService' => 'billymedia\\pushdb\\services\\PushdbService',
    ),
  ),
  'billymedia/sasutils' => 
  array (
    'class' => 'billymedia\\sasutils\\SASUtils',
    'basePath' => $vendorDir . '/billymedia/sasutils/src',
    'handle' => 'sasutils',
    'aliases' => 
    array (
      '@billymedia/sasutils' => $vendorDir . '/billymedia/sasutils/src',
    ),
    'name' => 'SASUtils',
    'version' => '1',
    'description' => 'SAS Utils',
    'developer' => 'Billy Patel',
    'developerUrl' => 'https://billymedia.co.uk',
    'documentationUrl' => '',
    'changelogUrl' => '',
    'hasCpSettings' => false,
    'hasCpSection' => false,
  ),
  'ether/seo' => 
  array (
    'class' => 'ether\\seo\\Seo',
    'basePath' => $vendorDir . '/ether/seo/src',
    'handle' => 'seo',
    'aliases' => 
    array (
      '@ether/seo' => $vendorDir . '/ether/seo/src',
    ),
    'name' => 'SEO',
    'version' => '3.5.4',
    'description' => 'SEO utilities including a unique field type, sitemap, & redirect manager',
    'developer' => 'Ether Creative',
    'developerUrl' => 'https://ethercreative.co.uk',
  ),
  'aelvan/craft-cp-element-count' => 
  array (
    'class' => 'aelvan\\cpelementcount\\CpElementCount',
    'basePath' => $vendorDir . '/aelvan/craft-cp-element-count/src',
    'handle' => 'cp-element-count',
    'aliases' => 
    array (
      '@aelvan/cpelementcount' => $vendorDir . '/aelvan/craft-cp-element-count/src',
    ),
    'name' => 'CP Element Count',
    'version' => '1.1.0',
    'description' => 'Adds an element count to sections, categories, user groups and asset folders in the Craft control panel',
    'developer' => 'André Elvan',
    'developerUrl' => 'https://www.vaersaagod.no/',
    'documentationUrl' => 'https://github.com/aelvan/craft-cp-element-count/blob/master/README.md',
    'changelogUrl' => 'https://raw.githubusercontent.com/aelvan/craft-cp-element-count/master/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
  ),
  'born05/craft-assetusage' => 
  array (
    'class' => 'born05\\assetusage\\Plugin',
    'basePath' => $vendorDir . '/born05/craft-assetusage/src',
    'handle' => 'assetusage',
    'aliases' => 
    array (
      '@born05/assetusage' => $vendorDir . '/born05/craft-assetusage/src',
    ),
    'name' => 'Asset Usage',
    'version' => '2.0.1',
    'description' => 'Adds a column to see which assets are used or unused.',
    'developer' => 'Born05',
    'developerUrl' => 'https://www.born05.com/',
    'changelogUrl' => 'https://raw.githubusercontent.com/born05/craft-assetusage/master/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
  ),
  'workingconcept/craft-cloudflare' => 
  array (
    'class' => 'workingconcept\\cloudflare\\Cloudflare',
    'basePath' => $vendorDir . '/workingconcept/craft-cloudflare/src',
    'handle' => 'cloudflare',
    'aliases' => 
    array (
      '@workingconcept/cloudflare' => $vendorDir . '/workingconcept/craft-cloudflare/src',
    ),
    'name' => 'Cloudflare',
    'version' => '0.2.9',
    'schemaVersion' => '1.0.0',
    'description' => 'Purge Cloudflare caches from Craft.',
    'developer' => 'Working Concept',
    'developerUrl' => 'https://workingconcept.com/',
    'changelogUrl' => 'https://raw.githubusercontent.com/workingconcept/cloudflare-craft-plugin/master/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/workingconcept/cloudflare-craft-plugin/archive/master.zip',
    'hasCpSettings' => true,
    'hasCpSection' => false,
    'components' => 
    array (
      'cloudflareService' => 'workingconcept\\cloudflare\\services\\CloudflareService',
      'rulesService' => 'workingconcept\\cloudflare\\services\\RulesService',
    ),
  ),
  'aelvan/imager' => 
  array (
    'class' => 'aelvan\\imager\\Imager',
    'basePath' => $vendorDir . '/aelvan/imager/src',
    'handle' => 'imager',
    'aliases' => 
    array (
      '@aelvan/imager' => $vendorDir . '/aelvan/imager/src',
    ),
    'name' => 'Imager',
    'version' => 'v2.1.10',
    'schemaVersion' => '2.0.0',
    'description' => 'Image transforms gone wild',
    'developer' => 'André Elvan',
    'developerUrl' => 'https://www.vaersaagod.no',
    'changelogUrl' => 'https://raw.githubusercontent.com/aelvan/Imager-Craft/craft3/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
    'components' => 
    array (
    ),
  ),
  'sebastianlenz/linkfield' => 
  array (
    'class' => 'typedlinkfield\\Plugin',
    'basePath' => $vendorDir . '/sebastianlenz/linkfield/src',
    'handle' => 'typedlinkfield',
    'aliases' => 
    array (
      '@typedlinkfield' => $vendorDir . '/sebastianlenz/linkfield/src',
    ),
    'name' => 'Typed link field',
    'version' => '1.0.19',
    'description' => 'A Craft field type for selecting links',
    'developer' => 'Sebastian Lenz',
    'developerUrl' => 'https://github.com/sebastian-lenz/',
  ),
  'craftcms/redactor' => 
  array (
    'class' => 'craft\\redactor\\Plugin',
    'basePath' => $vendorDir . '/craftcms/redactor/src',
    'handle' => 'redactor',
    'aliases' => 
    array (
      '@craft/redactor' => $vendorDir . '/craftcms/redactor/src',
    ),
    'name' => 'Redactor',
    'version' => '2.3.3.2',
    'description' => 'Edit rich text content in Craft CMS using Redactor by Imperavi.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'documentationUrl' => 'https://github.com/craftcms/redactor/blob/v2/README.md',
  ),
  'barrelstrength/sprout-forms' => 
  array (
    'class' => 'barrelstrength\\sproutforms\\SproutForms',
    'basePath' => $vendorDir . '/barrelstrength/sprout-forms/src',
    'handle' => 'sprout-forms',
    'aliases' => 
    array (
      '@barrelstrength/sproutforms' => $vendorDir . '/barrelstrength/sprout-forms/src',
    ),
    'name' => 'Sprout Forms',
    'version' => '3.0.0-beta.57',
    'description' => 'Simple, beautiful forms. 100% control.',
    'developer' => 'Barrel Strength',
    'developerUrl' => 'https://barrelstrengthdesign.com',
    'documentationUrl' => 'https://sprout.barrelstrengthdesign.com/craft-plugins/forms',
    'changelogUrl' => 'https://raw.githubusercontent.com/BarrelStrength/sprout-forms/master/CHANGELOG.md',
    'downloadUrl' => 'https://github.com/BarrelStrength/sprout-forms/archive/master.zip',
  ),
  'verbb/feed-me' => 
  array (
    'class' => 'craft\\feedme\\Plugin',
    'basePath' => $vendorDir . '/verbb/feed-me/src',
    'handle' => 'feed-me',
    'aliases' => 
    array (
      '@craft/feedme' => $vendorDir . '/verbb/feed-me/src',
    ),
    'name' => 'Feed Me',
    'version' => '4.1.0',
    'description' => 'Import content from XML, RSS, CSV or JSON feeds into entries, categories, Craft Commerce products, and more.',
    'developer' => 'Pixel & Tonic',
    'developerUrl' => 'https://pixelandtonic.com/',
    'documentationUrl' => 'https://docs.craftcms.com/feed-me/v4/',
  ),
  'marionnewlevant/snitch' => 
  array (
    'class' => 'marionnewlevant\\snitch\\Snitch',
    'basePath' => $vendorDir . '/marionnewlevant/snitch/src',
    'handle' => 'snitch',
    'aliases' => 
    array (
      '@marionnewlevant/snitch' => $vendorDir . '/marionnewlevant/snitch/src',
    ),
    'name' => 'Snitch',
    'version' => '2.1.2',
    'description' => 'Report when two people might be editing the same element (eg entry, category, or global) or field',
    'developer' => 'Marion Newlevant',
    'developerUrl' => 'http://marion.newlevant.com',
    'documentationUrl' => 'https://github.com/marionnewlevant/craft-snitch/blob/v2/README.md',
    'changelogUrl' => 'https://raw.githubusercontent.com/marionnewlevant/craft-snitch/v2/CHANGELOG.md',
    'hasCpSettings' => false,
    'hasCpSection' => false,
    'components' => 
    array (
      'collision' => 'marionnewlevant\\snitch\\services\\Collision',
    ),
  ),
  'verbb/super-table' => 
  array (
    'class' => 'verbb\\supertable\\SuperTable',
    'basePath' => $vendorDir . '/verbb/super-table/src',
    'handle' => 'super-table',
    'aliases' => 
    array (
      '@verbb/supertable' => $vendorDir . '/verbb/super-table/src',
    ),
    'name' => 'Super Table',
    'version' => '2.1.20',
    'description' => 'Super-charge your Craft workflow with Super Table. Use it to group fields together or build complex Matrix-in-Matrix solutions.',
    'developer' => 'Verbb',
    'developerUrl' => 'https://verbb.io',
    'documentationUrl' => 'https://github.com/verbb/super-table',
    'changelogUrl' => 'https://raw.githubusercontent.com/verbb/super-table/craft-3/CHANGELOG.md',
  ),
);
