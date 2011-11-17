<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class LoginController extends Controller
{
  public function index()
  {
    $this->load('UserForm');
    $this->load('User');
    $this->Account->setUserModel($this->User);
    
    if ($this->Account->isLogedin()) {
      $this->goback();
      return;
    }

    if (!empty($_POST['login'])) {
      $loginData = filter_request($_POST['login']);
      if (isset($loginData['email'])) {
        $this->UserForm->setFormData($loginData);
        $loginData['email'] .= '@etu.edu.tr';
        if ($this->Account->login($loginData)) {
          if ($loginData['rememberme'] == '1')
            $this->Account->setCookie();
          else
            $this->Account->deleteCookie();
          
          //$this->redirect($this->Account->getLoginRedirect());
          if (isset($_SESSION['RedirectUrl'])) {
            $redirectUrl = $_SESSION['RedirectUrl'];
            $_SESSION['RedirectUrl'] = null;
            $this->redirect($redirectUrl);
          } else {
            $this->goback();
          }
        } else {
          // e-posta doğrulanmamışsa veya şifre belirlememişse
          // yeni doğrulama kodu almak için
          if ($this->Account->loginErrorNo == 3
              || $this->Account->loginErrorNo == 4) {
            $_SESSION['EmailValidation'] = $loginData['email'];
          }
        }
      }
    }
    
    $this->view->UserForm = $this->UserForm;
    $this->view->show('login_form.php');
  }
  
  public function twitter_login()
  {
    $this->load('Twitter');
    $this->Twitter->redirect();
  }
  
  // public function twitter()
  public function twitter_callback()
  {
    $this->load('Twitter');
    $this->Twitter->callback();
  }
}