<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class QuestionController extends Controller
{
  public $authErrors = array(
    'select' => 'Soru sorabilmek için giriş yapmalısın',
    'add' => 'Soru sorabilmek için giriş yapmalısın',
  );
  
  public function select()
  {
    if (!empty($_POST['firm']['id'])) {
      $this->redirect('question.php?s=ask&firm_id='.$_POST['firm']['id']);
      return;
    }
    if (!empty($_GET['firm_id'])) {
      $this->redirect('question.php?s=ask&firm_id='.$_GET['firm_id']);
      return;
    }
    $firms = $this->Firm->getFirms();
    $firmsJson = array();
    foreach ($firms as $f) {
      $firmsJson[] = array(
        'id' => $f['id'],
        'name' => $f['name'],
        'comment_count' => $f['comment_count'],
        'question_count' => $f['question_count'],
        'vote_count' => $f['vote_count']
      );
    }
    
    $data = array();
    $data['firms'] = $firms;
    $data['json'] = json_encode($firmsJson);
    $data['title'] = 'Soru için Firma Seç';
    $data['formAction'] = 'question.php?s=ask';
    $this->view->show('../ajax/select_firm.php', $data);
    // $this->load('Firm');
    // $data = array();
    // $orderby = array('name' => 'ASC');
    // $data['firms'] = $this->Firm->select(null, $orderby);
    // $this->view->show('select_form.php', $data);
  }
  
  public function ask()
  {
    if(empty($_GET['firm_id'])) {
      $this->redirect('question.php?s=select');
      return;
    }
    
    $id = filter_request($_GET['firm_id']);
    if (!is_numeric($id)) {
      $this->redirect('question.php?s=select');
      return;
    }
  
    $firms = $this->Firm->select(array('id' => $id));
    if (count($firms) == 0) {
      $this->redirect('question.php?s=select');
      return;
    }
    $firm = $firms[0];
    
    $this->load('Question');
    $this->load('QuestionForm');
    $rules = array(
      'question' => array(
        'notEmpty',
        'Daha soru yazmamışın'
      )
    );
    $this->QuestionForm->setRules($rules);
    
    if (!empty($_POST['question'])) {
      $questionData = filter_request($_POST['question']);
      if ($this->QuestionForm->validate($questionData)) {
        $user = $this->Account->getLogedinUser();
        $newQuestion = array(
          'question' => $questionData['question'],
          'answer_count' => 0,
          'user_id' => $user['id'],
          'firm_id' => $id,
          'created' => created_time(),
          'updated' => created_time()
        );
        
        $updatedFirmData = array(
          'question_count' => $firm['question_count'] + 1,
          'updated' => created_time()
        );
        
        if ($this->Firm->update($updatedFirmData, array('id' => $id))
            && $this->Question->insert($newQuestion)) {
          
          // send mail to users for question
          $questionId = $this->Question->lastInsertId();
          $emailData = array(
            'email' => $this->User->getQuestionRelatedEmails($id, $user['id']),
            'firm' => $firm,
            'question' => $this->Question->get($questionId)
          );
          $this->load('Emailer');
          $this->Emailer->sendQuestionMail($emailData);
          
          // log kaydı
          $logMessage = sprintf('Yeni Soru: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı yeni bir <a href="admin.php?s=view_question&question_id=%s">soru</a> sordu.', $user['id'], $user['email'], $questionId);
          $this->Loger->log('INFO', $logMessage);
          
          $this->redirect('comment.php?firm_id='.$id);
          return;
        }
      }
    }
    
    $data = array();
    $data['firm'] = $firm;
    $data['title'] = 'Soru sor:';
    $data['formAction'] = 'question.php?s=ask&firm_id='.$firm['id'];
    $data['questions'] = $this->Question->select(array('firm_id' => $id));
    $this->view->QuestionForm = $this->QuestionForm;
    $this->view->show('question_form.php', $data);
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
    
    $this->load('Question');
    $question = $this->Question->get($id);
    if (!$question || $question['deleted']) {
      $this->goback();
      return;
    }
    $firmId = $question['firm_id'];
    $userId = $question['user_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->goback();
      return;
    }
    
    $updatedQuestion = array(
      'deleted' => 1,
      'updated' => created_time()
    );
    
    $firm = array_pop($this->Firm->get($firmId));
    $updatedFirm = array(
      'question_count' => $firm['question_count']-1,
      'updated' => created_time()
    );
    
    if ($this->Question->update($updatedQuestion, array('id' => $id))
        && $this->Firm->update($updatedFirm, array('id' => $firmId))) {
      // Ben bunla bişi yaparım: silindi mesajı gösterebilirsin
      // log kaydı
      $logMessage = sprintf('Soru Silme: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı <a href="admin.php?s=view_question&question_id=%s">sorusunu</a> sildi.', $user['id'], $user['email'], $id);
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
    
    $this->load('Question');
    $question = $this->Question->get($id);
    if (!$question || $question['deleted']) {
      $this->goback();
      return;
    }
    $firmId = $question['firm_id'];
    $userId = $question['user_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->goback();
      return;
    }
    
    $this->load('QuestionForm');
    $rules = array(
      'question' => array(
        'notEmpty',
        'Daha soru yazmamışın'
      )
    );
    $this->QuestionForm->setRules($rules)
                       ->setFormData($question);
    
    if (!empty($_POST['question'])) {
      $questionData = filter_request($_POST['question']);
      if ($this->QuestionForm->validate($questionData)) {
        $updatedQuestion = array(
          'question' => $questionData['question'],
          'updated' => created_time()
        );
        
        if ($this->Question->update($updatedQuestion, array('id' => $id))) {
          $this->redirect('comment.php?firm_id='.$firmId);
          return;
        }
      }
    }
    
    $data['firm'] = $this->Firm->get($firmId);
    $data['question'] = $question;
    $data['title'] = 'Sorunu düzenle:';
    $data['formAction'] = 'question.php?s=edit&id='.$id;
    $this->view->QuestionForm = $this->QuestionForm;
    $this->view->show('question_form.php', $data);
  }
}