<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class VoteController extends Controller
{
  public function index()
  {
    $objectArray = $this->_getObject();
    if ($objectArray === false) {
      $this->goback();
      return;
    }
    list($object, $objectName, $objectId) = $objectArray;
    $user = $this->Account->getLogedinUser();
    $userId = $user['id'];
    
    if ($objectName != 'firm' && $userId == $object['user_id']) { // object kendine ait
      $this->goback();
      return;
    }
    
    $deletedVotes = $this->Vote->getUserDeletedObjectVote($userId, $objectName, $objectId);
    if (count($deletedVotes) != 0) { // daha önceden silinmiş oyu düzenle
      $deletedVote = $deletedVotes[0];
      $updatedVote = array(
        'deleted' => 0,
        'updated' => created_time()
      );
      $this->Vote->update($updatedVote, $deletedVote['id']);
    } else {
      $votes = $this->Vote->getUserObjectVote($userId, $objectName, $objectId);
      if (count($votes) != 0) { // daha önceden oy kullanmış
        $this->goback();
        return;
      }
      
      $newVote = array(
        'object_name' => $objectName,
        'object_id' => $objectId,
        'user_id' => $userId,
        'created' => created_time(),
        'updated' => created_time()
      );
      $this->Vote->insert($newVote);
    }
    
    $objectClass = ucfirst($objectName);
    $updatedObject = array(
      'vote_count' => $object['vote_count']+1,
      'updated' => created_time()
    );
    $this->{$objectClass}->update($updatedObject, $objectId);
    
    // log kaydı
    $logMessage = sprintf('Yeni Oy: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı <a href="admin.php?s=view_%s&%s_id=%s">şuna</a> oy verdi.', $userId, $user['email'], $objectName, $objectName, $objectId);
    $this->Loger->log('INFO', $logMessage);
    
    $this->goback();
  }
  
  public function delete()
  {
    $objectArray = $this->_getObject();
    if ($objectArray === false) {
      $this->goback();
      return;
    }
    list($object, $objectName, $objectId) = $objectArray;
    $user = $this->Account->getLogedinUser();
    $userId = $user['id'];
    
    if ($objectName != 'firm' && $userId == $object['user_id']) { // object kendine ait, boşa vakit kaybetme
      $this->goback();
      return;
    }
    
    $votes = $this->Vote->getUserObjectVote($userId, $objectName, $objectId);
    if (count($votes) == 0) { // silinecek oy yok, neyi silim
      $this->goback();
      return;
    }
    $vote = $votes[0];
    
    $updatedVote = array(
      'deleted' => 1,
      'updated' => created_time()
    );
    $this->Vote->update($updatedVote, $vote['id']);
    
    $objectClass = ucfirst($objectName);
    $updatedObject = array(
      'vote_count' => $object['vote_count']-1,
      'updated' => created_time()
    );
    $this->{$objectClass}->update($updatedObject, $objectId);
    
    // log kaydı
    $logMessage = sprintf('Oy Silme: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı <a href="admin.php?s=view_%s&%s_id=%s">şuna</a> oyunu sildi.', $userId, $user['email'], $objectName, $objectName, $objectId);
    $this->Loger->log('INFO', $logMessage);
    
    $this->goback();
  }
  
  private function _getObject()
  {
    $this->load('Comment');
    $this->load('Question');
    $this->load('Answer');
    $this->load('Firm');
    $this->load('Vote');
    
    $objectName = '';
    $objectId = 0;
    $object = null;
    if (empty($_GET['comment_id'])
        && empty($_GET['question_id'])
        && empty($_GET['answer_id'])
        && empty($_GET['firm_id'])) {
      return false;
    } else if (!empty($_GET['comment_id'])) { // oy değerlendirme için
      $commentId = filter_request($_GET['comment_id']);
      if (!is_numeric($commentId)) {
        return false;
      }
      
      $comment = $this->Comment->get($commentId);
      if (!$comment || $comment['deleted']) {
        return false;
      }
      $objectName = 'comment';
      $objectId = $comment['id'];
      $object = $comment;
    } else if (!empty($_GET['question_id'])) { // oy soru için
      $questionId = filter_request($_GET['question_id']);
      if (!is_numeric($questionId)) {
        return false;
      }
      
      $question = $this->Question->get($questionId);
      if (!$question || $question['deleted']) {
        return false;
      }
      $objectName = 'question';
      $objectId = $question['id'];
      $object = $question;
    } else if (!empty($_GET['answer_id'])) { // oy cevap için
      $answerId = filter_request($_GET['answer_id']);
      if (!is_numeric($answerId)) {
        return false;
      }
      
      $answer = $this->Answer->get($answerId);
      if (!$answer || $answer['deleted']) {
        return false;
      }
      $objectName = 'answer';
      $objectId = $answer['id'];
      $object = $answer;
    } else if (!empty($_GET['firm_id'])) { // oy firma için
      $firmId = filter_request($_GET['firm_id']);
      if (!is_numeric($firmId) || $firmId == 1) {
        return false;
      }
      
      $firm = $this->Firm->get($firmId);
      if (!$firm) {
        return false;
      }
      $objectName = 'firm';
      $objectId = $firm['id'];
      $object = $firm;
    }
    
    return array($object, $objectName, $objectId);
  }
}