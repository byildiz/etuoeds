<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class LogoutController extends Controller
{
  public function index()
  {
    $this->load('Account');
    $this->Account->logout();
    $this->redirect('index.php');
  }
}