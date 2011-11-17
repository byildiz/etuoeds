<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class User extends Model
{
  public $tableName = 'users';
  
  public function validateUser($email, $code)
  {
    if (empty($email) || empty($code)) {
      return false;
    }
    
    $where = array('email' => $email, 'code' => $code);
    
    $users = $this->select($where);
    if (count($users) <= 0) {
      return false;
    }
    
    $updatedData = array(
      'validated' => 1,
      'updated' => created_time()
    );
    
    $this->update($updatedData, array('id' => $users[0]['id']));
    
    return true;
  }
  
  public function getQuestionOwner($questionId, $logedinUserId)
  {
    $sql = sprintf('SELECT email FROM oeds_users INNER JOIN oeds_questions ON oeds_questions.user_id = oeds_users.id WHERE oeds_questions.id = %s AND oeds_questions.deleted = 0 AND oeds_users.id != %s', $questionId, $logedinUserId);
    $users = $this->selectQuery($sql);
    $emails = array();
    foreach ($users as $u)
      $emails[] = $u['email'];
    return array_unique($emails);
  }
  
  public function getAnswersOwners($questionId, $logedinUserId)
  {
    $sql = sprintf('SELECT email FROM oeds_users INNER JOIN oeds_answers ON oeds_answers.user_id = oeds_users.id WHERE oeds_answers.question_id = %s AND oeds_answers.deleted = 0 AND oeds_users.id != %s', $questionId, $logedinUserId);
    $users = $this->selectQuery($sql);
    $emails = array();
    foreach ($users as $u)
      $emails[] = $u['email'];
    return array_unique($emails);
  }
  
  public function getAnswerRelatedEmails($questionId, $logedinUserId)
  {
    $emails = array_merge($this->getAnswersOwners($questionId, $logedinUserId),
                          $this->getQuestionOwner($questionId, $logedinUserId));
    return array_unique($emails);
  }
  
  public function getQuestionRelatedEmails($firmId, $logedinUserId)
  {
    $sql = sprintf('SELECT email FROM oeds_users INNER JOIN oeds_comments ON oeds_comments.user_id = oeds_users.id WHERE oeds_comments.firm_id = %s AND oeds_comments.deleted = 0 AND oeds_users.id != %s', $firmId, $logedinUserId);
    $users = $this->selectQuery($sql);
    $emails = array();
    foreach ($users as $u)
      $emails[] = $u['email'];
    return array_unique($emails);
  }
  
  public function getCommentRelatedEmails($firmId, $logedinUserId)
  {
    $sql = sprintf('SELECT email FROM oeds_users INNER JOIN oeds_questions ON oeds_questions.user_id = oeds_users.id WHERE oeds_questions.firm_id = %s AND oeds_questions.deleted = 0 AND oeds_users.id != %s', $firmId, $logedinUserId);
    $users = $this->selectQuery($sql);
    $emails = array();
    foreach ($users as $u)
      $emails[] = $u['email'];
    return array_unique($emails);
  }
  
  public function getReviewRelatedEmails($parentId, $parentUserId, $logedinUserId)
  {
    $sql = sprintf('SELECT email FROM oeds_users INNER JOIN oeds_comments ON oeds_comments.user_id = oeds_users.id WHERE oeds_comments.parent_id = %s AND oeds_comments.deleted = 0 AND oeds_users.id != %s AND oeds_users.id != %s', $parentId, $parentUserId, $logedinUserId);
    $users = $this->selectQuery($sql);
    $emails = array();
    foreach ($users as $u)
      $emails[] = $u['email'];
    return array_unique($emails);
  }
  
  public function getAnswerToQuestionEmails($answerId)
  {
    $this->app->load('Answer');
    $answer = $this->app->Answer->get($answerId);
    $sql = sprintf('SELECT email FROM oeds_users INNER JOIN oeds_questions ON oeds_questions.user_id = oeds_users.id WHERE oeds_questions.id = %s AND oeds_questions.deleted = 0', $answer['question_id']);
    $users = $this->selectQuery($sql);
    $emails = array();
    foreach ($users as $u)
      $emails[] = $u['email'];
    return array_unique($emails);
  }
  
  public function getCommentToQuestionUsers($commentId)
  {
    // değerlendirmeyi bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $comment = $commentModel->get($commentId);
    
    // soruları bul
    $this->app->load('Question');
    $questionModel = $this->app->Question;
    $where = array(
      'firm_id' => $comment['firm_id'],
    );
    $questions = $questionModel->select($where);
    
    // kullanıcıları bul
    $users = array();
    foreach ($questions as $q) {
      $users[] = $this->get($q['user_id']);
    }
    
    return $users;
  }
  
  public function getCommentToHistoryUsers($commentId)
  {
    // değerlendirmeyi bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $comment = $commentModel->get($commentId);
    
    // histories bul
    $this->app->load('Match');
    $matchModel = $this->app->Match;
    $histories = $matchModel->getFirmHistories($comment['firm_id']);
    
    // kullanıcıları bul
    $users = array();
    foreach ($histories as $h) {
      $users[] = $this->get($h['user_id']);
    }
    
    return $users;
  }
  
  public function getCommentToWishUsers($commentId)
  {
    // değerlendirmeyi bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $comment = $commentModel->get($commentId);
    
    // wishes bul
    $this->app->load('Match');
    $matchModel = $this->app->Match;
    $wishes = $matchModel->getFirmWishes($comment['firm_id']);
    
    // kullanıcıları bul
    $users = array();
    foreach ($wishes as $w) {
      $users[] = $this->get($w['user_id']);
    }
    
    return $users;
  }
  
  public function getReviewToReviewVoteUsers($reviewId)
  {
    // yorumu bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $review = $commentModel->get($reviewId);
    
    // diğer yorumları bul
    $where = array(
      'parent_id' => $review['parent_id'],
      'id' => '!= '.$reviewId,
      'deleted' => 0,
    );
    $reviews = $commentModel->select($where);
    
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    
    $users = array();
    foreach ($reviews as $r) {
      $where = array(
        'object_name' => 'comment',
        'object_id' => $r['id'],
        'deleted' => 0,
      );
      $votes = $voteModel->select($where);
      foreach ($votes as $v) {
        $users[] = $this->get($v['user_id']);
      }
    }
    
    return $users;
  }
  
  public function getReviewToReviewUsers($reviewId)
  {
    // yorumu bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $review = $commentModel->get($reviewId);
    
    // diğer yorumları bul
    $where = array(
      'parent_id' => $review['parent_id'],
      'id' => '!= '.$reviewId,
      'deleted' => 0,
    );
    $reviews = $commentModel->select($where);
    
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    
    $users = array();
    foreach ($reviews as $r) {
      $users[] = $this->get($r['user_id']);
    }
    
    return $users;
  }
  
  public function getReviewToCommentVoteUsers($reviewId)
  {
    // yorumu bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $review = $commentModel->get($reviewId);
    
    // değerlendirmeyi bul
    $comment = $commentModel->get($review['parent_id']);
    
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    $where = array(
      'object_name' => 'comment',
      'object_id' => $comment['id'],
      'deleted' => 0,
    );
    $votes = $voteModel->select($where);
    
    $users = array();
    foreach ($votes as $v) {
      $users[] = $this->get($v['user_id']);
    }
    
    return $users;
  }
  
  public function getReviewToCommentUsers($reviewId)
  {
    // yorumu bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $review = $commentModel->get($reviewId);
    
    // değerlendirmeyi bul
    $comment = $commentModel->get($review['parent_id']);
    
    $users = array();
    $users[] = $this->get($comment['user_id']);
    
    return $users;
  }
}