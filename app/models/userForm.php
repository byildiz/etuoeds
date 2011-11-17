<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class UserForm extends Form
{
  public $userModel;
  
  public function setUserModel($userModel)
  {
    $this->userModel = $userModel;
    return $this;
  }
  
  public function isUniqueEmail($field, $formData)
  {
    $email = $formData[$field];
    $users = $this->userModel->select(array('email' => $email.'@etu.edu.tr'));
    return count($users) == 0;
  }
  
  public function isRegistered($field, $formData)
  {
    $email = $formData[$field];
    $users = $this->userModel->select(array('email' => $email.'@etu.edu.tr'));
    return count($users) > 0;
  }
  
  public function isValidated($field, $formData)
  {
    $email = $formData[$field];
    $users = $this->userModel->select(array('email' => $email.'@etu.edu.tr'));
    return count($users) > 0 && $users[0]['validated'];
  }
  
  public function isStEmail($field, $formData)
  {
    $email = $formData[$field];
    
    if ($email == null || $email == '') {
      return false;
    }
    
    if (substr($email, 0, 2) != 'st' || !is_numeric(substr($email, 2))) {
      return false;
    }
    return true;
  }
  
  public function isAgree($field, $formData)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    
    $tos = $formData[$field];
    if ($tos != '1') {
      return false;
    }
    
    return true;
  }
  
  public function confirmPassword($field, $formData, $passwordField)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    
    if ($formData[$passwordField] != $formData[$field]) {
      return false;
    }
    
    return true;
  }
  
  public function checkPassword($field, $formData, $account)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    $hasedPassword = Account::hash($formData[$field]);
    
    if (!$account->isLogedin())
      return false;
    $user = $account->getLogedinUser();
    
    if ($hasedPassword != $user['password'])
      return false;
    
    return true;
  }
}