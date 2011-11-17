<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Initiate extends Init
{
  private $isInitAccount;
  
  private $isInitRememberme;
  
  public function initAccount()
  {
    $this->app->load('User');
    $this->app->Account->setUserModel($this->app->User);
    $this->app->view->Account = $this->app->Account;
    $this->app->view->user = $this->app->Account->getLogedinUser();
    $isInitAccount = true;
  }
  
  public function initLastEntries()
  {
    $this->app->view->lastComments = $this->app->Firm->getLastCommentedFirms(10);
    $this->app->view->lastQuestions = $this->app->Firm->getLastAskedFirms(10);
    $this->app->load('Question');
    $this->app->view->lastAnswers = $this->app->Question->getLastAnsweredQuestions(10);
  }
  
  public function initAuth()
  {
    $this->isInitRememberme || $this->initRememberme();
    if (!$this->app->Account->isAuthorized()) {
      @session_start();
      $_SESSION['RedirectUrl'] = $_SERVER['REQUEST_URI'];
      $this->app->redirect($this->app->Account->getAuthRedirect());
    }
  }
  
  public function initRememberme()
  {
    $this->isInitAccount || $this->initAccount();
    $this->app->Account->checkCookie();
    $isInitRememberme = true;
  }
}