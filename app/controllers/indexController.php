<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class IndexController extends Controller
{
  public function index()
  {
    if ($this->Account->isLogedin())
      $this->redirect($this->Account->getLoginRedirect());
    $this->view->show('index.php');
  }
}