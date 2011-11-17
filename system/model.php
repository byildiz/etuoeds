<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Model
{
  public $db;
  
  public $app;
  
  public $tableName;
  
  public function __construct()
  {
    $this->app = System::app();
    $this->db = $this->app->db;
  }
  
  public function select($where = null, $orderBy = null, $limit = null)
  {
    return $this->db->select($this->tableName, $where, $orderBy, $limit);
  }
  
  public function selectFirst($where = null, $orderBy = null)
  {
    $limit = 1;
    $selected = $this->select($where, $orderBy, $limit);
    return (!empty($selected)) ? $selected[0] : null;
  }
  
  public function insert($data)
  {
    return $this->db->insert($this->tableName, $data);
  }
  
  public function delete($where)
  {
    return $this->db->delete($this->tableName, $where);
  }
  
  public function update($data, $where = null)
  {
    if (!is_array($where)) {
      $where = array('id' => $where);
    }
    return $this->db->update($this->tableName, $data, $where);
  }
  
  public function lastInsertId()
  {
    return $this->db->lastInsertId();
  }
  
  public function selectQuery($sql)
  {
    return $this->db->selectQuery($sql);
  }
  
  public function get($id)
  {
    $rows = $this->select(array('id' => $id));
    if (count($rows) == 0) {
      return null;
    } else {
      return $rows[0];
    }
  }
}