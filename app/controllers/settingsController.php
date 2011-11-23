<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class SettingsController extends Controller
{
  public function index()
  {
    $this->load('UserForm');
    $this->view->UserForm = $this->UserForm;
    $this->load('Twitter');
    $userId = $this->Account->getLogedinUser('id');
    $twitterSynced = $this->Twitter->isSynced($userId);
    $data = compact(
      'twitterSynced'
    );
    $this->view->show('index.php', $data);
  }
  
  public function change_password()
  {
    $this->load('User');
    $this->load('UserForm');
    $this->view->UserForm = $this->UserForm;
    
    $rules = array(
      'opassword' => array(
        array(
          'checkPassword',
          'Şifreniz yanlış',
          $this->Account
        )
      ),
      'password' => array(
        array(
          'minLength',
          'Şifreniz en az 5 karakterden oluşursa iyi olur',
          5
        )
      ),
      'cpassword' => array(
        array(
          'confirmPassword',
          'Şifreler aynı değil',
          'password'
        )
      )
    );
    $this->UserForm->setUserModel($this->User)
                   ->setRules($rules);
    if (!empty($_POST['password'])) {
      $passwordData = filter_request($_POST['password']);
      
      if ($this->UserForm->validate($passwordData)) {
        $updatedUser = array(
          'password' => Account::hash($passwordData['password']),
          'updated' => created_time()
        );
        $user = $this->Account->getLogedinUser();
        
        if ($this->User->update($updatedUser, $user['id'])) {
          $this->Account->fakeLogin($user['email']);
          if ($this->Account->isRemembered())
            $this->Account->setCookie();
          $this->redirect('settings.php?s=password_changed');
          return;
        }
      }
    }
    
    $this->redirect('settings.php');
  }
  
  public function password_changed()
  {
    $infoData = array(
      'title' => 'Şifre Değiştirme',
      'message' => 'Şifreniz değiştirildi.<br/><br/>Ayarlar sayfasına {<a class="underline" href="settings.php">dön</a>}'
    );
    $this->info('info.php', $infoData);
  }
  
  public function twitter_account()
  {
    $this->load('Twitter');
    $this->Twitter->redirect();
  }
}