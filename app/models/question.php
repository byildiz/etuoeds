<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Question extends Model
{
  public $tableName = 'questions';
  
  public function getFirmQuestions($firmId)
  {
    $where = array(
      'firm_id' => $firmId,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getLastQuestions($limit = 10)
  {
    $where = array(
      'deleted' => 0
    );
    $orderBy = array(
      'updated' => 'DESC'
    );
    return $this->select($where, $orderBy, $limit);
  }
  
  public function getLastAnsweredQuestions($limit = 10)
  {
    $sql = 'SELECT oeds_answers.id, oeds_answers.answer, oeds_questions.id as question_id, oeds_questions.question as question_question, oeds_firms.name as firm_name, oeds_firms.id as firm_id '
           .'FROM oeds_answers '
           .'INNER JOIN oeds_questions ON oeds_answers.question_id = oeds_questions.id '
           .'INNER JOIN oeds_firms ON oeds_questions.firm_id = oeds_firms.id '
           .'WHERE oeds_questions.deleted = 0 AND oeds_answers.deleted = 0 '
           .'ORDER BY oeds_answers.created DESC LIMIT '.$limit;
    return $this->selectQuery($sql);
  }
  
  public function getUserQuestions($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    return $this->select($where);
  }
  
  public function getUserQuestionsWithAnswersAndFirm($userId)
  {
    $where = array(
      'user_id' => $userId,
      'deleted' => 0
    );
    $questions = $this->select($where);
    $this->app->load('Answer');
    $this->app->load('Firm');
    foreach ($questions as &$q) {
      $q['firm'] = $this->app->Firm->get($q['firm_id']);
      $q['answers'] = $this->app->Answer->getQuestionAnswers($q['id']);
    }
    return $questions;
  }
  
  public function getUserAnsweredQuestions($userId)
  {
    $sql = 'SELECT DISTINCT oeds_answers.question_id '
           .'FROM oeds_answers '
           .'INNER JOIN oeds_questions ON oeds_questions.id = oeds_answers.question_id '
           .'WHERE oeds_answers.user_id = '.$userId.' AND oeds_questions.user_id != '.$userId.' ';
    $this->app->load('Answer');
    $this->app->load('Firm');
    $answers = $this->app->Answer->selectQuery($sql);
    $questions = array();
    foreach ($answers as $a) {
      $question = $this->get($a['question_id']);
      $question['answers'] = $this->app->Answer->getQuestionAnswers($question['id']);
      $question['firm'] = $this->app->Firm->get($question['firm_id']);
      $question['isAnswer'] = true;
      $questions[] = $question;
    }
    return $questions;
  }
}