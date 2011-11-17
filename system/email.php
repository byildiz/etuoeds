<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Email
{
  // mail priorities
  const URGENT = 0;
  const HOT = 1;
  const WARM = 5;
  const COLD = 10;
  
  // mail status
  const FRESH = 0;
  const MAILED = 1;
  const CANCELED = 2;
  
  public $app;
  
  public $config;
  
  public function __construct()
  {
    $this->app = System::app();
    if (!isset($this->app->config['mailConfig']))
      exit('Mail config not defined in config file!');
    else
      $this->config = $this->app->config['mailConfig'];
  }
  
  public function send($to, $subject, $emailFile, $data = null, $layout = false)
  {
    return $this->mail(array(
      'to' => $to,
      'from' => $this->config['fromEmail'],
      'subject' => $subject,
      'body' => $this->app->view->render('../'.$this->config['templateDir'].'/'.$emailFile, $data, $layout),
    ));
  }
  
  public function mail($mail)
  {
    require_once 'Zend/Mail.php';
    require_once 'Zend/Mail/Transport/Smtp.php';
    require_once 'Zend/Mail/Protocol/Smtp/Auth/Login.php';
    
    $transport = new Zend_Mail_Transport_Smtp($this->config['smtpServer'], $this->config['smtpAccount']);
    
    $mailer = new Zend_Mail('UTF-8');
    $mailer->setSubject($mail['subject']);
    $mailer->setBodyHtml($mail['body']);
    $mailer->setFrom($mail['from'], $this->config['fromName']);
    if (is_array($mail['to']))
      foreach ($mail['to'] as $t)
        $mailer->addTo($t);
    else
      $mailer->addTo($mail['to']);
    
    return $mailer->send($transport);
  }
  
  public function queue($mail)
  {
    $newMail = array(
      'to' => $mail['to'],
      'subject' => $mail['subject'],
      'updated' => created_time(),
      'created' => created_time(),
      'status' => self::FRESH
    );
    
    if (isset($mail['priority']))
      $newMail['priority'] = $mail['priority'];
    else
      $newMail['priority'] = self::WARM;
    
    if (isset($mail['from']))
      $newMail['from'] = $mail['from'];
    else
      $newMail['from'] = $this->config['fromEmail'];
    
    if (isset($mail['body']))
      $newMail['body'] = $mail['body'];
    else {
      $mail['data'] = isset($mail['data']) ? $mail['data'] : array();
      $mail['layout'] = isset($mail['layout']) ? $mail['layout'] : false;
      $newMail['body'] = $this->app->view->render('../'.$this->config['templateDir'].'/'.$mail['emailFile'], $mail['data'], $mail['layout']);
    }
    
    $this->app->load('Mail');
    $mailModel = $this->app->Mail;
    $mailModel->insert($newMail);
  }
  
  public function sendByPriority()
  {
    $this->app->load('Mail');
    $mailModel = $this->app->Mail;
    $mails = $mailModel->selectByPriority();
    if (count($mails) == 0)
      return true;
    
    $emails = $this->getAllEmails();
    foreach ($mails as $m) {
      // subjecti kontrol et eğer içinde * ve - varsa ona göre gönderilecek
      // kişileri belirle ve o kişilere mail at. sonra dosyasını güncelle
      $this->mail($m);
      $updated = array(
        'updated' => created_time(),
        'mailed' => created_time(),
        'status' => self::MAILED
      );
      $mailModel->update($updated, $m['id']);
    }
    
    return true;
  }
  
  public function getAllEmails()
  {
    if (!isset($this->config['allEmailsFile'])
        || !file_exist($this->config['allEmailsFile'])
    ) {
      return array();
    }
    
    $emails = explode("\n", file_get_contents($this->config['allEmailsFile']));
    $emails = array_map('trim', $emails);
    return $emails;
  }
}