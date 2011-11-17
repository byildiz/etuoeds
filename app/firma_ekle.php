<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */

// sadece yeni firmaları eklerken alt satırı yorum satırı yap.
exit('sayfa bulunamamis! en iyisi sen anasayfaya {<a href="index.php">don</a>}');

if (!($_GET['action'] && $_GET['action'] == 'ekle')) {
  echo 'Emin misin? <a href="?action=ekle">Evet</a> / <a href="/index.php">Hayir</a>';
  exit();
}

defined('DONTRUN')
  || define('DONTRUN', true);
include '../index.php';

$db = System::app()->db;

$firmalar = file_get_contents('liste.csv');
$firmalar_dizi = split("\n", $firmalar);
foreach ($firmalar_dizi as $f) {
  if ($f == '')
    continue;
  $firma = array_map('trim', split(';', $f));
  $name = mb_strtoupper($firma[0], 'UTF-8');
  $selected = $db->select('firms', array('name' => $name));
  if (count($selected) > 0) {
    $s = $selected[0];
    $updated = array(
      'city' => $firma[2],
      'contact' => $firma[3],
      'web' => $firma[4],
      'updated' => created_time()
    );
    if ($s['departments'] == '') {
      $updated['departments'] = $firma[1];
    } else if (strpos($s['departments'], $firma[1]) === false) {
      $updated['departments'] = $s['departments'].','.$firma[1];
    }
    $db->update('firms', $updated, array('id' => $s['id']));
    // pr($updated);
  } else {
    $yeni_firma = array(
      'name' => $name,
      'city' => $firma[2],
      'contact' => $firma[3],
      'web' => $firma[4],
      'departments' => $firma[1],
      'user_id' => 1,
      'created' => created_time(),
      'updated' => created_time()
    );
    $db->insert('firms', $yeni_firma);
    // pr($yeni_firma);
  }
}

echo "Tüm firmalar eklendi...";