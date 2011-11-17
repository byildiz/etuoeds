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
 * 17 Temmuz 2011 00:44
 */

defined('APPENV')
    || define('APPENV', (getenv('APPENV') ? getenv('APPENV') : 'release'));

(APPENV == 'release')
  || error_reporting(E_ALL);

defined('DS')
  || define('DS', DIRECTORY_SEPARATOR);

defined('BASEDIR')
  || define('BASEDIR', realpath(dirname(__FILE__)));

defined('APPDIR')
  || define('APPDIR', BASEDIR.DS.'app');

defined('SYSDIR')
  || define('SYSDIR', BASEDIR.DS.'system');

$paths = array(
  BASEDIR.'/libs',
  SYSDIR,
  get_include_path()
);
set_include_path(implode(PATH_SEPARATOR, $paths));

require_once SYSDIR.'/system.php';

$system = new System();

if (defined('DONTRUN')) {
  $system->run(APPDIR.'/config.php', false);
} else {
  $system->run(APPDIR.'/config.php');
}