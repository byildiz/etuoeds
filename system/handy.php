<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


function pr($data)
{
  echo '<pre>';
  print_r($data);
  echo '</pre>';
}

function created_time()
{
  date_default_timezone_set('Europe/Istanbul');
  
  static $created;
  if ($created == null) {
    $created = date('Y-m-d H:i:s');
  }
  return $created;
}

function filter_request($str)
{
  if (is_array($str)) {
    foreach ($str as $i => $s)
      $str[$i] = filter_request($s);
    return $str;
  } else
    return htmlspecialchars(stripslashes(trim($str)));
}

function filter_sql($str)
{
  if (is_array($str)) {
    foreach ($str as $i => $s)
      $str[$i] = filter_sql($s);
    return $str;
  } else
    return mysql_real_escape_string($str);
}

function lcfirst($str)
{
  if (strlen($str) > 0) {
    return strtolower($str[0]).substr($str, 1);
  } else
    return '';
}

function rand_str()
{
  return sha1(mt_rand());
}

function mysql2date($date)
{
  $dateArray = split(' ', $date);
  $date = split('-', $dateArray[0]);
  $time = split(':', $dateArray[1]);
  
  return $date[2].'-'.$date[1].'-'.$date[0];
}

function next_month()
{
  return time()+3600*24*30;
}

function entry_cmp($a, $b)
{
  return $a['created'] < $b['created'];
}

function my_serialize($a)
{
  return base64_encode(serialize($a));
}

function my_unserialize($a)
{
  return unserialize(base64_decode($a));
}