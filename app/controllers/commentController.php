<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class CommentController extends Controller
{
  public $authErrors = array(
    'index' => 'Değerlendirmeleri okuyabilmek için giriş yapmalısın',
    'select' => 'Değerlendirme yazabilmek için giriş yapmalısın',
    'write' => 'Değerlendirme yazabilmek için giriş yapmalısın'
  );
  
  public $tabs = array(
    array(
      'name' => 'index',
      'label' => 'Değerlendirmeler',
      'link' => 'comment.php?'
    ),
    array(
      'name' => 'write',
      'label' => 'Değerlendirme Yaz',
      'link' => 'comment.php?s=write&'
    ),
    array(
      'name' => 'ask',
      'label' => 'Soru Sor',
      'link' => 'question.php?s=ask&'
    ),
  );
  
  public function index()
  {
    $this->load('Firm');
    $this->load('Comment');
    $this->load('Answer');
    $this->load('Question');
    
    if (empty($_GET['firm_id'])) {
      $this->_ajaxSearch();
      return;
    } else {
      $id = filter_request($_GET['firm_id']);
      if (!is_numeric($id)) {
        $id = 1;
      }
    }
    $firms = $this->Firm->select(array('id' => $id));
    if (count($firms) == 0) {
      $id = 1;
      $firms = $this->Firm->select(array('id' => $id));
    }
    $firm = $firms[0];
    
    // tablara seçili firmanın idsini ekle
    foreach ($this->tabs as &$t) {
      $t['link'] .= 'firm_id='.$firm['id'];
    }
    
    $comments = $this->Comment->getFirmComments($id);
    foreach ($comments as &$c) {
      $c['reviews'] = $this->Comment->getCommentReviews($c['id']);
    }
    $entries = $comments;
    
    $questions = $this->Question->getFirmQuestions($id);
    foreach ($questions as &$q) {
      $q['answers'] = $this->Answer->getQuestionAnswers($q['id']);
      $entries[] = $q;
    }
    
    // değerlendirmeleri ve soruları güncelleme tarihine göre sıralama
    usort($entries, 'entry_cmp');
    
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
    $commentsVotes = $this->Vote->getUserCommentsVotes($userId);
    $votedCommentIds = array();
    foreach ($commentsVotes as $cv) $votedCommentIds[] = $cv['object_id'];
    
    $data = array();
    $data['tabs'] = $this->tabs;
    $data['firm'] = $firm;
    $data['comments'] = $comments;
    $data['commentCount'] = count($comments);
    $data['questions'] = $questions;
    $data['entries'] = $entries;
    $data['votedAnswerIds'] = $votedAnswerIds;
    $data['votedQuestionIds'] = $votedQuestionIds;
    $data['votedCommentIds'] = $votedCommentIds;
    $data['isFirmVoted'] = ($firmVote != null);
    
    $this->view->show('comments.php', $data);
  }
  
  public function select()
  {
    if (!empty($_POST['firm']) && !empty($_POST['firm']['id'])) {
      $this->redirect('comment.php?s=write&firm_id='.$_POST['firm']['id']);
      return;
    }
    if (!empty($_GET['firm_id'])) {
      $this->redirect('comment.php?s=write&firm_id='.$_GET['firm_id']);
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
    $data['title'] = 'Değerlendirmek için Firma Seç';
    $data['formAction'] = 'comment.php?s=write';
    $this->view->show('../ajax/select_firm.php', $data);
    // $this->load('Firm');
    // $data = array();
    // $data['firms'] = $this->Firm->getFirms();
    // $this->view->show('select_form.php', $data);
  }
  
  public function write()
  {
    $this->load('Firm');
    
    $data = array();
    if(empty($_GET['firm_id'])) {
      $this->redirect('comment.php?s=select');
      return;
    }
    
    $id = filter_request($_GET['firm_id']);
    if (!is_numeric($id)) {
      $this->redirect('comment.php?s=select');
      return;
    }
  
    $firms = $this->Firm->select(array('id' => $id));
    if (count($firms) == 0) {
      $this->redirect('comment.php?s=select');
      return;
    }
    $firm = $firms[0];
    
    // tablara seçili firmanın idsini ekle
    foreach ($this->tabs as &$t) {
      $t['link'] .= 'firm_id='.$firm['id'];
    }
    
    $this->load('Comment');
    $this->load('CommentForm');
    $rules = array(
      'comment' => array(
        'notEmpty',
        'Firma hakkında yazabileceğin değerlendirmen yok mu?'
      )
    );
    $this->CommentForm->setRules($rules);
    
    if (!empty($_POST['comment'])) {
      $commentData = filter_request($_POST['comment']);
      if ($this->CommentForm->validate($commentData)) {
        $user = $this->Account->getLogedinUser();
        $newCommentData = array(
          'comment' => $commentData['comment'],
          'user_id' => $user['id'],
          'firm_id' => $id,
          'created' => created_time(),
          'updated' => created_time()
        );
        
        $updatedFirmData = array(
          'comment_count' => $firm['comment_count'] + 1,
          'updated' => created_time()
        );
        
        if ($this->Comment->insert($newCommentData)
            && $this->Firm->update($updatedFirmData, array('id' => $id))) {
          
          // send mail to users for comment
          $commentId = $this->Comment->lastInsertId();
          $emailData = array(
            'email' => $this->User->getCommentRelatedEmails($id, $user['id']),
            'firm' => $firm,
            'comment' => $this->Comment->get($commentId)
          );
          $this->load('Emailer');
          $this->Emailer->sendCommentMail($emailData);
          
          // log kaydı
          $logMessage = sprintf('Yeni Değerlendirme: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı yeni bir <a href="admin.php?s=view_comment&comment_id=%s">değerlendirme</a> yazdı.', $user['id'], $user['email'], $commentId);
          $this->Loger->log('INFO', $logMessage);
          
          $this->redirect('comment.php?firm_id='.$id);
          return;
        }
      }
    }
    
    $data['tabs'] = $this->tabs;
    $data['firm'] = $firm;
    $data['title'] = $firm['name'];
    $data['formAction'] = 'comment.php?s=write&firm_id='.$id;
    $data['comments'] = $this->Comment->getFirmComments($id);
    $this->view->CommentForm = $this->CommentForm;
    $this->view->show('write_form.php', $data);
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
    
    $this->load('Comment');
    $comment = $this->Comment->get($id);
    if (!$comment || $comment['deleted']) {
      $this->goback();
      return;
    }
    $firmId = $comment['firm_id'];
    $userId = $comment['user_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->redirect('comment.php?firm_id='.$firmId);
      return;
    }
    
    $updatedComment = array(
      'deleted' => 1,
      'updated' => created_time()
    );
    
    $firm = array_pop($this->Firm->select(array('id' => $firmId)));
    $updatedFirm = array(
      'comment_count' => $firm['comment_count']-1,
      'updated' => created_time()
    );
    
    if ($this->Comment->update($updatedComment, array('id' => $id))
        && $this->Firm->update($updatedFirm, array('id' => $firmId))) {
      // Ben bunla bişi yaparım: silindi mesajı gösterebilirsin
      // log kaydı
      $logMessage = sprintf('Değerlendirme Silme: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı <a href="admin.php?s=view_comment&comment_id=%s">değerlendirmesini</a> sildi.', $user['id'], $user['email'], $id);
      $this->Loger->log('INFO', $logMessage);
    }
    
    $this->redirect('comment.php?firm_id='.$firmId);
  }
  
  public function edit()
  {
    if(empty($_GET['id'])) {
      $this->redirect('comment.php');
      return;
    }
    
    $id = filter_request($_GET['id']);
    if (!is_numeric($id)) {
      $this->redirect('comment.php');
      return;
    }
    
    $this->load('Comment');
    $comments = $this->Comment->select(array('id' => $id));
    if (count($comments) == 0) {
      $this->redirect('comment.php');
      return;
    }
    $comment = $comments[0];
    $firmId = $comment['firm_id'];
    $userId = $comment['user_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->redirect('comment.php?firm_id='.$firmId);
      return;
    }
    
    $this->load('CommentForm');
    $rules = array(
      'comment' => array(
        'notEmpty',
        'Firma hakkında yazabileceğin değerlendirmen yok mu?'
      )
    );
    $this->CommentForm->setRules($rules)
                      ->setFormData($comment);
    
    if (!empty($_POST['comment'])) {
      $commentData = filter_request($_POST['comment']);
      if ($this->CommentForm->validate($commentData)) {
        $updatedComment = array(
          'comment' => $commentData['comment'],
          'updated' => created_time()
        );
        
        if ($this->Comment->update($updatedComment, array('id' => $id))) {
          $this->redirect('comment.php?firm_id='.$firmId);
          return;
        }
      }
    }
    
    $data['firm'] = array_pop($this->Firm->select(array('id' => $firmId)));
    $data['comment'] = $comment;
    // $data['comments'] = $this->Comment->getFirmComments($firmId);
    $data['title'] = 'Değerlendirmeni Düzenle';
    $data['formAction'] = 'comment.php?s=edit&id='.$id;
    $this->view->CommentForm = $this->CommentForm;
    $this->view->show('write_form.php', $data);
  }
  
  public function view()
  {
    if (empty($_GET['id'])) {
      $this->goback();
      return;
    }
    $id = filter_request($_GET['id']);
    $this->load('Comment');
    $comment = $this->Comment->get($id);
    if (!$comment || $comment['deleted'] || ($comment['parent_id'] != 0)) {
      $this->goback();
      return;
    }
    $comment['reviews'] = $this->Comment->getCommentReviews($comment['id']);
    $firm = $this->Firm->get($comment['firm_id']);
    $firmId = $firm['id'];
    
    // oyları seç
    $user = $this->Account->getLogedinUser();
    $userId = $user['id'];
    $this->load('Vote');
    $firmVote = $this->Vote->getUserFirmVote($userId, $firmId);
    $commentsVotes = $this->Vote->getUserCommentsVotes($userId);
    $votedCommentIds = array();
    foreach ($commentsVotes as $cv) $votedCommentIds[] = $cv['object_id'];
    
    $data = array();
    $data['firm'] = $firm;
    $data['comment'] = $comment;
    $data['votedCommentIds'] = $votedCommentIds;
    $data['isFirmVoted'] = ($firmVote != null);
    
    $this->view->show('view.php', $data);
  }
  
  private function _ajaxSearch()
  {
    $selects = array(
      'commented',
      'asked'
    );
    $where = null;
    $orderBy = null;
    $title = "Firmalar";
    if (!empty($_GET['select'])) {
      $select = filter_request($_GET['select']);
      if (in_array($select, $selects)) {
        switch ($select) {
          case 'commented':
            $where = array('comment_count' => '> 0');
            $orderBy = array('updated' => 'DESC');
            $title = "Değerlendirme Yazılmış Firmalar";
            break;
          case 'asked':
            $title = "Soru Sorulmuş Firmalar";
            $where = array('question_count' => '> 0');
            $orderBy = array('updated' => 'DESC');
            break;
          default:
            $where = null;
            $orderBy = null;
            break;
        }
      }
    }
    $firms = $this->Firm->getFirms($where, $orderBy);
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
    $data['title'] = $title;
    $data['firms'] = $firms;
    $data['json'] = json_encode($firmsJson);
    $this->view->show('../ajax/ajax_search.php', $data);
  }
  
  public function add_review()
  {
    $this->load('Firm');
    
    $data = array();
    if(empty($_GET['firm_id'])) {
      $this->goback();
      return;
    }
    
    $id = filter_request($_GET['firm_id']);
    if (!is_numeric($id)) {
      $this->goback();
      return;
    }
  
    $firm = $this->Firm->get($id);
    if (!$firm) {
      $this->goback();
      return;
    }
    
    $this->load('Comment');
    
    if(empty($_GET['comment_id'])) {
      $this->goback();
      return;
    }
    
    $parentId = filter_request($_GET['comment_id']);
    if (!is_numeric($parentId)) {
      $this->goback();
      return;
    }
  
    $parent = $this->Comment->get($parentId);
    if (!$parent) {
      $this->goback();
      return;
    }
    
    $this->load('CommentForm');
    $rules = array(
      'text' => array(
        'notEmpty',
        'Değerlendirme hakkında yorum yazmamışsın.'
      )
    );
    $this->CommentForm->setRules($rules);
    
    if (!empty($_POST['review'])) {
      $reviewData = filter_request($_POST['review']);
      if ($this->CommentForm->validate($reviewData)) {
        $user = $this->Account->getLogedinUser();
        $newReviewData = array(
          'comment' => $reviewData['text'],
          'user_id' => $user['id'],
          'firm_id' => $id,
          'parent_id' => $parentId,
          'created' => created_time(),
          'updated' => created_time()
        );
        
        $updatedCommentData = array(
          'review_count' => $parent['review_count'] + 1,
          'updated' => created_time()
        );
        
        if ($this->Comment->insert($newReviewData)
            && $this->Comment->update($updatedCommentData, array('id' => $parentId))) {
          
          // değerlendirme sahibini ve diğer yorum yazanları yorum yazıldığına dair bilgilendir
          $reviewId = $this->Comment->lastInsertId();
          $parentUserId = $parent['user_id'];
          $this->load('User');
          $parentUser = $this->User->get($parentUserId);
          $emailData = array(
            'firm' => $firm,
            'review' => $this->Comment->get($reviewId),
            'parent' => $parent
          );
          // diğer yorum yazanlar için
          $emailData['email'] = $this->User->getReviewRelatedEmails($parentId, $parentUserId, $user['id']);
          $this->load('Emailer');
          $this->Emailer->sendNewReviewMailForReviews($emailData);
          
          $emailData['email'] = $parentUser['email'];
          if ($parentUserId != $user['id']) { // yorum yazan kişi değerlendirme yazan kişi değilse
            // değerlendirme yazan için
            $this->Emailer->sendNewReviewMail($emailData);
          }
          
          // log kaydı
          $logMessage = sprintf('Yeni Yorum: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı yeni bir <a href="admin.php?s=view_comment&comment_id=%s">yorum</a> yazdı.', $user['id'], $user['email'], $reviewId);
          $this->Loger->log('INFO', $logMessage);
          
          $this->goback();
          return;
        }
      }
    }
    
    $this->goback();
  }
  
  public function delete_review()
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
    
    $this->load('Comment');
    $review = $this->Comment->get($id);
    if (!$review || $review['deleted']) {
      $this->goback();
      return;
    }
    $parentId = $review['parent_id'];
    $userId = $review['user_id'];
    $firmId = $review['firm_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->redirect('comment.php?firm_id='.$firmId);
      return;
    }
    
    $updatedReview = array(
      'deleted' => 1,
      'updated' => created_time()
    );
    
    $parent = $this->Comment->get($parentId);
    $updatedParent = array(
      'review_count' => $parent['review_count']-1,
      'updated' => created_time()
    );
    
    if ($this->Comment->update($updatedReview, array('id' => $id))
        && $this->Comment->update($updatedParent, array('id' => $parentId))) {
      // log kaydı
      $logMessage = sprintf('Yorum Silme: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı <a href="admin.php?s=view_comment&comment_id=%s">yorumunu</a> sildi.', $user['id'], $user['email'], $id);
      $this->Loger->log('INFO', $logMessage);
    }
    
    $this->redirect('comment.php?firm_id='.$firmId);
  }
  
  public function edit_review()
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
    
    $this->load('Comment');
    $review = $this->Comment->get($id);
    if (!$review || $review['deleted']) {
      $this->goback();
      return;
    }
    $parentId = $review['parent_id'];
    $userId = $review['user_id'];
    $firmId = $review['firm_id'];
    
    $user = $this->Account->getLogedinUser();
    if ($userId != $user['id']) {
      $this->redirect('comment.php?firm_id='.$firmId);
      return;
    }
    
    $this->load('CommentForm');
    $rules = array(
      'comment' => array(
        'notEmpty',
        'Değerlendirme hakkında yorum yazmamışsın.'
      )
    );
    $this->CommentForm->setRules($rules)
                      ->setFormData($review);
    
    if (!empty($_POST['review'])) {
      $reviewData = filter_request($_POST['review']);
      if ($this->CommentForm->validate($reviewData)) {
        $updatedReview = array(
          'comment' => $reviewData['comment'],
          'updated' => created_time()
        );
        
        if ($this->Comment->update($updatedReview, array('id' => $id))) {
          $this->redirect('comment.php?firm_id='.$firmId);
          return;
        }
      }
    }
    
    $data['parent'] = $this->Comment->get($parentId);
    $data['review'] = $review;
    $data['title'] = 'Yorum Düzenle';
    $data['formAction'] = 'comment.php?s=edit_review&id='.$id;
    $this->view->CommentForm = $this->CommentForm;
    $this->view->show('edit_review.php', $data);
  }
}