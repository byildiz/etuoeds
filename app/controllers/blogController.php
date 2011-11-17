<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class BlogController extends Controller
{
  public $moodIcons = array(
    'happy' => array(
      'forButton' => '',
      'forPublish' => ''
    ),
  );
  
  public function index()
  {
    $this->view->show('blog_index.php');
  }
  
  public function write()
  {
    $this->view->show('blog_write.php');
  }
}