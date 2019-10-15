<?php
/**
 * Pushdb plugin for Craft CMS 3.x
 *
 * Clones a database from source to destination
 *
 * @link      https://billymedia.co.uk
 * @copyright Copyright (c) 2018 Billy Patel
 */

namespace billymedia\pushdb\controllers;

use billymedia\pushdb\Pushdb;

use Craft;
use craft\web\Controller;

class MainController extends Controller
{

    private $mysqlSockPath;
    private $mysqlServer;
    private $sourceDb;
    private $destDb;
    private $sourceMysqlUser;
    private $sourceMysqlPw;
    private $destMysqlUser;
    private $destMysqlPw;

    // protected $allowAnonymous = ['index', 'do-something'];

    public function actionIndex()
    {

        $craft = \Craft::$app;

        if((bool)$craft->config->general->enablePushDb==true){
            $template = 'pushdb/index';
        } else {
            $template = 'pushdb/disabled';
        }
        $this->renderTemplate($template);
    }

    public function actionStarted(){
        $craft = \Craft::$app;
        $this->renderTemplate('pushdb/started');
    }

    public function actionPush()
    {

        $craft = \Craft::$app;

        $this->setupMysqlParams();
        
        $tableToSkip = ''; // --ignore-table=
        $command = 'mysqldump -u '.$this->sourceMysqlUser.' -p\''.$this->sourceMysqlPw.'\' '.$this->sourceDb.$tableToSkip.' | mysql -u '.$this->destMysqlUser.' -p\''.$this->sourceMysqlPw.'\' '.$this->destDb . ' > /dev/null 2>&1 &';

        // echo $command;die;
        shell_exec($command);
        
        return $this->redirect('pushdb/started');
    }


    private function setupMysqlParams(){

        $craft = \Craft::$app;

        $this->sourceDb = $craft->config->general->sourceDb;
        $this->destDb = $craft->config->general->destDb;
        $this->sourceMysqlUser = $craft->config->general->sourceMysqlUser;
        $this->sourceMysqlPw = $craft->config->general->sourceMysqlPw;
        $this->destMysqlUser = $craft->config->general->destMysqlUser;
        $this->destMysqlPw = $craft->config->general->destMysqlPw;

    }


}
