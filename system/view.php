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

class View
{
  public $config;
  
  public $app;
  
  public $layout;
  
  public $dir;
  
  public $data;

  public function  __construct($config)
  {
    $this->config = $config;
    $this->app = System::app();
    $this->layout = $config['layout'];
    $this->dir = $config['dir'];
  }

  public function show($file, $data = null, $layout = true)
  {
    if ($data != null) {
      $this->data = $data;
      extract($data);
    }
    
    $pageContent = $this->_render($file, $data);

    if (!$layout) {
      echo $pageContent;
    } else {
      $layoutPath = $this->dir.'/'.$this->layout;
      if (!file_exists($layoutPath)) {
        exit('The layout file not found: '.$layoutPath);
      }
      require $layoutPath;
    }
  }

  public function render($file, $data = null, $layout = true)
  {
    if ($data != null) {
      extract($data);
    }
    
    $pageContent = $this->_render($file, $data);
    
    if (!$layout) {
      return $pageContent;
    } else {
      ob_start();
    
      $layoutPath = $this->dir.'/'.$this->layout;
      if (!file_exists($layoutPath)) {
        exit('The layout file not found: '.$layoutPath);
      }
      require $layoutPath;
      
      $result = ob_get_contents();
      ob_end_clean();
      return $result;
    }
  }
  
  public function part($file)
  {
    return $this->render($file, null, false);
  }
  
  private function _render($file, $data = null)
  {
    if ($data != null) {
      extract($data);
    }
    if ($this->data != null) {
      extract($this->data);
    }
    
    ob_start();
    $filePath = $this->dir.'/'.$this->app->controllerName.'/'.$file;
    if (!file_exists($filePath)) {
      exit('The view file not found: '.$filePath);
    }
    include $filePath;
    $result = ob_get_contents();
    ob_end_clean();
    return $result;
  }
}