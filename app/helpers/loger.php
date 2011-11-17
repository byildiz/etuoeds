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
 * 25 Ağustos 2011 14:13
 */
class Loger extends Helper
{
  public function __construct()
  {
    $this->app = System::app();
    if (isset($this->app->config['logConfig']))
      $this->config = $this->app->config['logConfig'];
    $this->app->load('Log');
  }
  
  public function log($type, $message)
  {
    $newLog = array(
      'type' => $type,
      'message' => $message,
      'updated' => created_time(),
      'created' => created_time()
    );
    $this->app->Log->insert($newLog);
  }
}