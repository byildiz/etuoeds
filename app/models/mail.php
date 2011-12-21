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
  public $tableName = 'mails';
  
  public function selectByPriority()
  {
    $app = System::app();
    $where = array(
      'status' => Email::FRESH
    );
    $orderBy = array(
      'priority' => 'ASC',
      'created' => 'ASC'
    );
    $limit = isset($app->config['mailConfig']['perDeliveryCount'])
        ? $app->config['mailConfig']['perDeliveryCount'] : 10;
    return $this->select($where, $orderBy, $limit);
  }
}