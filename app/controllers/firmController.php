<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class FirmController extends Controller
{
  public function add()
  {
    $this->load('Firm');
    $this->load('FirmForm');
    $rules = array(
      'name' => array(
        array(
          'notEmpty',
          'Firmanın adı yok mu?'
        ),
        array(
          'isUnique',
          'Firma önceden eklenmiş',
          $this->Firm
        )
      )
    );
    $this->FirmForm->setRules($rules);
    
    if (!empty($_POST['firm'])) {
      $firmData = filter_request($_POST['firm']);
      if (isset($firmData['name'])) {
        $firmData['name'] = mb_strtoupper($firmData['name'], 'UTF-8');
      }
      if ($this->FirmForm->validate($firmData)) {
        $user = $this->Account->getLogedinUser();
        $newFirmData = array(
          'name' => $firmData['name'],
          'city' => '',
          'web' => '',
          'departments' => '',
          'contact' => '',
          'user_id' => $user['id'],
          'created' => created_time(),
          'updated' => created_time()
        );
        
        if ($this->Firm->insert($newFirmData)){
          $firmId= $this->Firm->lastInsertId();
          // log kaydı
          $logMessage = sprintf('Yeni Firma: <a href="admin.php?s=view_user&user_id=%s">%s</a> epostalı kullanıcı yeni bir <a href="admin.php?s=view_firm&firm_id=%s">firma</a> ekledi.', $user['id'], $user['email'], $firmId);
          $this->Loger->log('INFO', $logMessage);
          
          $this->redirect('comment.php?firm_id='.$firmId);
        }
      }
    }
    $this->view->FirmForm = $this->FirmForm;
    $this->view->show('add_form.php');
  }
  
  public function update_match()
  {
    if (!empty($_POST)) {
      $this->load('Match');
      $user = $this->Account->getLogedinUser();
      $userId = $user['id'];
      
      if (isset($_POST['ha'])
          && isset($_POST['ha']['id'])
          && is_array($_POST['ha']['id'])) {
        foreach ($_POST['ha']['id'] as $firmId) {
          $this->Match->addMatch($firmId, $userId);
        }
      }
      if (isset($_POST['wa'])
          && isset($_POST['wa']['id'])
          && is_array($_POST['wa']['id'])) {
        foreach ($_POST['wa']['id'] as $firmId) {
          $this->Match->addMatch($firmId, $userId, 1);
        }
      }
      if (isset($_POST['hd'])
          && isset($_POST['hd']['id'])
          && is_array($_POST['hd']['id'])) {
        foreach ($_POST['hd']['id'] as $firmId) {
          $this->Match->deleteMatch($firmId, $userId);
        }
      }
      if (isset($_POST['wd'])
          && isset($_POST['wd']['id'])
          && is_array($_POST['wd']['id'])) {
        foreach ($_POST['wd']['id'] as $firmId) {
          $this->Match->deleteMatch($firmId, $userId, 1);
        }
      }
    }
    $this->goback();
  }
}