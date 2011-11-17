<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class ErrorController extends Controller
{
  public function auth()
  {
    $this->error('auth.php', null, true);
  }
  
  public function http404()
  {
  
  }
}