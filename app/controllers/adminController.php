<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class AdminController extends Controller
{
  public function index()
  {
    $this->view->show('index.php');
  }
  
  public function allemail()
  {
    $emails = explode("\n", file_get_contents($this->config['mailConfig']['allEmailsFile']));
    $emails = array_chunk($emails, 25);
    for ($i = 0; $i < count($emails); $i++) {
      echo '<a href="admin.php?s=send&chunk='.$i.'">'.$i.'. chunk</a> * ';
    }
  }
  
  public function send()
  {
    $emails = explode("\n", file_get_contents($this->config['mailConfig']['allEmailsFile']));
    $emails = array_chunk($emails, 25);
    $this->load('Emailer');
    if (!$this->Emailer->sendIntroMail(array('email' => $emails[$_GET['chunk']])))
      echo 'gonderilemedi!';
    else
      $this->redirect('admin.php?s=allemail');
  }
  
  public function send_validation()
  {
    if (isset($_GET['user_id'])) {
      $userId = $_GET['user_id'];
      $user = $this->User->get($userId);
      if ($user) {
        $this->load('Emailer');
        $emailData = array(
          'email' => $user['email'],
          'user' => $user
        );
        $this->Emailer->sendValidationMail($emailData);
        $infoData = array(
          'title' => 'Doğrulama E-postası',
          'message' => 'Gönderildi: '.$user['email'].' <a href="admin.php">Yönetici Anasayfası</a>'
        );
        $this->info('info.php', $infoData);
      }
    }
    $this->redirect('admin.php');
  }
  
  public function users()
  {
    $users = $this->User->select(null, array('created' => 'DESC'));
    $userCount = count($users);
    $data = array();
    $this->view->show('users.php', compact(array('users', 'userCount')));
  }
  
  public function validate_user()
  {
    if (isset($_GET['user_id'])) {
      $userId = $_GET['user_id'];
      $user = $this->User->get($userId);
      if ($user) {
        $this->User->validateUser($user['email'], $user['code']);
        $updatedUser = array(
          'code' => rand_str(),
          'updated' => created_time()
        );
        
        if ($this->User->update($updatedUser, array('id' => $user['id']))) {
          $infoData = array(
            'title' => 'Kullanıcı Doğrulama',
            'message' => 'Doğrulandı: '.$user['email'].' <a href="admin.php">Yönetici Anasayfası</a>'
          );
          $this->info('info.php', $infoData);
          return;
        }
      }
    }
    $this->redirect('admin.php');
  }
  
  public function calculate_counts()
  {
    $this->load('Question');
    $this->load('Answer');
    $this->load('Comment');
    $this->load('Vote');
    
    $firms = $this->Firm->getFirms();
    foreach ($firms as $f) {
      $commentCount = count($this->Comment->getFirmComments($f['id']));
      $questionCount = count($this->Question->getFirmQuestions($f['id']));
      $voteCount = count($this->Vote->getFirmVotes($f['id']));
      $updatedFirm = array(
        'comment_count' => $commentCount,
        'question_count' => $questionCount,
        'vote_count' => $voteCount
      );
      $this->Firm->update($updatedFirm, $f['id']);
    }
    
    $questions = $this->Question->select(array('deleted' => 0));
    foreach ($questions as $q) {
      $updatedQuestion = array(
        'answer_count' => $this->Answer->getQuestionAnswers($q['id'])
      );
      $this->Question->update($updatedQuestion, $q['id']);
    }
    $infoData = array(
      'title' => 'Değerlendirme, Soru ve Cevap',
      'message' => 'Değerlendirme, soru ve cevap sayıları yeniden hesaplandı!<br/>Yönetim sayfasına {<a class="underline" href="admin.php">dön</a>}'
    );
    $this->info('info.php', $infoData);
  }
  
  public function logs()
  {
    $this->load('Log');
    $logs = $this->Log->getLogs();
    $data = compact(
      'logs'
    );
    $this->view->show('logs.php', $data);
  }
  
  public function view_comment()
  {
    $commentId = $_GET['comment_id'];
    $this->load('Comment');
    $comment = $this->Comment->get($commentId);
    if (!$comment) {
      $this->goback();
      return;
    }
    $data = compact('comment');
    $this->view->show('view_comment.php', $data);
  }
  
  public function view_firm()
  {
    $firmId = $_GET['firm_id'];
    $this->load('Firm');
    $firm = $this->Firm->get($firmId);
    if (!$firm) {
      $this->goback();
      return;
    }
    $data = compact('firm');
    $this->view->show('view_firm.php', $data);
  }
  
  public function view_answer()
  {
    $answerId = $_GET['answer_id'];
    $this->load('Answer');
    $answer = $this->Answer->get($answerId);
    if (!$answer) {
      $this->goback();
      return;
    }
    $data = compact('answer');
    $this->view->show('view_answer.php', $data);
  }
  
  public function view_question()
  {
    $questionId = $_GET['question_id'];
    $this->load('Question');
    $question = $this->Question->get($questionId);
    if (!$question) {
      $this->goback();
      return;
    }
    $data = compact('question');
    $this->view->show('view_question.php', $data);
  }
  
  public function view_user()
  {
    $userId = $_GET['user_id'];
    $this->load('User');
    $user = $this->User->get($userId);
    if (!$user) {
      $this->goback();
      return;
    }
    $data = compact('user');
    $this->view->show('view_user.php', $data);
  }
  
  public function prepare_mail()
  {
    if (!empty($_POST)) {
      $data = filter_request($_POST);
      if (!isset($data['to'])
          || !isset($data['subject'])
          || !isset($data['body'])
          || $data['to'] == ''
          || $data['subject'] == ''
          || $data['body'] == '') {
        $this->Message->set('Admin.Mail', 'Gerekli alanları doldur!');
      } else {
        $mail = array(
          'to' => $data['to'],
          'subject' => $data['subject'],
          'body' => nl2br($data['body']),
        );
        if (isset($data['priority']) && $data['priority'] != '') {
          $mail['priority'] = $data['priority'];
        }
        $this->load('Emailer');
        $this->Emailer->queue($mail);
        $this->redirect('admin.php?s=queue_mail');
      }
    }
    $this->view->show('prepare_mail.php');
  }
  
  public function queue_mail()
  {
    $this->view->show('queue_mail.php');
  }
}