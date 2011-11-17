<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class ViewHelper
{
  public $config;
  
  public $app;
  
  public $view;
  
  public function __construct()
  {
    $this->app = System::app();
    $this->view = $this->app->view;
    if (isset($this->app->config[lcfirst(__CLASS__).'Config'])) {
      $this->config = $this->app->config[lcfirst(__CLASS__).'Config'];
    }
    
    $this->app->view->{__CLASS__} = $this;
  }
}