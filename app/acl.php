<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


$acl = array(
  0 => array(
    'type' => 'guest',
    'permissions' => 'index:*;register:*;logout:*;login:*;error:*;pages:*;test:*'
  ),
  1 => array(
    'type' => 'admin',
    'permissions' => '*'
  ),
  2 => array(
    'type' => 'user',
    'permissions' => 'index:*;comment:*;register:*;logout:*;login:*;firm:*;question:*;answer:*;error:*;settings:*;pages:*;test:*;vote:*;profile:*;blog:*'
  ),
);