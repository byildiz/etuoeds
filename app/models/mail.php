<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Mail extends Model
{
  $tableName = 'mails';
  
  public function selectByPriority()
  {
    $app = System->app();
    $app->load('Email');
    $where = array(
      'status' => Email::FRESH
    );
    $orderBy = array(
      'priority' => 'ASC',
      'created' => 'ASC'
    );
    $limit = 1;
    return $this->select($where, $orderBy, $limit);
  }
}