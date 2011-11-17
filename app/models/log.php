<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Log extends Model
{
  public $tableName = 'logs';
  
  public function getLogs()
  {
    $where = array(
      'deleted' => 0,
    );
    $orderBy = array(
      'created' => 'DESC'
    );
    return $this->select($where, $orderBy);
  }
}