<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Controller
{
  public $view;
  
  public $db;
  
  public $controllerName;
  
  public $actionName;
  
  public $loadPaths = array();
  
  public $config;
  
  public function load($fileName)
  {
    if (isset($this->{$fileName}))
      return true;
    
    $find = false;
    foreach ($this->loadPaths as $path) {
      $filePath = $path.'/'.lcfirst($fileName).'.php';
      if (file_exists($filePath)) {
        $find = true;
        require_once $filePath;
        $this->{$fileName} = new $fileName();
      }
    }
    return $find;
  }
  
  public function redirect($path)
  {
    header('Location: '.$path);
    exit();
  }
  
  public function error($errorFile, $data = null, $layout = false)
  {
    $this->view->show('../error/'.$errorFile, $data, $layout);
    exit();
  }
  
  public function goback()
  {
    if (!isset($_SESSION['Request'])
        || $_SESSION['Request'][0] == $_SESSION['Request'][1]) {
      $back = 'index.php';
    } else {
      $back = $_SESSION['Request'][1];
    }
    $this->redirect($back);
  }
  
  public function info($infoFile, $data = null, $layout = true)
  {
    $this->view->show('../general/'.$infoFile, $data, $layout);
    exit();
  }
}