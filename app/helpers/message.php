<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Message extends Helper
{
  public function __construct()
  {
    parent::__construct();
    @session_start();
  }
  
  public function get($messageTag)
  {
    $tags = explode('.', $messageTag);
    $lastTag = $tags[count($tags)-1];
    $sessionVar = &$_SESSION['Message'];
    foreach ($tags as $t) {
      if (isset($sessionVar[$t])) {
        if ($t == $lastTag) {
          $message = $sessionVar[$t];
          unset($sessionVar[$t]);
          return $message;
        } else {
          $sessionVar = &$sessionVar[$t];
        }
      } else {
        return '';
      }
    }
  }
  
  public function has($messageTag)
  {
    $tags = explode('.', $messageTag);
    $lastTag = $tags[count($tags)-1];
    $sessionVar = &$_SESSION['Message'];
    foreach ($tags as $t) {
      if (!empty($sessionVar[$t])) {
        if ($t == $lastTag) {
          return true;
        } else {
          $sessionVar = &$sessionVar[$t];
        }
      } else {
        return false;
      }
    }
  }
  
  public function set($messageTag, $message)
  {
    $tags = explode('.', $messageTag);
    $sessionVar = &$_SESSION['Message'];
    foreach ($tags as $t) {
      if (!isset($sessionVar[$t]))
        $sessionVar[$t] = array();
      $sessionVar = &$sessionVar[$t];
    }
    $sessionVar = $message;
  }
}