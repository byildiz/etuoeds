<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Answer extends Model
{
  public $tableName = 'answers';
  
  public function getQuestionAnswers($questionId)
  {
    $where = array(
      'question_id' => $questionId,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserAnswers($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserAnswersWithQuestionAndFirm($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    $answers = $this->select($where);
    $this->app->load('Question');
    $this->app->load('Firm');
    foreach ($answers as &$a) {
      $a['question'] = $this->app->Question->get($a['question_id']);
      $a['firm'] = $this->app->Firm->get($a['question']['firm_id']);
    }
    return $answers;
  }
}