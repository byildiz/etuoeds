<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class ProfileController extends Controller
{
  public $tabs = array(
    array(
      'name' => 'index',
      'label' => 'Eylemlerim',
      'link' => 'profile.php'
    ),
    array(
      'name' => 'myfirms',
      'label' => 'Firmalarım',
      'link' => 'profile.php?s=myfirms'
    ),
    array(
      'name' => 'write',
      'label' => 'Değerlendirme Yaz',
      'link' => 'comment.php?s=select'
    ),
  );
  
  public function index()
  {
    $user = $this->Account->getLogedinUser();
    $userId = $user['id'];
    
    $this->load('Comment');
    $this->load('Question');
    $this->load('Answer');
    $this->load('Vote');
    
    $myComments = $this->Comment->getUserCommentsWithFirm($userId);
    $myQuestions = $this->Question->getUserQuestionsWithAnswersAndFirm($userId);
    $myAnswers = $this->Question->getUserAnsweredQuestions($userId);
    $myVotes = $this->Vote->getUserVotesWithObjects($userId);
    
    $myEntries = array_merge($myAnswers, $myComments, $myQuestions, $myVotes);
    usort($myEntries, array($this, '_entry_cmp'));
    // pr($myEntries);
    
    $questionsVotes = $this->Vote->getUserQuestionsVotes($userId);
    $votedQuestionIds = array();
    foreach ($questionsVotes as $qv) $votedQuestionIds[] = $qv['object_id'];
    $answersVotes = $this->Vote->getUserAnswersVotes($userId);
    $votedAnswerIds = array();
    foreach ($answersVotes as $av) $votedAnswerIds[] = $av['object_id'];
    $commentsVotes = $this->Vote->getUserCommentsVotes($userId);
    $votedCommentIds = array();
    foreach ($commentsVotes as $cv) $votedCommentIds[] = $cv['object_id'];
    
    $data = compact(
      'myEntries',
      'votedQuestionIds',
      'votedCommentIds',
      'votedAnswerIds'
    );
    $data['tabs'] = $this->tabs;
    $this->view->show('profile.php', $data);
  }
  
  public function myfirms()
  {
    $this->load('Match');
    $user = $this->Account->getLogedinUser();
    $userId = $user['id'];
    
    $matches = $this->Match->getUserMatches($userId);
    $wishes = array();
    $histories = array();
    foreach ($matches as $m) {
      if ($m['wish']) {
        $wishes[] = $this->Firm->get($m['firm_id']);
      } else {
        $histories[] = $this->Firm->get($m['firm_id']);
      }
    }
    $firms = $this->Firm->getFirms(array('id' => '!= 1'));
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
    $data['histories'] = $histories;
    $data['wishes'] = $wishes;
    $data['json'] = json_encode($firmsJson);
    $data['tabs'] = $this->tabs;
    $this->view->show('myfirms.php', $data);
  }
  
  private function _entry_cmp($a, $b)
  {
    return $a['updated'] < $b['updated'];
  }
}