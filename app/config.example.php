<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */

/**
 * Burak YILDIZ
 * 17 Temmuz 2011
 */

if (APPENV == 'beta') {
  $dbConfig = array(
    'host' => 'localhost',
    'username' => 'kullanici_adi', // beta için veritabanı kullanıcı adı
    'password' => 'sifre',         // beta için veritabanı şifresi
    'dbName' => 'veritabani_adi',  // beta için veritabanı adı
    'tablePrefix' => 'oeds',
  );
} else {
  $dbConfig = array(
    'host' => 'localhost',
    'username' => 'kullanici_adi', // veritabanı kullanıcı adı
    'password' => 'sifre',         // veritabanı şifresi
    'dbName' => 'veritabani_adi',  // veritabanı adı
    'tablePrefix' => 'oeds',
  );
}

return array(
  'dbConfig' => $dbConfig,
  'viewConfig' => array(
    'layout' => 'layout.php',
    'dir' => APPDIR.'/views',
  ),
  'modelConfig' => array(
    'dir' => APPDIR.'/models',
  ),
  'accountConfig' => array(
    'salt' => 'rastgele_metin',    // rastgele üretilmiş metin
    'aclFile' => APPDIR.'/acl.php',
    'errorForUser' => 'Bu sayfaya erişim yetkin yok',
    'redirectForUser' => 'error.php?s=auth',
    'errorForGuest' => 'Bu sayfaya erişmek için giriş yapmalısın',
    'redirectForGuest' => 'login.php',
    'loginRedirect' => 'profile.php',
  ),
  'mailConfig' => array(
    'fromName' => 'ETÜ OEDS',
    'fromEmail' => 'email@example.com',      // gönderici email adresi, ÖRN: info@etuoeds.com
    'smtpServer' => 'mail.etu.edu.tr',       // gönderici email sunucusu, ÖRN: mail.etu.edu.tr
    'smtpAccount' => array(
      'auth' => 'login',
      'username' => 'email@example.com',     // smtp kullanıcı adı
      'password' => 'sifre',                 // smtp şifresi
    ),
    'templateDir' => 'email',
    'allEmailsFile' => APPDIR.'/emails.txt', // fazla önemli bişe değil
  ),
  'loadPaths' => array(
    APPDIR.'/helpers',
    APPDIR.'/models',
  ),
  'autoLoad' => array(
    'Message',
    'Account',
    'Firm',
    'ActionButton',
    'Loger',
  ),
  'logConfig' => array(
    'dir' => APPDIR.'/logs',
  ),
  'oauthConfig' => array(
    'twitter' => array(
      'callbackUrl' => 'http://www.etuoeds.com/login.php?s=twitter_callback',
      'siteUrl' => 'http://twitter.com/oauth',
      'consumerKey' => 'consumer_key',        // twitter key
      'consumerSecret' => 'consumer_secret',  // twitter secret
    )
  ),
);