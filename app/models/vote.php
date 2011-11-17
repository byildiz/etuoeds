<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Vote extends Model
{
  public $tableName = 'votes';
  
  public function getUserVotes($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserVotesWithObjects($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    $votes = $this->select($where);
    foreach ($votes as &$v) {
      $objectClass = ucfirst($v['object_name']);
      $this->app->load($objectClass);
      $v['object'] = $this->app->{$objectClass}->get($v['object_id']);
    }
    return $votes;
  }
  
  public function getUserFirmVote($userId, $firmId)
  {
    $where = array(
      'user_id' => $userId,
      'object_id' => $firmId,
      'object_name' => 'firm',
      'deleted' => 0
    );
    return array_pop($this->select($where));
  }
  
  public function getUserCommentsVotes($userId)
  {
    $where = array(
      'user_id' => $userId,
      'object_name' => 'comment',
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserQuestionsVotes($userId)
  {
    $where = array(
      'user_id' => $userId,
      'object_name' => 'question',
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserAnswersVotes($userId)
  {
    $where = array(
      'user_id' => $userId,
      'object_name' => 'answer',
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserObjectVote($userId, $objectName, $objectId)
  {
    $where = array(
      'object_name' => $objectName,
      'object_id' => $objectId,
      'user_id' => $userId,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserDeletedObjectVote($userId, $objectName, $objectId)
  {
    $where = array(
      'object_name' => $objectName,
      'object_id' => $objectId,
      'user_id' => $userId,
      'deleted' => 1
    );
    return $this->select($where);
  }
  
  public function getFirmVotes($firmId)
  {
    $where = array(
      'object_id' => $firmId,
      'object_name' => 'firm',
      'deleted' => 0
    );
    return $this->select($where);
  }
}