<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Account
{
  public $config;
  
  public $app;
  
  public $userModel;
  
  public $loginError;
  
  public $loginErrorNo;
  
  public $authorized;
  
  public $permissions;
  
  public function __construct()
  {
    $this->app = System::app();
    if (isset($this->app->config['accountConfig'])) {
      $this->config = $this->app->config['accountConfig'];
    }
    @session_start();
  }
  
  public function setUserModel($userModel)
  {
    $this->userModel = $userModel;
    return $this;
  }
  
  public static function hash($str)
  {
    if (!isset(System::app()->config['accountConfig']['salt'])) {
      exit('The salt for hashing not defined in config.php');
    }
    
    return sha1($str.System::app()->config['accountConfig']['salt']);
  }
  
  public function isLogedin()
  {
    return isset($_SESSION['Account']['User']);
  }
  
  public function login($loginData)
  {
    $this->loginErrorNo = 0;
    if (empty($loginData['email'])) {
      $this->app->Message->set('loginError', 'E-posta veya şifre boş');
      $this->loginErrorNo = 1;
      return false;
    }
    
    $where = array(
      'email' => $loginData['email']
    );
    $users = $this->userModel->select($where);
    
    if (count($users) <= 0) {
      $this->app->Message->set('loginError', 'E-postanı yanlış yazmış olabilirsin');
      $this->loginErrorNo = 2;
      return false;
    } else if ($users[0]['validated'] == 0) {
      $this->app->Message->set('loginError', 'E-posta adresin doğrulanmamış, doğrulamak için e-postana gönderilen doğrulama linkini takip et veya doğrulama e-postası gelmediyse <a href="register.php?s=new_validation">buradan</a> yeni bir doğrulama e-postası al.');
      $this->loginErrorNo = 3;
      return false;
    } else if ($users[0]['password'] == '') {
      $this->app->Message->set('loginError', 'Şifre belirlememişsin, belirlemek için e-posta doğrulama linkini takip et veya doğrulama e-postası gelmediyse <a href="register.php?s=new_validation">buradan</a> yeni bir doğrulama e-postası al.');
      $this->loginErrorNo = 4;
      return false;
    }

    if (empty($loginData['password'])) {
      $this->app->Message->set('loginError', 'E-posta veya şifre boş');
      $this->loginErrorNo = 1;
      return false;
    }
    
    if ($users[0]['password'] != Account::hash($loginData['password'])) {
      $this->app->Message->set('loginError', 'Yanlış şifre girdin');
      return false;
    }
    
    $this->setSession($users[0]);
    return true;
  }
  
  public function isRemembered()
  {
    return !empty($_COOKIE['rememberme']);
  }
  
  public function checkCookie()
  {
    if (empty($_COOKIE['rememberme']))
      return false;
    
    $cookieData = split(';', (string)filter_request($_COOKIE['rememberme']));
    if (count($cookieData) != 2)
      return false;
    
    $email = $cookieData[0];
    $hash = $cookieData[1];
    
    $where = array(
      'email' => $email
    );
    $users = $this->userModel->select($where);
    if (count($users) == 0)
      return false;
    
    $user = $users[0];
    if ($hash != self::hash($user['email'].$user['password']))
      return false;
    
    // kullanıcı hesabını doğrulamadıysa giriş yapma
    if ($user['validated'] == 0)
      return false;
    
    $this->fakeLogin($email);
    return true;
  }
  
  // cookieyi users tablosunda cookie diye bir alan oluşturup oraya kayıt
  // edersem daha iyi olur. bunun için önce rastgele bir string oluşturup sonra
  // onu users'a kaydet sonrada onu cookie olarak ata. kullanıcı her giriş
  // yaptığında bu cookie değerini yenilersem daha iyi olur.
  public function setCookie()
  {
    if (!$this->isLogedin())
      return false;
    
    $user = $this->getLogedinUser();
    $cookieValue = $user['email'].';'.self::hash($user['email'].$user['password']);
    return setcookie('rememberme', $cookieValue, next_month(), '/', '.etuoeds.com');
  }
  
  public function deleteCookie()
  {
    if (!$this->isLogedin())
      return false;
    
    $user = $this->getLogedinUser();
    $cookieValue = $user['email'].';'.self::hash($user['email'].$user['password']);
    return setcookie('rememberme', $cookieValue, time()-3600, '/', '.etuoeds.com');
  }
  
  public function fakeLogin($email = null, $id = null)
  {
    if ($email) {
      $where = array(
        'email' => $email,
      );
      $users = $this->userModel->select($where);
      
      if (count($users) <= 0)
        return false;
      $user = $users[0];
    } else {
      if ($id == null)
        return false;
      
      $user = $this->userModel->get($id);
      if (!$user)
        return false;
    }
    
    $this->setSession($user);
    return true;
  }
  
  private function setSession($user = null)
  {
    if ($user != null) {
      $_SESSION['Account']['User'] = $user;
    }
    return $_SESSION['Account']['User'];
  }
  
  public function logout()
  {
    if (!empty($_COOKIE['rememberme']))
      $this->deleteCookie();
    
    unset($_SESSION['Account']['User']);
    return $this;
  }
  
  public function getLogedinUser($fieldName = null)
  {
    if ($this->isLogedin()) {
      $user = $this->setSession();
      if ($fieldName) {
        if (isset($user[$fieldName]))
          return $user[$fieldName];
        else
          return null;
      } else
        return $user;
    } else {
      return null;
    }
  }
  
  public function parsePermissions($permissionsString)
  {
    $aclArray = array();
    $controllers = split(';', $permissionsString);
    foreach ($controllers as $c) {
      list($controllerName, $actions) = split(':', $c);
      if ($actions == '*') {
        $aclArray[$controllerName] = '*';
      } else {
        $aclArray[$controllerName] = split(',', $actions);
      }
    }
    $this->permissions = $aclArray;
  }
  
  public function isAuthorized()
  {
    if (!file_exists($this->config['aclFile'])) {
      exit('Acl file not found.');
    }
    include_once $this->config['aclFile'];
    
    if ($this->isLogedin()) {
      $user = $this->getLogedinUser();
      $userType = $user['user_type'];
    } else {
      $userType = 0;
    }
    
    if (!isset($acl[$userType])) {
      exit('Unknown user type');
    }
    
    $userAcl = $acl[$userType];
    if ($userAcl['permissions'] == '*') {
      $this->authorized = true;
    } else {
      $this->parsePermissions($userAcl['permissions']);
      
      $controllerName = $this->app->controllerName;
      $actionName = $this->app->actionName;
      
      if (!isset($this->permissions[$controllerName])) {
        $this->authorized = false;
      } else if ($this->permissions[$controllerName] == '*') {
        $this->authorized = true;
      } else if (in_array($actionName, $this->permissions[$controllerName])) {
        $this->authorized = true;
      } else {
        $this->authorized = false;
      }
    }
    
    if (!$this->authorized) {
      if (isset($this->app->authErrors)
          && isset($this->app->authErrors[$this->app->actionName])) {
        $this->app->Message->set('authError', $this->app->authErrors[$this->app->actionName]);
      } else {
        if ($userType == 0) {
          $this->app->Message->set('authError', $this->config['errorForGuest']);
        } else {
          $this->app->Message->set('authError', $this->config['errorForUser']);
        }
      }
    }
    return $this->authorized;
  }
  
  public function getLoginRedirect()
  {
    return (isset($this->config['loginRedirect'])) ? $this->config['loginRedirect'] : 'comment.php';
  }
  
  public function getAuthRedirect()
  {
    return $this->isLogedin() ? $this->config['redirectForUser'] : $this->config['redirectForGuest'];
  }
  
  public function isAdmin()
  {
    if (!$this->isLogedin())
      return false;
    $user = $this->getLogedinUser();
    if ($user['user_type'] != 1)
      return false;
    
    return true;
  }
}