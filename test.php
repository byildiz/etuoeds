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
 * 15 Ağustos 2011 14:13
 */

defined('DONTRUN')
  || define('DONTRUN', true);

include 'index.php';

$get = filter_request($_GET);
$testDirPath = BASEDIR.'/tests';

if (isset($get['file']))
  $testFilePath = $testDirPath.'/'.$get['file'].'.php';
else
  $testFilePath = '';

if (!isset($get['file']) || !file_exists($testFilePath)) {
  if (isset($get['file'])) {
    echo '<p style="color: red">test dosyasi bulunamadi: '.$get['file'].'</p>';
  }
  $testDirHandle = opendir($testDirPath);
  while (($file = readdir($testDirHandle)) !== false) {
    if ($file != "." && $file != "..")
      echo '<a href="test.php?file='.array_shift(explode('.', $file)).'">'.$file.'</a>';
  }
} else {
  include $testFilePath;
}