<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Match extends Model
{
  public $tableName = 'matches';
  
  public function getUserMatches($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    $orderBy = array(
      'updated' => 'ASC'
    );
    return $this->select($where, $orderBy);
  }
  
  public function getUserHistories($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0,
      'wish' => 0,
    );
    $orderBy = array(
      'updated' => 'ASC'
    );
    return $this->select($where, $orderBy);
  }
  
  public function getUserWishes($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0,
      'wish' => 1,
    );
    $orderBy = array(
      'updated' => 'ASC'
    );
    return $this->select($where, $orderBy);
  }
  
  public function getFirmHistories($firmId)
  {
    $where = array(
      'firm_id' => $firmId,
      'deleted' => 0,
      'wish' => 0,
    );
    $orderBy = array(
      'updated' => 'ASC'
    );
    return $this->select($where, $orderBy);
  }
  
  public function getFirmWishes($firmId)
  {
    $where = array(
      'firm_id' => $firmId,
      'deleted' => 0,
      'wish' => 1,
    );
    $orderBy = array(
      'updated' => 'ASC'
    );
    return $this->select($where, $orderBy);
  }
  
  public function addMatch($firmId, $userId, $wish = 0)
  {
    // ortak eğitim sistemi firma değildir
    if ($firmId == 1)
      return false;
    
    if (!$this->app->Firm->isNotDeleted($firmId))
      return false;
    
    $where = array(
      'firm_id' => $firmId,
      'user_id' => $userId,
      'wish' => $wish,
    );
    $match = array_pop($this->select($where));
    if ($match && $match['deleted'] == 1) {
      $updated = array(
        'deleted' => 0,
        'updated' => created_time()
      );
      $this->update($updated, array('id' => $match['id']));
    } else if (!$match) {
      $newMatch = array(
        'user_id' => $userId,
        'firm_id' => $firmId,
        'wish' => $wish,
        'updated' => created_time(),
        'created' => created_time()
      );
      $this->insert($newMatch);
    }
    return true;
  }
  
  public function deleteMatch($firmId, $userId, $wish = 0)
  {
    if (!$this->app->Firm->isNotDeleted($firmId)) {
      return false;
    }
    
    $where = array(
      'firm_id' => $firmId,
      'user_id' => $userId,
      'wish' => $wish,
    );
    $match = array_pop($this->select($where));
    if ($match && $match['deleted'] == 0) {
      $updated = array(
        'deleted' => 1,
        'updated' => created_time()
      );
      $this->update($updated, array('id' => $match['id']));
    }
    return true;
  }
}