<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Comment extends Model
{
  public $tableName = 'comments';
  
  public function getFirmComments($firmId)
  {
    $where = array(
      'firm_id' => $firmId,
      'parent_id' => 0,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getLastComments($limit = 10)
  {
    $where = array(
      'parent_id' => 0,
      'deleted' => 0
    );
    $orderBy = array(
      'updated' => 'DESC'
    );
    return $this->select($where, $orderBy, $limit);
  }
  
  public function getUserComments($userId)
  {
    $where = array(
      'user_id' => $userId,
      'parent_id' => 0,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserCommentsWithFirm($userId)
  {
    $where = array(
      'user_id' => $userId,
      'parent_id' => 0,
      'deleted' => 0
    );
    $comments = $this->select($where);
    $this->app->load('Firm');
    foreach ($comments as &$c) {
      $c['firm'] = $this->app->Firm->get($c['firm_id']);
    }
    return $comments;
  }
  
  public function getCommentReviews($parentId)
  {
    $where = array(
      'parent_id' => $parentId,
      'deleted' => 0
    );
    $orderBy = array(
      'created' => 'ASC'
    );
    return $this->select($where, $orderBy);
  }
}