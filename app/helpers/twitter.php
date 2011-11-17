<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


require_once 'Zend/Oauth.php';
require_once 'Zend/Oauth/Consumer.php';
require_once 'Zend/Json.php';

class Twitter
{
  public $app;
  
  public $config;
  
  public $consumer;
  
  public function __construct()
  {
    $this->app = System::app();
    $this->config = $this->app->config['oauthConfig'];
    $this->consumer = new Zend_Oauth_Consumer($this->config['twitter']);
  }
  
  public function redirect()
  {
    $requestToken = $this->consumer->getRequestToken();
    $_SESSION['TWITTER_REQUEST_TOKEN'] = my_serialize($requestToken);
    $this->consumer->redirect();
  }
  
  public function callback()
  {
    if (!isset($_SESSION['TWITTER_REQUEST_TOKEN']) || empty($_GET))
      $this->app->redirect('login.php?s=twitter_login');
    
    if (isset($_GET['denied'])) {
      $infoData = array(
        'title' => 'Twitter Hesabı',
        'message' => 'ETÜOEDS\'ye izin vermedin. Alacağın olsun :(<br/><br/>Anasayfaya {<a class="underline" href="index.php">dön</a>}'
      );
      $this->app->info('info.php', $infoData);
    }
    
    try {
      // request tokenı kullanarak access token'ı al
      $requestToken = my_unserialize($_SESSION['TWITTER_REQUEST_TOKEN']);
      $accessToken = $this->consumer->getAccessToken($_GET, $requestToken);
      if (!$accessToken->isValid())
        throw new Exception("Access token geçerli değil");
      
      // remote id'yi al
      $remoteId = $accessToken->user_id;
      // twitter için hesap türü
      $accountType = 'twitter';
      
      $this->app->load('Oauth');
      $account = $this->app->Account;
      $oauthModel = $this->app->Oauth;
      
      // varsa önceki oauth kayıtlarını bul
      $where = array(
        'account_type' => $accountType,
        'remote_id' => $remoteId,
      );
      $oauth = $oauthModel->selectFirst($where);
      
      // kullanıcı giriş yaptıysa yeni oauth oluşturuyordur
      if ($account->isLogedin()) {
        $userId = $account->getLogedinUser('id');
        if ($oauth && ($userId == $oauth['user_id'])) { // daha önceden ilişkilendirilmiş
          $updatedOauth = array(
            'request_token' => my_serialize($requestToken),
            'access_token' => my_serialize($accessToken),
            'updated' => created_time(),
          );
          $oauthModel->update($updatedOauth, $oauth['id']);
          $this->app->redirect('settings.php');
        } else if ($oauth) { // başkasının hesabıyla ilişkilendirilmiş
          $message = 'Giriş yapılan twitter hesabı zaten başka bir ETÜOEDS hesabıyla eşleştirilmiş.<br/><br/><a href="login.php?s=twitter_login">Buradan</a> başka bir twitter hesabıyla yeniden giriş yap veya anasayfaya {<a class="underline" href="index.php">dön</a>}';
        } else { // yeni hesap
          $newOauht = array(
            'account_type' => $accountType,
            'request_token' => my_serialize($requestToken),
            'access_token' => my_serialize($accessToken),
            'remote_id' => $remoteId,
            'user_id' => $userId,
            'updated' => created_time(),
            'created' => created_time(),
          );
          $oauthModel->insert($newOauht);
          $message = 'Twitter hesabın ETÜOEDS hesabınla eşleştirildi. Artık twitter hesabınla da ETÜOEDS\'ye giriş yapabileceksin.<br/><br/>Ayarlar sayfasına {<a class="underline" href="settings.php">dön</a>}';
        }
        $infoData = array(
          'title' => 'Twitter Hesabı',
          'message' => $message,
        );
        $this->app->info('info.php', $infoData);
      } else {
        if (!$oauth) {
          $infoData = array(
            'title' => 'Twitter Hesabı',
            'message' => 'Twitter hesabın hiçbir ETÜOEDS hesabıyla eşleştirilmemiş. Bu twitter hesabınla giriş yapabilmek için önce ETÜOEDS hesabınla siteye <b>Giriş yap</b> daha sonra sol menüden <b>Ayarlar</b> menüsüne gir. Açılan sayfada <b>Hesaplar</b> kısmında twitter hesabın ile ETÜOEDS hesabını eşleştir.'
          );
          $this->app->info('info.php', $infoData);
        }
        $updatedOauth = array(
          'request_token' => my_serialize($requestToken),
          'access_token' => my_serialize($accessToken),
          'updated' => created_time(),
        );
        $oauthModel->update($updatedOauth, $oauth['id']);
        $account->fakeLogin(null, $oauth['user_id']);
        $this->app->redirect($account->getLoginRedirect());
      }
    } catch (Exception $e) {
      $infoData = array(
        'title' => 'Twitter Hesabı',
        'message' => 'Şu an twitter hesabına erişilemiyor.<br/><br/><a href="login.php?s=twitter_login">Buradan</a> tekrar dene veya anasayfaya {<a class="underline" href="index.php">dön</a>}'
      );
      $this->app->info('info.php', $infoData);
    }
  }
  
  public function isSynced($userId)
  {
    $this->app->load('Oauth');
    $oauthModel = $this->app->Oauth;
    $where = array(
      'user_id' => $userId,
      'account_type' => 'twitter',
    );
    $oauth = $oauthModel->selectFirst($where);
    if (!$oauth)
      return false;
    
    $accessToken = my_unserialize($oauth['access_token']);
    return $this->_isAuth($accessToken);
  }
  
  private function _isAuth($accessToken)
  {
    try {
      $client = $accessToken->getHttpClient($this->config['twitter']);
      $client->setUri('http://twitter.com/account/verify_credentials.json');
      $client->setMethod(Zend_Http_Client::GET);
      $response = $client->request();
      return !$response->isError();
    } catch (Exception $e) {
      return false;
    }
  }
}