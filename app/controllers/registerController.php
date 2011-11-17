<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class RegisterController extends Controller
{
  public function index()
  {
    $data = array();
    
    $this->load('User');
    $this->load('UserForm');
    $this->view->UserForm = $this->UserForm;
    
    $rules = array(
      'email' => array(
        array(
          'notEmpty',
          'E-postasız olmaz'
        ),
        array(
          'isStEmail',
          'Öğrenci e-posta adresin var mı? Öğrenci olmayanı almıyoz'
        ),
        array(
          'isUniqueEmail',
          'Önceden kaydınız var! <a href="login.php">Buradan</a> giriş yapmanız yeterli'
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
      ),
      'tos' => array(
        'isAgree',
        'Kullanıcı sözleşmesi?'
      )
    );
    $this->UserForm->setUserModel($this->User)
                   ->setRules($rules);
    
    if (!empty($_POST['register'])) {
      $registerData = filter_request($_POST['register']);
      
      if ($this->UserForm->validate($registerData)) {
        $validationCode = rand_str();
        $email = $registerData['email'].'@etu.edu.tr';
        $userData = array(
          'email' => $email,
          'password' => Account::hash($registerData['password']),
          'code' => $validationCode,
          'validated' => 0,
          'status' => 0,
          'user_type' => 2,
          'created' => created_time(),
          'updated' => created_time()
        );
        
        if ($this->User->insert($userData)) {
          $userId = $this->User->lastInsertId();
          // send validation email
          $data['email'] = $email;
          $data['user'] = $userData;
          
          $this->load('Emailer');
          if ($this->Emailer->sendValidationMail($data)) {
            // log kaydı
            $logMessage = sprintf('Yeni Kullanıcı: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostasıyla yeni bir kullanıcı kaydoldu.', $userId, $email);
            $this->Loger->log('INFO', $logMessage);
            $this->view->show('register_complete.php', $data);
            return;
          }
        }
      }
    }

    $this->view->show('register_form.php', $data);
  }
  
  public function validate()
  {
    $this->load('User');
    $this->load('Account');
    $this->Account->setUserModel($this->User);
    
    $getData = filter_request($_GET);
    
    if (!$this->User->validateUser($getData['email'], $getData['code'])) {
      $this->error('not_found.php');
      return;
    }
    $this->Account->fakeLogin($getData['email']);
    
    $user = array_pop($this->User->select(array('email' => $getData['email'])));
    if ($user['password'] != '') {
      $updatedUser = array(
        'code' => rand_str(),
        'updated' => created_time()
      );
      
      if ($this->User->update($updatedUser, array('id' => $user['id']))) {
        $this->redirect('register.php?s=complete');
        return;
      }
    }
    
    // eski kayıt formu uyumluluğu için
    $_SESSION['ValidatedUser'] = array(
      'email' => $getData['email'],
      'code' => $getData['code']
    );
    $this->redirect('register.php?s=newpass');
  }
  
  // eski kayıt formu uyumluluğu için
  public function newpass()
  {
    $this->load('User');
    $this->load('UserForm');
    $this->load('Account');
    $this->Account->setUserModel($this->User);
    
    if (!isset($_SESSION['ValidatedUser'])) {
      $this->error('not_found.php');
      return;
    }
    
    $user = $_SESSION['ValidatedUser'];
    
    if (!$this->User->validateUser($user['email'], $user['code'])) {
      $this->error('not_found.php');
      return;
    }
    
    $rules = array(
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
    
    if (!empty($_POST['register'])) {
      $formData = filter_request($_POST['register']);
      
      if ($this->UserForm->validate($formData)) {
        $updatedData = array(
          'code' => rand_str(),
          'password' => Account::hash($formData['password']),
          'updated' => created_time()
        );
        
        $where = array('email' => $user['email']);
        
        if ($this->User->update($updatedData, $where)) {
          $loginData = array(
            'email' => $user['email'],
            'password' => $formData['password']
          );
          $this->Account->login($loginData);
          
          unset($_SESSION['ValidatedUser']);
          
          $this->redirect('register.php?s=saved');
          return;
        }
      }
    }
    
    $this->view->UserForm = $this->UserForm;
    $this->view->show('newpass_form.php');
  }
  
  public function complete()
  {
    $this->view->show('validation_complete.php');
  }
  
  public function saved()
  {
    $this->view->show('newpass_complete.php');
  }
  
  public function new_validation()
  {
    $this->load('UserForm');
    
    if (isset($_SESSION['EmailValidation'])) {
      $email = $_SESSION['EmailValidation'];
      unset($_SESSION['EmailValidation']);
      $user = array_pop($this->User->select(array('email' => $email)));
      $userId = $user['id'];
    } else {
      $rules = array(
        'email' => array(
          array(
            'notEmpty',
            'E-postasız olmaz'
          ),
          array(
            'isRegistered',
            'Girilen e-posta kayıtlı değil'
          )
        )
      );
      $this->UserForm->setRules($rules)
                     ->setUserModel($this->User);
      
      if (!empty($_POST['validation'])) {
        $postData = filter_request($_POST['validation']);
        if ($this->UserForm->validate($postData)) {
          $email = $postData['email'].'@etu.edu.tr';
          $users = $this->User->select(array('email' => $email));
          if (count($users) != 0) {
            $user = $users[0];
            $userId = $user['id'];
          }
        }
      }
    }
    
    if (isset($userId) && isset($user)) {
      if ($user['password'] != '' && $user['validated']) {
        $infoData = array(
          'title' => 'Yeni Doğrulama E-postası',
          'message' => 'E-posta adresiniz doğrulanmış.'
        );
        $this->info('info.php', $infoData);
        return;
      }
      // yeni bir doğrulama kodu oluştur
      $user['code'] = rand_str();
      $updatedUser = array(
        'code' => $user['code'],
        'updated' => created_time()
      );
      if ($this->User->update($updatedUser, array('id' => $userId))) {
        $emailData = array(
          'email' => $user['email'],
          'user' => $user
        );
        $this->load('Emailer');
        $this->Emailer->sendValidationMail($emailData);
        $infoData = array(
          'title' => 'Yeni Doğrulama E-postası Gönderildi',
          'message' => '<b>'.$user['email'].'</b> adresine yeni bir doğrulama e-postası gönderildi.<br/><br/>Anasayfaya {<a class="underline" href="index.php">dön</a>}'
        );
        $this->info('info.php', $infoData);
        return;
      }
    }
    
    
    $data = array();
    $this->view->UserForm = $this->UserForm;
    $this->view->show('new_validation.php', $data);
  }
  
  public function forgot_password()
  {
    $this->load('User');
    $this->load('UserForm');
    $this->view->UserForm = $this->UserForm;
    
    $rules = array(
      'email' => array(
        array(
          'notEmpty',
          'E-postasız olmaz'
        ),
        array(
          'isRegistered',
          'Girilen e-posta kayıtlı değil'
        ),
        array(
          'isValidated',
          'E-posta adresin doğrulanmamış, doğrulamak için e-postana gönderilen doğrulama linkini takip et veya doğrulama e-postası gelmediyse <a href="register.php?s=new_validation">buradan</a> yeni bir doğrulama e-postası al.'
        )
      )
    );
    $this->UserForm->setRules($rules)
                   ->setUserModel($this->User);
    
    if (!empty($_POST['forgot'])) {
      $postData = filter_request($_POST['forgot']);
      if ($this->UserForm->validate($postData)) {
        $email = $postData['email'].'@etu.edu.tr';
        $code = rand_str();
        $updatedUser = array(
          'code' => $code,
          'updated' => created_time()
        );
        if ($this->User->update($updatedUser, array('email' => $email))) {
          $emailData = array(
            'email' => $email,
            'code' => $code
          );
          $this->load('Emailer');
          $this->Emailer->sendForgotPasswordMail($emailData);
          
          // log kaydı
          $user = array_pop($this->User->select(array('email' => $email)));
          $logMessage = sprintf('Şifre Unutma: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı epostalı kişi şifresini unutmuş.', $user['id'], $user['email']);
          $this->Loger->log('INFO', $logMessage);
          
          $infoData = array(
            'title' => 'Şifre Yenileme E-postası Gönderildi',
            'message' => '<b>'.$email.'</b> adresine şifrenizi değiştirebilmeniz için gerekli link gönderildi.<br/><br/>Anasayfaya {<a class="underline" href="index.php">dön</a>}'
          );
          $this->info('info.php', $infoData);
          return;
        }
      }
    }
    
    $this->view->show('forgot_password.php');
  }
  
  public function new_password()
  {
    $this->load('User');
    $this->load('UserForm');
    $this->view->UserForm = $this->UserForm;
    
    if (!isset($_SESSION['NewPassword'])) {
      $getData = filter_request($_GET);
      if (!$this->User->validateUser($getData['email'], $getData['code'])) {
        $this->error('not_found.php');
        return;
      }
      $_SESSION['NewPassword'] = array(
        'email' => $getData['email'],
        'code' => $getData['code']
      );
    }
    
    $email = $_SESSION['NewPassword']['email'];
    $code = $_SESSION['NewPassword']['code'];
    
    $rules = array(
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
      $formData = filter_request($_POST['password']);
      
      if ($this->UserForm->validate($formData)) {
        $updatedData = array(
          'code' => rand_str(),
          'password' => Account::hash($formData['password']),
          'updated' => created_time()
        );
        
        $where = array('email' => $email);
        
        if ($this->User->update($updatedData, $where)) {
          $this->Account->fakeLogin($email);
          
          unset($_SESSION['NewPassword']);
          
          $this->redirect('register.php?s=new_password_saved');
          return;
        }
      }
    }
    
    $this->view->show('new_password.php');
  }
  
  public function new_password_saved()
  {
    $infoData = array(
      'title' => 'Yeni Şifre Belirleme',
      'message' => 'Yeni şifreniz kaydedildi.<br/><br/>Anasayfaya {<a class="underline" href="comment.php">dön</a>}'
    );
    $this->info('info.php', $infoData);
  }
}