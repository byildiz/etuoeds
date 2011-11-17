<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Firm extends Model
{
  public $tableName = 'firms';
  
  public function getFirms($where = null, $orderBy = null)
  {
    $orderBy = ($orderBy == null) ? array('name' => 'ASC') : $orderBy;
    return $this->select($where, $orderBy);
  }
  
  public function getLastCommentedFirms($limit = 10)
  {
    $sql = 'SELECT oeds_firms.id, oeds_firms.name, oeds_comments.id as comment_id, oeds_comments.comment '
           .'FROM oeds_firms INNER JOIN oeds_comments ON oeds_comments.firm_id = oeds_firms.id '
           .'WHERE oeds_comments.deleted = 0 AND oeds_comments.parent_id = 0 '
           .'ORDER BY oeds_comments.created DESC '
           .'LIMIT '.$limit;
    return $this->selectQuery($sql);
  }
  
  public function getLastAskedFirms($limit = 10)
  {
    $sql = 'SELECT oeds_firms.id, oeds_firms.name, oeds_questions.id as question_id, oeds_questions.question '
           .'FROM oeds_firms INNER JOIN oeds_questions ON oeds_questions.firm_id = oeds_firms.id '
           .'WHERE oeds_questions.deleted = 0 ORDER BY oeds_questions.created DESC LIMIT '.$limit;
    return $this->selectQuery($sql);
  }
  
  public function isNotDeleted($firmId)
  {
    $where = array(
      'id' => $firmId,
      'deleted' => 0
    );
    $firms = $this->select($where);
    return !empty($firms);
  }
}