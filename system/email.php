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
    
    $emails = $this->getList();
    $count = 0;
    foreach ($mails as $m) {
      // subject regular exp. olsun ve ona göre her mail için gönderilecekler
      // listesi oluştur ve göndermeye başla
      $listFilePath = $this->config['emailListsDir'].'/list_'.$m['id'].'.txt';
      if (!file_exists($listFilePath)) {
        $matches = array();
        foreach ($emails as $e) {
          if (preg_match('|'.$m['to'].'|imsU', $e)) {
            $matches[] = $e;
          }
        }
        file_put_contents($listFilePath, implode("\n", $matches));
      }
      
      $emailList = $this->getList($listFilePath, true);
      $index = 0;
      foreach ($emailList[0] as $index => $e) {
        $m['to'] = $e;
        $this->mail($m);
        $emailList[1][$index] = '~'.$emailList[1][$index];
        $count++;
        if ($count >= $this->config['perDeliveryCount'])
          break;
      }
      // eğer listedeki herkese gönderildiyse maili gönderildi olarak işaretle
      if (count($emailList[0]) == $count) {
        $updated = array(
          'updated' => created_time(),
          'mailed' => created_time(),
          'status' => self::MAILED
        );
        $mailModel->update($updated, $m['id']);
      }
      // mail listesinide güncelle
      file_put_contents($listFilePath, implode("\n", $emailList[1]));
      // yeterince mail gönderildiyse çık
      if ($count >= $this->config['perDeliveryCount'])
        break;
    }
    
    return true;
  }
  
  public function getList($filePath = null, $original = false)
  {
    if (!$filePath) {
      if (!isset($this->config['allEmailsFile'])
          || !file_exists($this->config['allEmailsFile'])
      ) {
        return array();
      } else {
        $filePath = $this->config['allEmailsFile'];
      }
    }
    
    $emails = explode("\n", trim(file_get_contents($filePath)));
    $emails = array_map('trim', $emails);
    $list = array();
    foreach ($emails as $i => $e) {
      if (strpos($e, '~') === false) {
        $list[$i] = $e;
      }
    }
    if ($original) {
      return array($list, $emails);
    } else {
      return $list;
    }
  }
}