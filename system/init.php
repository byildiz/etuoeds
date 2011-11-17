<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Init
{
  public $app;
  
  public function __construct()
  {
    $this->app = System::app();
  }
  
  public function __init()
  {
    $methods = get_class_methods($this);
    foreach ($methods as $m) {
      $pos = strpos($m, 'init');
      if ($pos !== false && $pos == 0) {
        $this->{$m}();
      }
    }
  }
}