<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Emailer extends Email
{
  // Gönderilecek maillar öncelik sırasının tersine olmalı
  // Örn: Değerlendirmenin sahibi kendi değerlendirmesine yorum yazmış olsun.
  //      Bu değerlendirmeye yeni bir yorum yazıldığında değerlendirme sahibine
  //      yorumunda dolayı değilde değerlendirmesinden dolayı mail gitmesi için
  //      arrayde review_to_comment review_to_review'dan sonra olmalıdır.
  public $notificationData = array(
    'newComment' => array(
      array(
        'getCommentToWishUsers',
        'comment_to_wish_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getCommentToHistoryUsers',
        'comment_to_history_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getCommentToQuestionUsers',
        'comment_to_question_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newReview' => array(
      array(
        'getReviewToReviewVoteUsers',
        'review_to_reviewVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getReviewToCommentVoteUsers',
        'review_to_commentVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getReviewToReviewUsers',
        'review_to_review_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getReviewToCommentUsers',
        'review_to_comment_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newQuestion' => array(
      array(
        'getQuestionToCommentVoteUsers',
        'question_to_commentVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionToAnswerUsers',
        'question_to_answer_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionToHistoryUsers',
        'question_to_history_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionToCommentUsers',
        'question_to_comment_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newAnswer' => array(
      array(
        'getAnswerToHistoryUsers',
        'answer_to_history_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerToWishUsers',
        'answer_to_wish_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerToAnswerVoteUsers',
        'answer_to_answerVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerToAnswerUsers',
        'answer_to_answer_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerToQuestionVoteUsers',
        'answer_to_questionVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerToQuestionUsers',
        'answer_to_question_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newFirmVote' => array(
      array(
        'getFirmVoteToFirmVoteUsers',
        'firmVote_to_firmVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getFirmVoteToWishUsers',
        'firmVote_to_wish_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getFirmVoteToQuestionUsers',
        'firmVote_to_question_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getFirmVoteToCommentUsers',
        'firmVote_to_comment_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newCommentVote' => array(
      array(
        'getCommentVoteToWishUsers',
        'commentVote_to_wish_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getCommentVoteToHistoryUsers',
        'commentVote_to_history_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getCommentVoteToCommentVoteUsers',
        'commentVote_to_commentVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getCommentVoteToCommentUsers',
        'commentVote_to_comment_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newReviewVote' => array(
      array(
        'getReviewVoteToReviewVoteUsers',
        'reviewVote_to_reviewVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getReviewVoteToCommentUsers',
        'reviewVote_to_comment_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getReviewVoteToReviewUsers',
        'reviewVote_to_review_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newQuestionVote' => array(
      array(
        'getQuestionVoteToCommentVoteUsers',
        'questionVote_to_commentVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionVoteToFirmVoteUsers',
        'questionVote_to_firmVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionVoteToHistoryUsers',
        'questionVote_to_history_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionVoteToAnswerUsers',
        'questionVote_to_answer_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionVoteToCommentUsers',
        'questionVote_to_comment_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getQuestionVoteToQuestionUsers',
        'questionVote_to_question_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
    'newAnswerVote' => array(
      array(
        'getAnswerVoteToAnswerVoteUsers',
        'answerVote_to_answerVote_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerVoteToQuestionUsers',
        'answerVote_to_question_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
      array(
        'getAnswerVoteToAnswerUsers',
        'answerVote_to_answer_mail.php',
        'Ortak Eğitim Değerlendirme Sistemi'
      ),
    ),
  );
  
  public function sendValidationMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'E-posta doğrulama', 'validation_mail.php', $data);
  }
  
  public function sendReplyMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'Soruna veya cevabına yanıt verildi', 'reply_mail.php', $data);
  }
  
  public function sendQuestionMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'Değerlendirme yazdığın firma hakkında soru soruldu', 'question_mail.php', $data);
  }
  
  public function sendCommentMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'Soru sorduğun firma hakkında değerlendirme yazıldı', 'comment_mail.php', $data);
  }
  
  public function sendIntroMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'ETÜ OEDS {Ortak Eğitim Değerlendirme Sistemi}', 'intro_mail.php', $data);
  }
  
  public function sendForgotPasswordMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'Şifre yenileme e-postası', 'forgot_password_mail.php', $data);
  }
  
  public function sendNewReviewMail($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'Değerlendirmen hakkında yorum yapıldı', 'new_review_mail.php', $data);
  }
  
  public function sendNewReviewMailForReviews($data)
  {
    if (empty($data['email']))
      return true;
    return $this->send($data['email'], 'Yorum yaptığın değerlendirmeye yeni yorum', 'new_review_mail_for_reviews.php', $data);
  }
  
  public function mailNotifications($notificationData, $data)
  {
    // giriş yapmış olan kullanıcı bilgileri
    $logedinUser = $this->app->Account->user();
    $logedinUserId = $logedinUser['id'];
    
    $this->app->load('User');
    $userModel = $this->app->User;
    // mail gönderilecek kişileri seç ve mail gönder
    $users = array();
    foreach ($notificationData as $m) {
      $method = $m[0];
      $layout = $m[1];
      $subject = $m[2];
      $newUsers = $userModel->$method($id);
      foreach ($newUsers as $u) {
        $users[$u['id']] = array(
          'user' => $u,
          'layout' => $layout,
          'subject' => $subject,
        );
      }
    }
    if (isset($users[$logedinUserId]))
      $users[$logedinUserId] = null;
    foreach ($users as $u) {
      $mail = array(
        'to' => $u['user']['email'],
        'subject' => $u['subject'],
        'layout' => $u['layout'],
        'data' => $data,
        'priority' => Email::WARM
      );
      $this->queue($mail);
    }
  }
  
  public function mailForNewComment($id)
  {
    // gerekli veriler
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $comment = $commentModel->get($id);
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($comment['firm_id']);
    $data = array(
      'comment' => $comment,
      'firm' => $firm
    );
    
    $this->mailNotifications($this->notificationData['newComment'], $data);
  }
  
  public function mailForNewReview($id)
  {
    // gerekli veriler
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $review = $commentModel->get($id);
    $comment = $commentModel->get($review['parent_id']);
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($comment['firm_id']);
    $data = array(
      'review' => $review,
      'comment' => $comment,
      'firm' => $firm
    );
    
    $this->mailNotifications($this->notificationData['newReview'], $data);
  }
  
  public function mailForNewQuestion($id)
  {
    // gerekli veriler
    $this->app->load('Question');
    $questionModel = $this->app->Question;
    $question = $questionModel->get($id);
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($question['firm_id']);
    $data = array(
      'question' => $question,
      'firm' => $firm
    );
    
    $this->mailNotifications($this->notificationData['newQuestion'], $data);
  }
  
  public function mailForNewAnswer($id)
  {
    // gerekli veriler
    $this->app->load('Answer');
    $answerModel = $this->app->Answer;
    $answer = $answerModel->get($id);
    $this->app->load('Question');
    $questionModel = $this->app->Question;
    $question = $questionModel->get($answer['question_id']);
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($question['firm_id']);
    $data = array(
      'answer' => $answer,
      'question' => $question,
      'firm' => $firm
    );
    
    $this->mailNotifications($this->notificationData['newAnswer'], $data);
  }
  
  public function mailForNewFirmVote($id)
  {
    // gerekli veriler
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    $vote = $voteModel->get($id);
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($vote['object_id']);
    $data = array(
      'vote' => $vote,
      'firm' => $firm
    );
    
    $this->mailNotifications($this->notificationData['newFirmVote'], $data);
  }
  
  public function mailForNewCommentVote($id)
  {
    // oyu bul
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    $vote = $voteModel->get($id);
    
    // değerlendirmeyi bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $comment = $commentModel->get($vote['object_id']);
    
    // firmayı bul
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($comment['firm_id']);
    
    $data = array(
      'vote' => $vote,
      'firm' => $firm,
      'comment' => $comment,
    );
    
    $this->mailNotifications($this->notificationData['newCommentVote'], $data);
  }
  
  public function mailForNewReviewVote($id)
  {
    // oyu bul
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    $vote = $voteModel->get($id);
    
    // yorumu bul
    $this->app->load('Comment');
    $commentModel = $this->app->Comment;
    $review = $commentModel->get($vote['object_id']);
    
    // değerlendirmeyi bul
    $comment = $commentModel->get($review['parent_id']);
    
    $data = array(
      'vote' => $vote,
      'review' => $review,
      'comment' => $comment,
    );
    
    $this->mailNotifications($this->notificationData['newReviewVote'], $data);
  }
  
  public function mailForNewQuestionVote($id)
  {
    // oyu bul
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    $vote = $voteModel->get($id);
    
    // soruyu bul
    $this->app->load('Question');
    $questionModel = $this->app->Question;
    $question = $questionModel->get($vote['object_id']);
    
    // firmayı bul
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($question['firm_id']);
    
    $data = array(
      'vote' => $vote,
      'firm' => $firm,
      'question' => $question,
    );
    
    $this->mailNotifications($this->notificationData['newQuestionVote'], $data);
  }
  
  public function mailForNewAnswerVote($id)
  {
    // oyu bul
    $this->app->load('Vote');
    $voteModel = $this->app->Vote;
    $vote = $voteModel->get($id);
    
    // cevabı bul
    $this->app->load('Answer');
    $answerModel = $this->app->Answer;
    $answer = $answerModel->get($vote['object_id']);
    
    // soruyu bul
    $this->app->load('Question');
    $questionModel = $this->app->Question;
    $question = $questionModel->get($answer['question_id']);
    
    // firmayı bul
    $this->app->load('Firm');
    $firmModel = $this->app->Firm;
    $firm = $firmModel->get($question['firm_id']);
    
    $data = array(
      'vote' => $vote,
      'firm' => $firm,
      'question' => $question,
      'answer' => $answer,
    );
    
    $this->mailNotifications($this->notificationData['newAnswerVote'], $data);
  }
}