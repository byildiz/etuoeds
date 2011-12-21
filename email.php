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
 * 21 Aralık 2011 16:32
 */
 
defined('DONTRUN')
    || define('DONTRUN', true);

include 'index.php';

// her 3 dakikada bir 4 mail
// saatte 80 mail, kalan 20 mail acil mailler için
$app = $system->app();
$app->load('Emailer');
$app->Emailer->sendByPriority();