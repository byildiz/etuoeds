<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class Form
{
  public $app;
  
  public $rules = null;
  
  public $formData = null;
  
  public $messager;
  
  public function __construct()
  {
    $this->app = System::app();
    $this->app->load('Message');
    $this->messager = $this->app->Message;
  }
  
  public function setRules($rules)
  {
    $this->rules = $rules;
    return $this;
  }
  
  public function setFormData($formData)
  {
    $this->formData = $formData;
    return $this;
  }
  
  public function validate($formData)
  {
    $this->formData = $formData;
    
    $ret = true;
    if (is_array($this->rules)) {
      foreach ($this->rules as $field => $f) {
        if (!is_array($f[0])) {
          $f = array($f);
        }
        foreach ($f as $ff) {
          if (isset($ff[2])) {
            if (!$this->{$ff[0]}($field, $formData, $ff[2])) {
              $this->messager->set('Form.'.$field, $ff[1]);
              $ret = false;
              break;
            }
          } else {
            if (!$this->{$ff[0]}($field, $formData)) {
              $this->messager->set('Form.'.$field, $ff[1]);
              $ret = false;
              break;
            }
          }
        }
      }
    }
    return $ret;
  }
  
  public function getErrors()
  {
    return $this->messager->get('Form');
  }
  
  public function errorFor($field)
  {
    if ($this->messager->has('Form.'.$field))
      echo '<div class="formError">'.$this->messager->get('Form.'.$field).'</div>';
  }
  
  public function getField($field)
  {
    if (isset($this->formData[$field])) {
      echo $this->formData[$field];
    }
  }
  
  public function maxLength($field, $formData, $l)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    
    if (strlen($formData[$field]) > $l) {
      return false;
    }
    
    return true;
  }
  
  public function minLength($field, $formData, $l)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    
    if (strlen($formData[$field]) < $l) {
      return false;
    }
    
    return true;
  }
  
  public function notEmpty($field, $formData)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    
    $str = trim($formData[$field]);
    if (strlen($str) == 0) {
      return false;
    }
    
    return true;
  }
  
  public function isUnique($field, $formData, $model)
  {
    if (!isset($formData[$field])) {
      return false;
    }
    
    $where = array(
      $field => $formData[$field]
    );
    
    $data = $model->select($where);
    
    if (count($data) > 0) {
      return false;
    }
    
    return true;
  }
}