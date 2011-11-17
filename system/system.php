<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */

/**
 * Burak YILDIZ
 * 17 Temmuz 2011
 */

require_once 'handy.php';

function __autoload($className)
{
  require_once BASEDIR.'/system/'.lcfirst($className).'.php';
}

class System
{
  public $request;
  
  public $controller;
  
  public static $app = null;
  
  public static function &app($app = null)
  {
    if ($app != null) {
      self::$app = $app;
    }
    if (self::$app == null) {
      self::$app = new Controller();
    }
    return self::$app;
  }
  
  public function parseRequest()
  {
    $this->request['controllerName'] = strtolower(array_shift(explode('.',
        array_pop(explode('/', $_SERVER['REQUEST_URI'])))));
    
    if ($this->request['controllerName'] == '')
      $this->request['controllerName'] = 'index';
    
    if (isset($_GET['s']) && $_GET['s'] != '') {
      $this->request['actionName'] = strtolower(filter_request($_GET['s']));
    } else {
      $this->request['actionName'] = 'index';
    }
  }
  
  public function run($configFile, $mvc = true)
  {
    // determine the controller and action name
    $this->parseRequest();
    
    // for go back
    $this->saveRequest();
    
    if ($mvc)
      $this->initMvc();
    else {
      self::app(new Controller());
    }
    
    $app = self::app();
    
    $app->config = include($configFile);
    $app->controllerName = $this->request['controllerName'];
    $app->actionName = $this->request['actionName'];
    
    if (isset($app->config['loadPaths']))
      $app->loadPaths = $app->config['loadPaths'];
    
    if (isset($app->config['dbConfig']))
      $app->db = new Database($app->config['dbConfig']);
    
    if (isset($app->config['viewConfig']))
      $app->view = new View($app->config['viewConfig']);
    
    // add model dir to loadPath
    if (isset($app->config['modelConfig'])) {
      $app->loadPaths[] = $app->config['modelConfig']['dir'];
      
      // if exists load default model
      $app->load($app->controllerName);
    }
    
    if (isset($app->config['autoLoad'])) {
      foreach ($app->config['autoLoad'] as $al) {
        if ($app->load($al))
          $app->view->{$al} = $app->{$al};
      }
    }
    
    if (!$mvc)
      return;
    
    $initPath = APPDIR.'/initiate.php';
    if (file_exists($initPath)) {
      require_once $initPath;
      $init = new Initiate();
      $init->__init();
    }
    
    // if exists call action method
    if (!method_exists($app, $app->actionName)) {
      exit('sayfa bulunamamis! en iyisi sen anasayfaya {<a href="index.php">don</a>}');
      exit('The action method not found: '.$app->actionName);
    }
    $app->{$app->actionName}();
  }
  
  private function initMvc()
  {
    $controllerClass = ucfirst($this->request['controllerName']).'Controller';
    $controllerPath = APPDIR.'/controllers/'.$this->request['controllerName'].'Controller.php';
    if (!file_exists($controllerPath)) {
      exit('sayfa bulunamamis! en iyisi sen anasayfaya {<a href="index.php">don</a>}');
      exit('The controller file not found: '.$controllerPath);
    }
    require_once $controllerPath;
    
    $controller = new $controllerClass();
    
    $this->controller = self::app($controller);
  }
  
  public function saveRequest()
  {
    @session_start();
    if (isset($_SESSION['Request'])) {
      $_SESSION['Request'][1] = $_SESSION['Request'][0];
      $_SESSION['Request'][0] = $_SERVER['REQUEST_URI'];
    } else {
      $_SESSION['Request'] = array();
      $_SESSION['Request'][0] = $_SERVER['REQUEST_URI'];
      $_SESSION['Request'][1] = $_SERVER['REQUEST_URI'];
    }
  }
}