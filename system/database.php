<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */

/**
 * Burak YILDIZ
 * 2 Aralık 2010
 */

class Database
{
  public static $db;
  
  public static $connection;
  
  public $config;
  
  public $app;
  
  public $tableName = null;
  
  public $insertId;
  
  public function __construct($config)
  {
    $this->config = $config;
    $this->app = System::app();
    
    if (self::$connection == null)
      self::$connection = @mysql_connect($config['host'], $config['username'], $config['password']);
    
    if (self::$db == null)
      self::$db = @mysql_select_db($config['dbName'], self::$connection);
    
    if (!self::$db)
      exit('The database connection couldn\'t established');
    
    // set character encoding
    mysql_query("SET NAMES 'utf8'");
  }
  
  private function _getTableName($tableName)
  {
    if (isset($this->config['tablePrefix'])) {
      return $this->config['tablePrefix'].'_'.$tableName;
    } else {
      return $this->tableName;
    }
  }
  
  public function selectQuery($sql)
  {
    $query = @mysql_query($sql);
    $data = array();
    if ($query === false) {
      exit(mysql_error());
      return $data;
    }
    while ($row = mysql_fetch_assoc($query)) {
      $data[] = $row;
    }
    
    return $data;
  }
  
  public function select($tableName, $where = null, $orderBy = null, $limit = null)
  {
    $sql = 'SELECT * FROM '.$this->_getTableName($tableName);
    if ($where != null) {
      $conditions = array();
      foreach ($where as $i => $w) {
        if (strpos($w, '>') === 0
            || strpos($w, '<') === 0
            || strpos($w, '!') === 0
            || strpos($w, '=') === 0)
          $conditions[] = sprintf('%s %s', $i, $w);
        else
          $conditions[] = sprintf('%s = "%s"', $i, filter_sql($w));
      }
      $sql .= ' WHERE '.implode(' AND ', $conditions);
    }
    if ($orderBy != null) {
      $sql .= ' ORDER BY ';
      $orderBys = array();
      foreach ($orderBy as $i => $o) {
        $orderBys[] = sprintf('%s %s', $i, filter_sql($o));
      }
      $sql .= implode(', ', $orderBys);
    }
    if ($limit != null) {
      $sql .= sprintf(' LIMIT %s', $limit);
    }
    $query = @mysql_query($sql);
    $data = array();
    if ($query === false) {
      exit(mysql_error());
      return $data;
    }
    while ($row = mysql_fetch_assoc($query)) {
      $data[] = $row;
    }
    
    return $data;
  }
  
  public function insert($tableName, $data)
  {
    $sql = 'INSERT INTO '.$this->_getTableName($tableName);
    $fields = array();
    $values = array();
    foreach ($data as $key => $value) {
      $fields[] = $key;
      $values[] = sprintf("'%s'", filter_sql($value));
    }
    
    $sql .= ' ('.implode(', ', $fields).') VALUES ('.implode(', ', $values).')';
    
    if (!mysql_query($sql)) {
      echo mysql_error(self::$connection);
      exit();
    }
    $this->insertId = mysql_insert_id();
    
    return true;
  }
  
  public function lastInsertId()
  {
    return $this->insertId;
  }
  
  public function delete($tableName, $where)
  {
    $sql = 'DELETE FROM '.$this->_getTableName($tableName);
    if ($where != null) {
      $conditions = array();
      foreach ($where as $i => $w) {
        $conditions[] = sprintf('%s = "%s"', $i, filter_sql($w));
      }
      $sql .= ' WHERE '.implode(' AND ', $conditions);
    }
    
    return @mysql_query($sql);
  }
  
  public function update($tableName, $data, $where = null)
  {
    $sql = 'UPDATE '.$this->_getTableName($tableName).' SET ';
    $updatedData = array();
    foreach ($data as $i => $d) {
      $updatedData[] = sprintf('%s = "%s"', $i, filter_sql($d));
    }
    $sql .= implode(', ', $updatedData);
    if ($where != null) {
      $conditions = array();
      foreach ($where as $i => $w) {
        $conditions[] = sprintf('%s = "%s"', $i, filter_sql($w));
      }
      $sql .= ' WHERE '.implode(' AND ', $conditions);
    } else {
      return false;
    }
    
    return @mysql_query($sql);
  }
}