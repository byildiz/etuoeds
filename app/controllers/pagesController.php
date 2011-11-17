<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class PagesController extends Controller
{
  public function tos()
  {
    $this->view->show('tos.php');
  }
  
  public function purpose()
  {
    $this->view->show('purpose.php');
  }
  
  public function about()
  {
    $this->view->show('about.php');
  }
  
  public function contact()
  {
    $this->view->show('contact.php');
  }
  
  public function dev()
  {
    $this->view->show('dev.php');
  }
}