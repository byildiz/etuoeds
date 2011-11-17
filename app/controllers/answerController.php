<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class AnswerController extends Controller
{
  public $authErrors = array(
    'reply' => 'Sorulara cevap yazmak için giriş yapmalısın'
  );
  
  public function reply()
  {
    if(empty($_GET['question_id'])) {
      $this->redirect('comment.php');
      return;
    }
    
    $id = filter_request($_GET['question_id']);
    if (!is_numeric($id)) {
      $this->redirect('comment.php');
      return;
    }
    
    $this->load('Question');
    $question = $this->Question->get($id);
    if (!$question || $question['deleted']) {
      $this->redirect('comment.php');
      return;
    }
    $firm = $this->Firm->get($question['firm_id']);
    
    $this->load('Answer');
    $this->load('AnswerForm');
    $rules = array(
      'answer' => array(
        'notEmpty',
        'Heralde cevap yazmayı unuttun'
      )
    );
    $this->AnswerForm->setRules($rules);
    
    if (!empty($_POST['answer'])) {
      $answerData = filter_request($_POST['answer']);
      if ($this->AnswerForm->validate($answerData)) {
        $user = $this->Account->getLogedinUser();
        $newAnswer = array(
          'answer' => $answerData['answer'],
          'user_id' => $user['id'],
          'question_id' => $id,
          'created' => created_time(),
          'updated' => created_time()
        );
        
        $updatedQuestion = array(
          'answer_count' => $question['answer_count'] + 1,
          'updated' => created_time()
        );
        
        if ($this->Question->update($updatedQuestion, array('id' => $id))
            && $this->Answer->insert($newAnswer)) {
          
          // send mail to users for reply
          $answerId = $this->Answer->lastInsertId();
          $emailData = array(
            'email' => $this->User->getAnswerRelatedEmails($id, $user['id']),
            'firm' => $firm,
            'answer' => $this->Answer->get($answerId),
            'question' => $question
          );
          $this->load('Emailer');
          $this->Emailer->sendReplyMail($emailData);
          
          // log kaydı
          $logMessage = sprintf('Yeni Cevap: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı yeni bir <a href="admin.php?s=view_answer&answer_id=%s">cevap</a> yazdı.', $user['id'], $user['email'], $answerId);
          $this->Loger->log('INFO', $logMessage);
          
          $this->redirect('comment.php?firm_id='.$question['firm_id']);
          return;
        }
      }
    }
    
    // oyları seç
    $user = $this->Account->getLogedinUser();
    $userId = $user['id'];
    $this->load('Vote');
    $firmVote = $this->Vote->getUserFirmVote($userId, $id);
    $questionsVotes = $this->Vote->getUserQuestionsVotes($userId);
    $votedQuestionIds = array();
    foreach ($questionsVotes as $qv) $votedQuestionIds[] = $qv['object_id'];
    $answersVotes = $this->Vote->getUserAnswersVotes($userId);
    $votedAnswerIds = array();
    foreach ($answersVotes as $av) $votedAnswerIds[] = $av['object_id'];
    
    $data = array();
    $question['answers'] = $this->Answer->select(array('question_id' => $question['id']));
    $data['question'] = $question;
    $data['firm'] = $firm;
    $data['votedAnswerIds'] = $votedAnswerIds;
    $data['votedQuestionIds'] = $votedQuestionIds;
    $data['isFirmVoted'] = ($firmVote != null);
    $this->view->show('reply_form.php', $data);
  }
  
  public function delete()
  {
    if(empty($_GET['id'])) {
      $this->goback();
      return;
    }
    
    $id = filter_request($_GET['id']);
    if (!is_numeric($id)) {
      $this->goback();
      return;
    }
    
    $this->load('Answer');
    $answer = $this->Answer->get($id);
    if (!$answer || $answer['deleted']) {
      $this->goback();
      return;
    }
    $questionId = $answer['question_id'];
    $userId = $answer['user_id'];
    
    $this->load('Question');
    $question = $this->Question->get($questionId);
    if ($question['deleted']) {
      $this->goback();
      return;
    }
    $firmId = $question['firm_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->goback();
      return;
    }
    
    $updatedAnswer = array(
      'deleted' => 1,
      'updated' => created_time()
    );
    
    $updatedQuestion = array(
      'answer_count' => $question['answer_count']-1,
      'updated' => created_time()
    );
    
    if ($this->Answer->update($updatedAnswer, array('id' => $id))
        && $this->Question->update($updatedQuestion, array('id' => $questionId))) {
      // Ben bunla bişi yaparım: silindi mesajı gösterebilirsin
      // log kaydı
      $logMessage = sprintf('Cevap Silme: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı <a href="admin.php?s=view_answer&answer_id=%s">cevabını</a> sildi.', $user['id'], $user['email'], $id);
      $this->Loger->log('INFO', $logMessage);
    }
    
    $this->redirect('comment.php?firm_id='.$firmId);
  }
  
  public function edit()
  {
    if(empty($_GET['id'])) {
      $this->goback();
      return;
    }
    
    $id = filter_request($_GET['id']);
    if (!is_numeric($id)) {
      $this->goback();
      return;
    }
    
    $this->load('Answer');
    $answer = $this->Answer->get($id);
    if (!$answer || $answer['deleted']) {
      $this->goback();
      return;
    }
    $questionId = $answer['question_id'];
    $userId = $answer['user_id'];
    
    $this->load('Question');
    $question = $this->Question->get($questionId);
    if ($question['deleted']) {
      $this->goback();
      return;
    }
    $firmId = $question['firm_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->goback();
      return;
    }
    
    $this->load('AnswerForm');
    $rules = array(
      'answer' => array(
        'notEmpty',
        'Heralde cevap yazmayı unuttun'
      )
    );
    $this->AnswerForm->setRules($rules)
                     ->setFormData($answer);
    
    if (!empty($_POST['answer'])) {
      $answerData = filter_request($_POST['answer']);
      if ($this->AnswerForm->validate($answerData)) {
        $updatedAnswer = array(
          'answer' => $answerData['answer'],
          'updated' => created_time()
        );
        
        if ($this->Answer->update($updatedAnswer, array('id' => $id))) {
          $this->redirect('comment.php?firm_id='.$firmId);
          return;
        }
      }
    }
    
    $data['firm'] = $this->Firm->get($firmId);
    $data['question'] = $question;
    $data['formAction'] = 'answer.php?s=edit&id='.$id;
    $this->view->AnswerForm = $this->AnswerForm;
    $this->view->show('answer_form.php', $data);
  }
}