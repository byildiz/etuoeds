SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE `oeds_answers` (
  `id` int(11) NOT NULL auto_increment,
  `answer` text NOT NULL,
  `vote_count` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_comments` (
  `id` int(11) NOT NULL auto_increment,
  `comment` text NOT NULL,
  `vote_count` int(11) NOT NULL default '0',
  `review_count` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL,
  `firm_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL default '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_firms` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `city` varchar(100) default NULL,
  `contact` varchar(100) default NULL,
  `web` varchar(100) default NULL,
  `departments` varchar(100) default NULL,
  `comment_count` int(11) NOT NULL default '0',
  `question_count` int(11) NOT NULL default '0',
  `vote_count` int(11) NOT NULL default '0',
  `view_count` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_logs` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_lookups` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_mails` (
  `id` int(11) NOT NULL auto_increment,
  `to` varchar(100) NOT NULL,
  `from` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `priority` int(11) NOT NULL default '5',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `mailed` datetime default NULL,
  `status` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_matches` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `firm_id` int(11) NOT NULL,
  `wish` tinyint(1) NOT NULL default '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_oauths` (
  `id` int(11) NOT NULL auto_increment,
  `account_type` varchar(50) NOT NULL,
  `request_token` text NOT NULL,
  `access_token` text NOT NULL,
  `remote_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_questions` (
  `id` int(11) NOT NULL auto_increment,
  `question` text NOT NULL,
  `answer_count` int(11) NOT NULL default '0',
  `vote_count` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL,
  `firm_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_users` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `code` varchar(40) NOT NULL,
  `validated` tinyint(1) NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `user_type` int(11) NOT NULL default '2',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE `oeds_votes` (
  `id` int(11) NOT NULL auto_increment,
  `object_name` varchar(50) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO `oeds_firms` VALUES (1, 'ORTAK EĞİTİM SİSTEMİ', 'ANKARA', 'ortakegitim@etu.edu.tr', 'http://ortakegitim.etu.edu.tr', '', 8, 5, 0, 0, 1, '2011-10-18 14:07:15', '2011-10-18 14:07:15', 0);
INSERT INTO `oeds_firms` VALUES (2, '2Y YAPI ENDÜSTRİ SAN. TİC. LTD. ŞTİ.', 'BURSA', 'oacur@mynet.com', '', 'ikt', 1, 0, 1, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (3, 'A TASARIM MİMARLIK LTD. ŞTİ.', 'ANKARA', 'info@atasarim.com.tr', 'http://www.atasarim.com.tr', 'sat', 3, 3, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (4, 'A6 İNŞAAT -KEMHAŞ İNŞAAT', 'ANKARA', '', '', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (5, 'ABAŞ PREFABRİKE YAPI ELEMANLARI VE TURİZM SAN. TİC. A.Ş.', 'İZMİR', 'abas@abas.com.tr', 'www.abas.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (6, 'ABDİOĞULLARI PLASTİK VE AMBALAJ SAN.A.Ş.', 'ADANA', 'aliyilmaz@abdiogullari.com', 'www.abdiogulları.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (7, 'AD DEMİREL ÇELİK KONSTRÜKSİYON VE MAKİNA SAN. A.Ş.', 'KOCAELİ', 'add@addemirel.com', 'http://www.addemirel.com.tr', 'ikt', 1, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (8, 'ADA MÜHENDİSLİK VE YAZILIM HİZM. TİC. LTD. ŞTİ.', 'ANKARA', 'engin@ada.com.tr', 'www.adamuhendislik.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (9, 'ADANA SANAYİ ODASI', 'ADANA', 'gensek@adaso.org.tr', 'www.adaso.org.tr', 'ulu,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (10, 'ADANA TİCARET ODASI', 'ADANA', 'dilek@adana-to.org.tr', 'http://www.adana-to.org.tr', 'ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (11, 'ADNAN PAZ. OTOMOTİV SAN. MÜH. HİZ. TİC. LTD.', 'TRABZON', 'yusufyildiz@adnanotomotiv.com', 'http://www.adnanotomotiv.com/', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (12, 'ADOPEN PLASTİK VE İNŞAAT SAN. A.Ş.', 'ANTALYA', 'adem.inal@adopen.com.tr', 'www.adopen.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (13, 'ADVANSA SASA POLYESTER SAN. A.Ş.', 'ADANA', 'gozde.canga@advansa.com', 'www.advansa.com', 'ele,isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (14, 'AES ELEKTRONİK VE MAKİNA SAN.VE TİC.LTD.ŞTİ.', 'BURSA', 'etunc@aeselektronik.com.tr', 'www.aes-elektronik.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (15, 'AES-IC İÇTAŞ ENERJİ ÜRETİM VE TİC.A.Ş.', 'ANKARA', 'cagla.demir@aesic.com.tr', 'www.aesic.com.tr', 'mak,isl,bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (16, 'AFS BORU SANAYİ A.Ş.', 'ANKARA', 'merkez@afs.com.tr', 'www.afs.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (17, 'AFYON TİCARET VE SANAYİ ODASI', 'AFYON', 'bim@afyontso.org.tr', 'www.afyonkarahisartso.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (18, 'AGE İNŞAAT VE TİCARET A.Ş.', 'ISPARTA', 'a.ozkapici@age.com.tr', 'www.age.com.tr', 'ikt,end,ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (19, 'AĞAOĞLU YÜN İPEK TEKSTİL SAN. VE TİC. A.Ş.', 'UŞAK', 'agaoglu@agaoglu.com', 'www.agaoglu.com', 'ulu,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (20, 'AJAN ELEKTRONİK LTD. ŞTİ.', 'İZMİR', 'halukcinarli@ajancnc.com', 'www.ajan.com.tr', 'mak,bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (21, 'AJANS-TÜRK GAZ. MAT. İNŞ. SAN. A.Ş.', 'ANKARA', 'info@ajansturk.com.tr', 'ajansturk.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (22, 'AKALIN MAKİNA VANA SAN. VE TİC. LTD. ŞTİ.', 'ADANA', 'info@avsvalve.com', 'www.avsvalve.com', 'isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (23, 'AKANA MÜHENDİSLİK VE TİCARET LTD ŞTİ.', 'ANKARA', 'erdalgulculer@akana.com.tr', 'www.akana.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (24, 'AKAR INTERNATIONAL HOTELS', 'ANKARA', 'byilmaz@akarhotel.com', 'www.akarhotel.com', 'isl', 1, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (25, 'AKBACAKOĞLU KUNDURA SAN. VE TİC. A.Ş.', 'ANKARA', 'ahmet@ayakkabidunyasi.com.tr', 'www.ayakkabidunyasi.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (26, 'AKÇAĞ BASIM YAYIM PAZARLAMA A.Ş.', 'ANKARA', 'akcag@akcag.com.tr', 'http://www.akcag.com.tr', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (27, 'AKDAŞ DÖKÜM SAN. VE TİC. A.Ş.', 'ANKARA', 'gbektas@akdas.com.tr', 'www.akdas.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (28, 'AKDENİZ İHRACATÇI BİRLİKLERİ', 'İÇEL', 'info@akib.org.tr', 'http://www.akib.org.tr', 'ikt', 0, 2, 0, 0, 1, '2011-10-18 15:19:32', '2011-11-17 15:15:39', 0);
INSERT INTO `oeds_firms` VALUES (29, 'AKE ASANSÖR MALZ. PAZ. LTD. ŞTİ.', 'ANTALYA', 'yalciner@ake.com.tr', 'www.ake.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (30, 'AKEL İMALAT İNŞ. TURİZM LTD. ŞTİ.', 'ANKARA', 'akelauto@yahoo.com', 'www.akelauto.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (31, 'AKFEN HOLDİNG A.Ş.', 'ANKARA', 'sozlen@akfen.com.tr', 'www.akfen.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (32, 'AKGÜN BİLGİSAYAR PROG. VE HİZMET SAN. TİC. LTD. ŞTİ.', 'TRABZON', 'merve.gurkan@akgunyazilim.com.tr', 'www.akgunyazilim.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (33, 'AKIŞIK BİLGİSAYAR TEKSTİL İNŞAAT İTH. İHR. SAN. VE TİC. LTDİ. ŞTİ.', 'İSTANBUL', 'alpaslan@akisik.com.tr', 'www.akisik.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (34, 'AKKA İNŞ. VE TUR. TİC. A.Ş. (ANTEDON DE LUXE OTEL)', 'ANTALYA', 'akahraman@akkagrup.com', 'www.antedondeluxe.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (35, 'AKKAYALAR MAKİNA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'akkayalar@akkayalar.com.tr', 'www.akkayalar.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (36, 'AKPINAR DÖKÜM VE MAKİNE SAN. A.Ş.', 'ANKARA', 'info@akpinardokum.com', 'www.akpinardokum.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (37, 'AKSA ANKARA MAK. SAT. VE SER. A.Ş.', 'ANKARA', 'tarikc@ank.aksa.com.tr', 'www.aksa.com.tr', 'isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (38, 'AKSAKALLI HUKUK BÜROSU', 'ANKARA', 'sedataksakalli@sedataksakalli.av.tr', 'http://www.sedataksakalli.av.tr', 'huk', 1, 1, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (39, 'AKSAN BOYA KİMYA SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'aksan@aksanboya.com', 'www.aksanboya.com', 'end,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (40, 'AKSAN ÇELİK DÖVME SAN. TİC. A.Ş.', 'ANKARA', 'aysuna@aksanforging.com', 'www.aksanforging.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (41, 'AKSAN KARDAN SAN. VE DIŞ. TİC. LTD. ŞTİ.', 'ANKARA', 'info@aksanshaft.com', 'www.aksanshaft.com', 'mak', 1, 1, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (42, 'AKSARAY TİCARET VE SANAYİ ODASI', 'AKSARAY', 'aksaraytso@tobb.org.tr', 'www.aksaraytso.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (43, 'AKSEL DIŞ TİCARET  A.Ş.', 'İZMİR', 'assist@aksel.com.tr', 'www.aksel.com.tr', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (44, 'AKYÜREK KARDEŞLER LTD. ŞTİ.', 'İÇEL', 'info@akyurekltd.com', 'www.akyurekltd.com', 'isl,mak,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (45, 'AKYÜZ MERMER İNŞAAT SAN. VE TİC. LTD. ŞTİ.', 'HATAY', 'ahmet@akyuzmermer.com', '', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (46, 'ALACA TİCARET VE SANAYİ ODASI', 'ÇORUM', 'gunsersirin@alacatso.tobb.org.tr', 'http://alacatso.tobb.org.tr', 'ikt,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (47, 'ALANYALI ENTEGRE AHŞAP SAN. VE TİC. A.Ş.', 'ANTALYA', 'alanyali@alanyaliahsap.com.tr', '', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (48, 'ALAŞEHİR TİCARET BORSASI', 'MANİSA', '', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (49, 'AL-CAP AMBALAJ SAN. VE TİC. A.Ş.', 'ANKARA', 'info@al-cap.com - uretim@al-cap.com', 'www.al-cap.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (50, 'ALFA ASANSÖR SANAYİ TİC. A.Ş.', 'ANKARA', 'info@alfaasansor.com.tr', 'www.alfaasansor.com', 'ele,mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (51, 'ALFER MÜH. TAAH. TİC. VE SAN. A.Ş.', 'ANKARA', 'insankaynaklari@alfer.com.tr', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (52, 'ALGAN YAZILIM VE BİLİŞİM TİC. LTD. ŞTİ.', 'ANKARA', 'bilgi@alganyazilim.com.tr', 'http://www.alganyazilim.com.tr', 'end,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (53, 'ALGORİZMA İŞ YÖNETİM SİS. TİC. LTD. ŞTİ.', 'ANKARA', 'fatma.s@algorizma.com', 'www.algorizma.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (54, 'ALIS YAZILIM', 'ADANA', '', '', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (55, 'ALKON GAYRIMENKUL YATIRIM İNŞAAT TAAHHÜT SAN. VE TIC. AŞ', 'ANKARA', 'ayhancaglayan@alkoninsaat.com.tr', 'www.alkoninsaat.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (56, 'ALMİN ALÜMİNYUM PROFİL SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'ismetgulen@alminprofil.com.tr', 'www.alminprofil.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (57, 'ALPARDA MOBİLYA ÜRETİM VE PAZARLAMA LTD. ŞTİ.', 'ANKARA', 'sinan@alparda.com', 'www.alparda.com', 'sat,mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (58, 'ALPDATA BİLGİSAYAR YAZ. DONANIM SİST. LTD. ŞTİ.', 'ANKARA', 'nuray@alpdata.com.tr', 'www.alpdata.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (59, 'ALTES ALÜMİNYUM LTD. ŞTİ.', 'ANKARA', 'altes@altesaluminium.com', 'www.altesaluminium.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (60, 'ALTINORDU TREYLER SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'fatih@altinordu.com.tr', 'www.altinordu.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (61, 'ALTINYAĞ KOMBİNALARI  A.Ş.', 'İZMİR', 'rabay@altinyag.com.tr', 'www.altinyag.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (62, 'ALTİM ALUMİNYUM SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', '"info@altim.com.tr  	 "', 'http://www.altim.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (63, 'ALVER İNŞAAT SAN. VE TİC. A.Ş.', 'ANKARA', 'ceyhunalver@gmail.com', 'www.alver.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (64, 'AMASYA TİCARET VE SANAYİ ODASI', 'AMASYA', 'amasyatso@tobb.org.tr', 'www.amasyatso.tobb.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (65, 'ANADOLU EFES BİRACILIK VE MALT SANAYİİ A.Ş.', 'ANKARA', 'fadime.oz@efespilsen.com.tr', 'www.anadoluefes.com', 'end,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (66, 'ANADOLU GROUP ELEKTRİK ENERJİ A.Ş.', 'ANKARA', 'bilgi@anadoluenerji.com.tr', 'www.anadoluenerji.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (67, 'ANADOLU İŞ MAK. SAN. VE TİC. LTD. ŞTİ. (ANİŞMAK)', 'ANKARA', 'dguzel@anismak.com', 'www.anismak.com', 'mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (68, 'ANADOLU METALURJİ VE MAKİNE SAN. TİC. A.Ş.', 'ANKARA', 'tozyer@anadolumetalurji.com', 'www.anadolumetalurji.com', 'end,mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (69, 'ANADOLU ORGANİZE SANAYİ BÖLGESİ', 'ANKARA', 'atatli@anadoluosb.org.tr', 'www.anadoluosb.org.tr', 'ikt,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (70, 'ANADOLU SİGORTA GENEL MÜDÜRLÜĞÜ', 'İZMİR', 'hdonmez@anadolusigorta.com.tr', 'www.anadolusigorta.com.tr', 'mat,ikt,bil,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (71, 'ANAYASA MAHKEMESİ', 'ANKARA', 'oguz.kaya@anayasa.gov.tr', 'http://www.anayasa.gov.tr/', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (72, 'AND DÖKÜM MAK.MODEL SAN.VE TİC.LTD.ŞTİ.', 'ANKARA', 'info@anddokum.com.tr', 'http://anddokum.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (73, 'ANDROBİL YAZILIM BİLİŞİM TEKNOLOJİLERİ VE MEDİKAL SAN. VE TİC. LTD.ŞTİ.', 'ANKARA', 'syilmaz@androbil.com', 'http://www.androbil.com/', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (74, 'ANEL ARAŞTIRMA VE GELİŞTİRME DANIŞMANLIK SAN. VE TİC. A.Ş.', 'ANKARA', 'sibel.durdagi@anelarge.com', 'www.anel.com.', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (75, 'ANIL KAĞITCILIK AMBALAJ LTD. ŞTİ.', 'ANKARA', 'muhasebe@anilambalaj.com.tr', 'www.anilambalaj.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (76, 'ANKARA BETON BORU SAN. VE TİC. A.Ş.', 'ANKARA', 'info@ankarabeton.com.tr', 'www.ankarabeton.com.tr', 'mak,ele,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (77, 'ANKARA DÜŞÜNCE VE ARAŞTIRMA MERKEZİ DERNEĞİ (ADAM)', 'ANKARA', '', 'www.adam.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (78, 'ANKARA DÜŞÜNCE VE ARAŞTIRMA MERKZ. DERNEĞİ', 'ANKARA', '', '', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (79, 'ANKARA FİNAL DERGİSİ DERSHANELERİ', 'ANKARA', 'ankara@fdd.com.tr', 'www.fdd.com.tr', 'mat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (80, 'ANKARA NETMON İLETİŞİM SİSTEMLERİ TİC. SAN. A.Ş.', 'ANKARA', 'ahmetkurt@netmon.com.tr', 'www.netmon.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (81, 'ANKARA SANAYİ ODASI', 'ANKARA', 'levent.soykan@aso.org.tr', 'www.aso.org.tr', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (82, 'ANKARA TİCARET BORSASI', 'ANKARA', 'bim@atb.gov.tr', '', 'mat,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (83, 'ANKARA TİCARET ODASI', 'ANKARA', 'ergezen@atonet.org.tr', 'www.atonet.org.tr', 'ulu,isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (84, 'ANKARA UN SANAYİ A.Ş.', 'ANKARA', 'yalcin@ankaraun.com', 'www.ankaraun.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (85, 'ANKARA ÜNİVERSİTESİ AVRUPA TOPLULUKLARI ARAŞTIRMA VE UYGULAMA MERKEZİ', 'ANKARA', 'denk@politics.ankara.edu.tr', '', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (86, 'ANKARA YATAK & KAPİTONE SANAYİ TİCARET A.Ş.', 'ANKARA', 'esra@laressa.com.tr', 'www.ankarayatak.com', 'end,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (87, 'ANKİRA ELEKTRONİK TAS. YAZILIM GELİŞTİRME BİLG. VE DAĞ. HİZM. LTD. ŞTİ.', 'ANKARA', 'ecevit@ankira.com.tr', 'ankira.com.tr', 'bil,isl,end,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (88, 'ANOVA PROJE VE DANIŞMANLIK TİC. LTD.ŞTİ', 'ANKARA', '', 'www.anova.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (89, 'ANTAKYA TICARET VE SANAYI ODASI', 'HATAY', 'acunetoglu@antakyatso.org.tr', 'http://www.antakyatso.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (90, 'ANTALYA TİCARET BORSASI', 'ANTALYA', 'info@antalyaborsa.org.tr', 'http://www.antalyaborsa.org.tr', 'isl,ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (91, 'ANTALYA TİCARET VE SANAYİ ODASI', 'ANTALYA', 'info@atso.org.tr', 'www.atso.org.tr', 'isl,mat,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (92, 'ANTCAM A.Ş.', 'ANTALYA', 'kozgen@antcam.com.tr', 'www.antcam.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (93, 'APEKS KIRT. AMBALAJ. LTD. ŞTİ.', 'İSTANBUL', 'info@apexistanbul.com', 'apexistanbul.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (94, 'APSİS KONTROL SİSTEMLERİ SAN.VE TİC.LTD.ŞTİ', 'ANKARA', 'uysal@apsis.com.tr', 'www.apsis.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (95, 'AR MAKİNA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'info@armakina.com.tr', 'www.armakina.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (96, 'ARÇELİK A.Ş. ( ÇAMAŞIR MAKİNASI FABRİKASI)', 'İSTANBUL', 'begum.tekin@arcelik.com', 'arcelik.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (97, 'ARÇELİK A.Ş. (ANKARA BULAŞIK MAK. FABRİKASI)', 'ANKARA', 'sena.uzmez@arcelik.com', 'www.arcelik.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (98, 'ARÇELİK A.Ş. (ANKARA ŞUBE SATIŞ MÜDÜRLÜĞÜ)', 'ANKARA', '', 'www.arcelik.com.tr', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (99, 'ARÇELİK A.Ş. (AR-GE MERKEZİ)', 'İSTANBUL', 'serpil.ozdemir@arcelik.com', 'www.arcelik.com.tr', 'ele,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (100, 'ARÇELİK A.Ş. (ELEKTRONİK İŞLETMESİ)', 'İSTANBUL', 'nurefsan.acar@arcelik.com', 'www.arcelik.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (101, 'ARÇELİK A.Ş. (PİŞİRİCİ CİHAZLAR FABRİKASI)', 'BOLU', 'tulay.demir@arcelik.com', 'www.arcelik.com.tr', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (102, 'ARÇELİK A.Ş.( BUZDOLABI VE KOMPRESÖR İŞLETMESİ)', 'ESKİŞEHİR', 'ali.orhan@arcelik.com', 'www.arcelikas.com.tr', 'mak,ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (103, 'ARDIÇ CAM SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'erdal@ardiccam.com.tr', 'www.ardiccam.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (104, 'ARETA İNTERNET İLETİŞİM VE DANIŞMANLIK HİZM. LTD. ŞTİ.', 'ANKARA', 'ik@areta.com.tr', 'www.areta.com.tr', 'sat,ulu,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (105, 'ARIKAZAN A.Ş.', 'ANKARA', 'ari@tr.net', 'www.arikazan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (106, 'ARKADAŞ YAYINCILIK VE PAZARLAMA DIŞ TİCARET LTD. ŞTİ.', 'ANKARA', 'editor@arkadas.com.tr', 'www.arkadas.com.tr', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (107, 'ARKADAŞ YAZILIM VE TEKNOLOJİ MAKİNE EĞİTİM SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'ercumentb@arkadas.com.tr', 'www.arkadas.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (108, 'ARMA FİLTRE SİSTEMLERİ SAN. VE TİC. A.Ş.', 'SAKARYA', 'muharremeraslan@armafiltre.com.tr', 'www.armafiltre.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (109, 'ARMAS ELEKTRONİK SAN.VE TİC.LTD.ŞTİ.', 'ANKARA', 'info@armaselektronik.com', 'www.armaselektronik.com', 'sat,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (110, 'ARMETAL MAKİNE METAL SAN. VE TİC. LTD. ŞTİ.', 'KOCAELİ', 'info@armetal.com.tr', 'www.armetal.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (111, 'ARMİN ELEKTRİK İNŞAAT SAN. VE TİC. A.Ş.', 'ANKARA', 'unalboztunali@armin.com.tr', 'www.armin.com.tr', 'ele,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (112, 'ARPEK ARKAN PARÇA ALÜMİNYUM ENJEKSİYON VE KALIP SAN.TİC.A.Ş.', 'KOCAELİ', 'erkangul@arpek.com.tr', '', 'bil,end,isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (113, 'ARTELLA ASLANDAĞ AHŞAP İNŞ. LTD. ŞTİ.', 'İSTANBUL', 'aydin@aslandagmobilya.com', 'www.artella.com.tr', 'isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (114, 'ARTLAB ARASTIRMA GELISTIRME LTD. STI.', 'ANKARA', 'alp.tunc@artlab.com.tr', 'http://www.artlab.com.tr/', 'ele,isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (115, 'ARZU OĞUZ HUKUK BÜROSU', 'ANKARA', '', '', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (116, 'AS ÇELİK DÖKÜM İŞLEME SAN. TİC. LTD. ŞTİ.', 'SAMSUN', 'melihyanik@ascelik.com', 'www.ascelikltd.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (117, 'ASAŞ AMBALAJ BASKI SANAYİ VE TİC. A.Ş.', 'ANKARA', 'yasin.atak@asas.com.tr', 'www.asas.com.tr', 'ulu,isl,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (118, 'ASLAN HUKUK BÜROSU', 'İSTANBUL', 'info@yilmazaslan.av.tr', 'http://www.yilmazaslan.av.tr/', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (119, 'AS-MAK-SAN MAKİNE SAN. TİC. LTD.ŞTİ.', 'ANKARA', 'asmaksan@asmaksan.com', 'http://asmaksan.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (120, 'ASO 1. ORGANİZE SANAYİ BÖLGESİ MÜDÜRLÜĞÜ', 'ANKARA', 'i.h.alpturk@aosb.org.tr', 'www.aosb.org.tr', 'isl,ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (121, 'ASO 2. VE 3. ORGANİZE SANAYİ BÖLGESİ', 'ANKARA', 'menekse.satli@aso2osb.org.tr', 'http://www.aso2osb.org.tr', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (122, 'ASPARSAN ALÜMİNYUM DÖKÜM VE PARÇA SAN. TİC. A.Ş.', 'ANKARA', 'sboz@bexan.com.tr', 'www.asparsan.com.tr', 'mak,end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (123, 'ASSAN ALÜMİNYUM A.Ş.', 'İSTANBUL', 'gokhan.yagsagan@kibarholding.com', 'www.kibarholding.com', 'end,isl,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (124, 'AŞUT FİBERGLASS TİC. SAN. LTD. ŞTİ.', 'İÇEL', 'ik@asutfiberglass.com', 'www.asutfiberglass.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (125, 'ATA TV -IŞIK İLETİŞİM YAY. A.Ş.', 'ANKARA', 'ata@atatv.com.tr', 'www.atatv.com.tr', 'bil,ikt,ele,ulu,tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (126, 'ATA YAZILIM END. TAS. TİC. LTD. ŞTİ.', 'ANKARA', 'aysu@atayazilim.com.tr', 'atayazilim.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (127, 'ATAK MÜH. İNŞ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'atak@atakltd.com.tr', 'http://www.atakltd.com.tr/', 'bil,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (128, 'AUNDE ACHTER&EBELS GMBH', 'YURTDIŞI', '', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (129, 'AYDIN TİCARET ODASI', 'AYDIN', 'atob@atob.org.tr', 'www.atob.org.tr', 'ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (130, 'AYDIN YAZILIM  VE ELEKTRONİK SAN. AŞ.', 'ANKARA', 'ebrug@ayesas.com', 'www.ayesas.com', 'ele,bil,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (131, 'AYDINER İNŞAAT A.Ş.', 'ANKARA', 'info@aydiner.com.tr', 'www.aydiner.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (132, 'AYDINLAR YEDEK PARCA SANAYI VE TICARET A.Ş?.', 'KONYA', 'ahmet@aydchassis.com', 'http://www.aydchassis.com', 'ulu,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (133, 'AYDOĞANLAR OTOMOTİV SAN. TİC. LTD. ŞTİ.', 'ANKARA', '', 'www.aydoganlarotomotiv.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (134, 'AYGEM PLASTİK VE ELEKTRİK LTD. ŞTİ.', 'İZMİR', 'etapucu@aygem.com.tr', '', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (135, 'AYGERSAN AYDINLATMA GEREÇLERİ SAN. VE TİC. A.Ş.', 'ANKARA', 'aygersan@aygersan.com.tr', 'www.bayraktarlar.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (136, 'AYKON ELEKTRİK TAAHHÜT SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@aykonelektrik.com', 'http://www.aykonelektrik.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (137, 'AYKON PANO ELEKTRİK SİSTEMLERİ SAN. VE TİC. A.Ş.', 'ANKARA', 'info@aykonelektrik.com', 'http://www.aykonelektrik.com', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (138, 'AYKON YAPI ENDÜSTRİSİ LTD. ŞTİ.', 'ANKARA', 'aykon@aykonyapi.com.tr', 'http://www.aykonyapi.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (139, 'AYMAK KIRMA ELEME MAKİNALARI SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', '', 'http://www.aymak.net/tr/', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (140, 'AYRİM MİMARLIK MÜH. TURİZM İNŞ. LTD. ŞT.', 'ANKARA', 'ayrimmim@yahoo.com', 'www.ayrim.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (141, 'AYTAÇ GIDA YATIRIM SAN.VE TİC. A.Ş.', 'ÇANKIRI', 'hamdi.karatay@aytac.com.tr', 'www.aytac.com.tr', 'mak,ele,end,isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (142, 'AYTEMİZ AKARYAKIT DAĞITIM A.Ş.', 'İSTANBUL', 'emre.k@aytemiz.com.tr', 'http://www.aytemiz.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (143, 'AYTEMİZLER MAKİNA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'aytemizler@aytemizler.com.tr', 'www.aytemizler.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (144, 'AYTEMİZLER TEKSTİL SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'ayt@aytemizler.com.tr', '', 'ulu,bil,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (145, 'BALIKÇIOĞLU MOBİLYA TASARIM DEKORASYON A.Ş.', 'ANKARA', 'fabrika@balikcioglu.com.tr', 'http://www.balikcioglu.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (146, 'BALIKESİR TİCARET ODASI', 'BALIKESİR', 'erdogan@bato.org.tr', 'http://www.bato.org.tr', 'ulu,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (147, 'BANDIRMA SİGORTA ARACILIK HİZMETLERİ LTD. ŞTİ.', 'BALIKESİR', 'bilgi@bandirmasigorta.com', '', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (148, 'BAŞARAN NAS YMM A.Ş. (PRICEWATERHOUSE COOPERS)', 'İSTANBUL', 'sibel.eren@tr.pwc.com', 'http://www.pwc.com', 'ikt,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (149, 'BAŞBAKANLIK DEVLET ARŞİVLERİ GENEL MÜDÜRLÜĞÜ', 'ANKARA', 'dagm@devletarsivleri.gov.tr', 'www.devletarsivleri.gov.tr', 'tde,tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (150, 'BAŞKENT GÜVENLİK HİZMETLERİ LTD.ŞTİ.', 'ANKARA', 'arzuyuceler@hotmail.com', 'http://www.baskentguvenlik.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (151, 'BAŞKENT OTO EMNİYET CAMLARI SAN. VE TİC. A.Ş.', 'ANKARA', 'export@baskentotocam.com.tr', 'www.baskentotocam.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (152, 'BAŞOL YAPI MALZEMELERİ TİC. LTD.ŞTİ.', 'ANKARA', 'ilker_unaldi@hotmail.com', 'http://www.basolyapi.com.tr/', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (153, 'BAŞÖZ ENERJİ A.Ş.', 'ANKARA', 'zeynepb@basozenerji.com.tr', 'http://www.basozenerji.com.tr', 'mak,ikt,ulu,ele,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (154, 'BAŞTAŞ-BAŞKENT ÇİMENTO SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'bastascimento@vicat.com.tr', '', 'isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (155, 'BATI BASMA SAN. A.Ş.', 'İZMİR', 'cuneytkipcak@batibasma.net', 'www.batibasma.com', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (156, 'BAYCAN ELEKTRIK SAN. VE TIC. A.Ş.', 'ESKİŞEHİR', 'engin.yilmaz@baycan.com.tr', 'http://www.baycan.com.tr/tr/index.asp', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (157, 'BAYKAL MAKİNE  SANAYİ A.Ş.', 'BURSA', 'ik@baykal.com.tr', 'www.baykal.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (158, 'BAYRAKTARLAR TASARIM ARAŞTIRMA GELİŞTİRME HİZMETLERİ VE TİC. A.Ş.', 'BURSA', '', 'www.farba.com.', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (159, 'BEĞENDİK MAĞ. İŞLET. TİC. VE SAN. A.Ş.', 'ANKARA', 'demet.ozener@beğendik.com.tr', 'http://www.begendik.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (160, 'BEKEL BEYAZ EŞYA SAN. TİC. A.Ş.', 'ESKİŞEHİR', 'inka@bekel.com', 'www.bekel.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (161, 'BEMAŞ ELEKT.MÜH.SAN.TİC.LTD.ŞTİ.', 'ANKARA', 'bemas@bemaselektronik.com.tr', 'www.bemaselektronik.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (162, 'BERİL TEKNOLOJİ BİLİŞİM İNŞ. TİC. VE SAN. LTD. ŞTİ.', 'ANKARA', 'info@beriltech.com', 'www.beriltech.com', 'isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (163, 'BERKE PLASTİK A.Ş.', 'İSTANBUL', 'info@berkeplastik.com.tr', 'www.berkeplastik.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (164, 'BESİCE TARIM ÜRÜNLERİ SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'muhasebe@besice.com.tr', 'www.besice.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (165, 'BESMAK LAB.NAK.VE İNŞ.SAN.TİC. VE LTD.ŞTİ.', 'ANKARA', 'info@besmaklab.com', 'www.besmaklab.com.', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (166, 'BETIAD', 'YURTDIŞI', '', '', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (167, 'BETONEL PREFABRİK BETON ELEMANLARI SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'betonel@betonel.com.tr', 'www.betonel.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (168, 'BEYTEKS KONFEKSİYON İMALAT İHRACAT VE TİC. A.Ş.', 'KONYA', 'nilgunarici@akkanatholding.com', 'www.akkanatholding.com', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (169, 'BİL YAZILIM VE ELEKTRONİK SİS. BİLG. MÜH. SAN VE TİC LTD.ŞTİ.', 'ANKARA', 'bilgi@bilyazilim.com', 'http://bilyazilim.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (170, 'BİLEKMAK MÜHENDİSLİK VE TASARIM HİZMETLERİ', 'ANKARA', 'halid.balaban@bilekmak.com', 'www.bilekmak.com', 'isl,mak,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (171, 'BİLEN OTOMOTİV TİC. LTD.ŞTİ.', 'İÇEL', 'acokgunlu@hotmail.com.tr', 'www.bilenoto.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (172, 'BİLFER MADENCİLİK VE TURİZM A.Ş.', 'İZMİR', 'adnaneroglu@bilfer.com', 'www.bilfer.com', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (173, 'BİLİM VE SANAT VAKFI', 'İSTANBUL', 'farukdeniz@bisav.org.tr', 'www.bisav.org.tr', 'tde,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (174, 'BİLİŞİM&İNOVASYON SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'uakkus@bilisim-inovasyon.com.tr', 'www.bilisim-inovasyon.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (175, 'BİLKENT ÜNİVERSİTESİ BİLGİSAYAR MERKEZİ', 'ANKARA', 'seyit @bilkentedu.tr', 'http://www.bilkent.edu.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (176, 'BİL-YEM GIDA SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'metincayir@hotmail.com', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (177, 'BİMEL ELEKT. MAM. PAZ. LTD. ŞTİ.', 'ANKARA', 'ender@bimel.com.tr', 'www.bimel.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (178, 'BİRKO BİRLEŞİK KOYUNLULAR MENSUCAT TİC. VE SAN. A.Ş.', 'ANKARA', 'info@birko.com.tr', 'www.birko.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (179, 'BİTES BİLİŞİM SİSTEMLERİ YAZILIM VE İLETİŞİM TEKNOLOJİLERİ TİC. LTD. ŞTİ.', 'ANKARA', 'ebru.coskun@bites.com.tr', 'http://www.bites.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (180, 'BİTES SAVUNMA HAVACILIK VE UZAT TEKNOLOJİLERİ YAZ. ELEK. TİC. LTD. ŞTİ.', 'ANKARA', 'ugur.coskun@bites.com.tr-aynur.erel@bites.com.tr', 'www.bites.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (181, 'BIZITEK BILGISAYAR YAZILIM VE INTERNET TEKNOLOJILERI A.Ş. (ERICSSON)', 'İSTANBUL', 'banu.karadag@bizitek.com', 'www.bizitek.com', 'bil,end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (182, 'BİZNET BİLİŞİM SİST. VE DAN. SAN.TİC. A.Ş.', 'ANKARA', 'nsayari@biznet.com.tr', 'www.biznet.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (183, 'BM MÜHENDISLIK VE İNŞAAT A.Ş.', 'ANKARA', 'gunay.ozyoruk@bmmuh.com.tr', 'www.bmmuh.com.tr', 'bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (184, 'BNT MAKİNE İNŞ. GIDA TEM. MED. PAZ. SAN. VE TİC LTD.ŞTİ.', 'ANKARA', 'info@bntcom.com', 'http://www.bntcom.com', 'end,mak,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (185, 'BORUSAN HOLDİNG A.Ş.', 'İSTANBUL', 'ayalin@borusan.com', 'http://www.borusan.com.tr', 'isl,end,ikt,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (186, 'BORUSAN MANNESMAN BORU SAN. TİC. A.Ş', 'İSTANBUL', 'skocak@borusan.com', 'www.borusanmannesmann.com', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (187, 'BORUSAN OTOMOTİV İTHALAT VE DAĞITIM A.Ş.', 'ANKARA', 'tufan.oral@borusanoto.com', 'http://www.borusanoto.com/', 'mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (188, 'BOYTAŞ MOBİLYA  SANAYİ VE TİCARET A.Ş.', 'KAYSERİ', 'huseyin.oyman@boytas.com.tr', 'www.boytas.com.tr', 'isl,ikt,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (189, 'BOZANKAYA OTO MAK.İML.LTD.', 'ANKARA', '', '', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (190, 'BOZANKAYA OTOMOTIV MAK.İTHALAT VE İHRACAT LTD.ŞTI.', 'ANKARA', 'info@bozankaya.com', 'www.bozankaya.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (191, 'BOZLU HOLDİNG A.Ş.', 'İSTANBUL', 'ceyda.yazici@bozlu.com', 'http://www.bozlu.com', 'isl,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (192, 'BRITISH SIDE İNGİLİZCE YAKASI YURTDIŞI EĞİTİM HİZMETLERİ LTD.ŞTİ.', 'ANKARA', 'ankara@britishside-edu.com', 'www.biritishside-edu.com', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (193, 'BUGSAŞ BAŞKENT ULAŞIM VE DOĞALGAZ HİZ. PROJE TAAH. SAN. TİC. A.Ş.', 'ANKARA', 'info@bugsas.com.tr', 'http://www.bugsas.com.tr/', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (194, 'BURSA TİCARET VE SANAYİ ODASI', 'BURSA', 'nbalkan@btso.org.tr', 'www.btso.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (195, 'BÜLBÜLOĞLU VİNÇ SANAYİİ VE TİCARET A.Ş.', 'ANKARA', 'insankaynaklari@bvs.com.tr', 'www.bvs.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (196, 'BÜŞRA TEKSTİL VE GİYİM SAN. LTD. ŞTİ.', 'ANKARA', 'busratekstil@hotmail.com', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (197, 'C&Ç YEMİNLİ MALİ MÜŞ. LTD. ŞTİ.', 'ANKARA', 'info@ustadim.com', 'www.ustadim.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (198, 'CANPA İZOLASYON MALZEMELERİ ÜRETİM VE PAZARLAMA LTD.ŞTİ.', 'ANKARA', 'cengiz.sahin@canpa.com.tr', 'http://www.canpa.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (199, 'CANTEK SOĞUTMA MAK. SAN. VE TİC. LTD. ŞTİ.', 'ANTALYA', 'ismail.gokkaya@cantek.biz', 'www.cantekcooling.com', 'bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (200, 'CELKA BORU VE MİL SAN. TİC. A.Ş.', 'İZMİR', 'pinar@celka.com.tr', 'http://www.celka.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (201, 'CER DÖKÜM VE  MAKİNA SANAYİ A.Ş.', 'ANKARA', 'cer@cerdokum.com', 'http://www.cerdokum.com/uretim.htm', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (202, 'CEVA LOJİSTİK LTD. ŞTİ.', 'İSTANBUL', '', '', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (203, 'CEYTECH BİLİŞİM VE İLETİŞİM TEKNOLOJİLERİ TİC. LTD. ŞTİ.', 'ANKARA', 'wassim@ceytech.com', '', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (204, 'CITO TÜRKİYE EĞİT. ARAŞ. ÖLÇME DEĞER. DANIŞ. LTD. ŞTİ.', 'ANKARA', 'nedim.toker@cito.com.tr', 'www.cito.com.tr', 'bil,mat,isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (205, 'CMS MAK. SAN. VE TİC. A.Ş.', 'İSTANBUL', 'altugo@cmsmachine.com', 'www.cmsmachine.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (206, 'CMS SAĞLIK HİZMETLERİ VE TİC. LTD. ŞTİ.', 'ANKARA', '', '', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (207, 'COCA COLA İÇECEK A.Ş.', 'TEKİRDAĞ', 'IlkerMustafa_Isoglu@cci.com.tr', 'www.cci.com.tr', 'ele,mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (208, 'COCA COLA SATIŞ VE DAĞITIM A.Ş.', 'İÇEL', 'patricia_gazze@cci.com.tr', 'www.cci.com.tr', 'end,ulu,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (209, 'COMART KURUMSAL İLETİŞİM HİZMETLERİ', 'ANKARA', 'aliresat@comart.com.tr', 'www.comart.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (210, 'CORVİTRO BİLİŞİM TİCARET LTD.ŞTİ.', 'ANKARA', 'canan.kurtulus@corvitro.com', '', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (211, 'CSS YAZILIM ÇÖZÜMLERİ LTD. ŞTİ.', 'ANKARA', 'hnayir@css.net.tr', 'www.css.net', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (212, 'CVS MAKİNA İNŞAAT SAN. VE TİC. LTD.ŞTİ.', 'KOCAELİ', 'eozdogru@cvs.com.tr', 'http://www.cvs.com.tr/', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (213, 'CYBERSOFT ENFORMASYON TEKNOLOJİLERİ LTD. ŞTİ.', 'İSTANBUL', 'gulay.yildiz@cs.com.tr', 'www.cybersoft.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (214, 'ÇAĞIL MAKİNA A.Ş.', 'ÇORUM', 'info@cagilmakina.com', 'www.cagilmakina.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (215, 'ÇALIK ENERJİ SAN.TİC.A.Ş.', 'ANKARA', 'vehbi.ablay@calikenerji.com', 'http://www.calikenerji.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (216, 'ÇEMAŞ DÖKÜM SANAYİ A.Ş.', 'KIRŞEHİR', 'oazak@cemas.com.tr', 'cemas.com.tr', 'mak,ele,bil,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (217, 'ÇETİNKAYA ÇELİK KALIP MAKİNA SAN. VE TİC.LTD.ŞTİ.', 'İSTANBUL', 'info@cetinkayakalip.com', 'www.cetinkayakalip.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (218, 'ÇEVRE SAĞLIĞI SAN. LTD. ŞTİ. ÇESAN', 'ANKARA', 'kalite@cesanltd.com', 'www.cesanltd.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (219, 'ÇORUH TRANS DIŞ TİCARET TURİZM İMALAT NAKLİYAT LTD. ŞTİ.', 'ARTVİN', 'coruhtrans@coruhtrans.com', 'www.coruhtrans.com', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (220, 'ÇORUM TİCARET VE SANAYİ ODASI', 'ÇORUM', 'mzeybel@ctso.org.tr', 'www.ctso.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (221, 'ÇÖZÜM BİLGİSAYAR SATICILIĞI PROGRAMCILIĞI TİC. SAN. LTD. ŞTİ.', 'ANKARA', 'senol.aba@cozumbil.com.tr', 'www.cozumbil.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (222, 'DATASEL BİLGİ SİSTEMLERİ A.Ş.', 'ANKARA', 'ayling@datasel.com.tr', 'www.datasel.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (223, 'DEDEMAN TURİZM YATIRIMLARI A.Ş.', 'ANKARA', 'kursat.uc@dedeman.com', 'www.dedemanhotels.com', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (224, 'DEĞİRMENCİ OTOMOTİV VE METAL END. A.Ş.', 'KONYA', 'degirmenci@dome.com.tr', 'www.dome.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (225, 'DEKARE BİLİŞİM DESTEK VE DAN.HİZ.SAN.TİC.A.Ş.', 'İSTANBUL', 'rustu_korkmaz@sentim.com.tr', '', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (226, 'DELOITTE- DRT BAĞIMSIZ DENETIM VE SERBEST MUHASEBECI MALI MÜŞAVIRLIK A.Ş.', 'İSTANBUL', 'bberktas@deloitte.com', 'www.deloitte.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (227, 'DELTA EKO HAVACILIK SAVUNMA VE UZAY TEK. SAN. TİC. A.Ş.', 'ANKARA', 'ozlem@deltatrade.com', 'http://www.delta-eko.org', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (228, 'DEMSAN MAKİNE VE ELEKTRİK SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'demircanas@demircanins.com.tr', 'www.demircanins.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (229, 'DENİZLİ MODERN TEKSTİL SANAYİ VE TİC. A.Ş.', 'DENİZLİ', 'modern@moderntex.com', 'www.moderntex.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (230, 'DENİZLİ SANAYİ ODASI', 'DENİZLİ', 'drbuygun@dso.org.tr', 'www.denizliso.tobb.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (231, 'DENKER ELEKTRONIK VE BILGISAYAR SAN. VE TIC. LTD.ŞTI.', 'İSTANBUL', 'horz@denker.com.tr', 'www.denker.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (232, 'DESIGN NOBIS AYRINTI ARAŞTIRMA GELİŞTİRME PROJE TASARIM LTD. ŞTİ.', 'ANKARA', 'info@designnobis.com', 'http://www.designnobis.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (233, 'DESTEK PATENT A.Ş.', 'KONYA', 'hakan.keskin@destekpatent.com.tr', 'www.destekpatent.com.tr', 'isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (234, 'DIGITECH DİJİTAL TEK. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@digitech-ltd.com', 'www.digitech-ltd.com', 'bil,ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (235, 'DIŞ EKONOMİK İLİŞKİLER KURULU(DEİK)', 'İSTANBUL', 'gyildirim@deik.org.tr', 'www.deik.org.tr', 'isl,ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (236, 'DIŞ POLİTİKA ENSTİTÜSÜ', 'ANKARA', 'fpi@foreignpolicy.org.tr', 'www.foreignpolicy.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (237, 'DİKTAŞ SOĞUTMA VE METAL İML. SAN. TİC. A.Ş.', 'ANKARA', 'idariisler@diktas.com', 'www.diktaş.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (238, 'DİRİNLER MAKİNA SAN. VE TİC. A.Ş.', 'İZMİR', 'kalite@dirinler.com.tr', 'www.dirinler.com.tr', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (239, 'DİYARBAKIR TİCARET VE SANAYİ ODASI', 'DİYARBAKIR', 'ditso@ditso.org', 'www.ditso.org', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (240, 'DOCUART BİLGİSAYAR VE İLETİŞİM LTD. ŞTİ.', 'ANKARA', 'muzaffert@docuart.com.tr', 'www.docuart.com.tr', 'end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (241, 'DOĞAN TEL ÖRGÜ DEMİR DEKORASYON İML. MONTAJ TİC.TAAH.İTH.SAN. VE LTD.ŞTİ.', 'ANKARA', 'dogantel@dogantel.com.tr', 'http://www.dogantel.com.tr', 'isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (242, 'DOĞRUYOL TEKSTİL', 'DENİZLİ', 'ayhandogruyol@hotmail.com', 'www.dogruyol.com.tr', 'isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (243, 'DOLE ELEKTRİK TAAHHÜT TİC.LTD.ŞTİ', 'ANKARA', '', 'www.doleelektrik.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (244, 'DOLSAN MEDİKAL EKİPMANLAR İMALAT  SANAYİ', 'ANKARA', 'yonetim1@dolsan.com.tr', 'http://www.dolsan.com.tr', 'ulu,mak,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (245, 'DOMİNO GRUP TURİZM ORG. OTO KİRALAMA İNŞ. VE GAYRİMENKUL LTD. ŞTİ.', 'ANKARA', 'gul@enerjikongresi.com', 'www.dominom.net', 'isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (246, 'DOMSAN DOĞRAMA MOBİLYA SAN. A.Ş.', 'ANKARA', 'domsan@domsan.com', 'www.domsan.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (247, 'DORAGLASS - DORA OTOMOTİV CAM SANAYİ VE TİC.A.Ş.', 'ANKARA', 'm.kurt@doraglass.com', 'www.doraglass.com', 'mak,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (248, 'DORÇE PREFABRİK YAPI İNŞ. VE SAN. TİC. A.Ş.', 'ANKARA', 'personel@dorce.com.tr', 'www.dorce.com.tr', 'mak,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (249, 'DSK GROUP', 'YURTDIŞI', '', '', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (250, 'DURMAZLAR MAKİNA SANAYİ VE TİCARET A.Ş.', 'BURSA', 'nakan@durmazlar.com.tr', 'www.durmazlar.com.tr', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (251, 'DURSUNLAR METAL PLASTİK VE BOYAMA SAN. TİC. LTD. ŞTİ.', 'TEKİRDAĞ', 'yigit_ali_55@hotmail.com', 'www.dursunlarmetal.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (252, 'DURUKAN ŞEKERLEME SAN. VE TİC. A.Ş.', 'ANKARA', 'burcak.ertem@durukan.com.tr', 'www.durukan.com.tr', 'isl,mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (253, 'DUSE KENT MOBİLYALARI SAN. VE TİC. LTD.', 'ANKARA', 'nedimgunes@dusekent.com.tr', 'www.dusekent.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (254, 'DUSOFT YAZILIM DANIŞMANLIK EĞİTİM HİZMETLERİ', 'ANKARA', 'murat.duran@digitalunity.com', 'http://www.digitalunity.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (255, 'DÜZCE TICARET VE SANAYI ODASI', 'DÜZCE', 'info@duzcetso.org.tr', 'www.duzcetso.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (256, 'DÜZGÜNLER MAK. SAN. TİC. LTD. ŞTİ.', 'KONYA', 'ziya@duzgunlermak.com.tr', 'duzgunler.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (257, 'EAGLE BURGMAN END. SIZD. SAN. TİC. LTD. ŞTİ.', 'İSTANBUL', 'ilknur.tergip@tr.eagleburgmann.com', 'www.eagleburgmann.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (258, 'EDİRNE TİCARET BORSASI', 'EDİRNE', 'etb@etb.org.tr', 'www.etb.org.tr', 'isl,ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (259, 'EDİRNE TİCARET VE SANAYİ ODASI', 'EDİRNE', 'nevzataskin@etso.org.tr', 'www.etso.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (260, 'EDVAN VANTİLATÖR SAN. VE TİC. LTD. ŞTİ.', 'BALIKESİR', 'agurel@edvan.com.tr', 'www.edvan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (261, 'EFG İSTANBUL MENKUL DEĞERLER A.Ş.', 'İSTANBUL', 'firdevs.sanci@efgistanbulsec.com', 'http://www.efgistanbulsec.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (262, 'EG ELEKTRONIK TEKNOLOJI HABERLEŞME BILIŞIM VE KONTROL SISTEMLERI SAN. TIC. LTD. ŞTI.', 'ANKARA', 'bora@egelektronik.com', 'www.egelektronik.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (263, 'EG YAZILIM DONANIM VE DANIŞMANLIK LTD. ŞTI.', 'ANKARA', 'info@egyazilim.com', 'www.egyazilim.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (264, 'EGE BİMTES LTD.ŞTİ.', 'İZMİR', 'burcu.musaoglu@egebimtes.com.tr', 'www.egebimtes.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (265, 'EGE BÖLGESİ SANAYİ ODASI', 'İZMİR', 'galip.kokulu@ebso.org.tr', 'www.ebso.org.tr', 'isl,ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (266, 'EGE ENDÜSTRİ VE TİC. A.Ş.', 'İZMİR', 'funda.tarsus@egeendustri.com.tr', 'www.egeendusti.com.tr', 'mak,isl,end,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (267, 'EKON ENDÜSTRİ İNŞAAT VE TİC. A.Ş.', 'ANKARA', 'fercan@ekonas.com.tr', 'http://www.ekonas.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (268, 'EKSTRAMETAL DÖKÜM İZABA VE MAK. SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'renginatilgan@ekstrametal.com.tr', 'http://www.ekstrametal.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (269, 'ELAZIĞ ALTINOVA ÇİMENTO SAN TİC.A.Ş.', 'ELAZIĞ', 'erdaltalu@elazig.cimentas.com', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (270, 'ELBA BİLGİSAYAR LTD. ŞTİ.', 'ANKARA', 'gsavari@elbaltd.com.tr', 'http://www.elbaltd.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (271, 'ELBİSTAN GÖZDE İNŞAAT TİC. LTD. ŞTİ.', 'K.MARAŞ', 's_dumlupinar69@hotmail.com', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (272, 'ELBİSTAN TİCARET VE SANAYİ ODASI', 'K.MARAŞ', 'y.gozudeli@elbistantso.org.tr', 'www.elbistantso.org.tr', 'isl,ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (273, 'ELCO ELEVATOR ELEKTRİK SİS. SAN. VE TİC.  LTD. ŞTİ.', 'ANKARA', 'elco@elco.com.tr', '', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (274, 'ELEKTROMED ELEKTRONİK SANAYİ VE SAĞLIK HİZMETLERİ LTD. ŞTİ.', 'ANKARA', 'hande@elektromed.com.tr', 'www.elektromed.com.tr', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (275, 'ELİMKO  ELEKTRONİK  İMALAT VE  KONTROL  TİC. LTD. ŞTİ.', 'ANKARA', 'kurban@elimko.com.tr', 'www.elimko.com.tr', 'end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (276, 'ELİMSAN ŞALT CİH. VE ELEKTROMEKANİK SAN. VE TİC. A.Ş.', 'KOCAELİ', 'demet.cap@elimsangroup.com', 'www.elimsangroup.com', 'ele,end,isl,bil,mak,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (277, 'ELİN ELEKT. İNŞ. MÜŞ. PROJE TAAH. TİC. VE SAN. A.Ş.', 'ANKARA', 'murat@elin.com.tr', 'www.elin.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (278, 'ELİT TASARIM DEKORASYON İNŞAAT TİC. LTD.ŞTİ.', 'ANKARA', 'suatkeskin2004@yahoo.com', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (279, 'ELİTE NATUREL İÇECEK SAN. TİC. LTD. ŞTI.', 'ANKARA', 'info@elitenaturel.com', 'http://www.elitenaturel.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (280, 'ELMA SEPETİ BİLGİSAYAR YAZILIM İTHALAT İHRACAT EĞİTİM SERVİS VE REKLAMCILIK TİCARET A.Ş', 'İSTANBUL', 'satis@elmasepeti.com', 'www.elmasepeti.com', 'isl,ikt', 1, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (281, 'ELSER ELEKTRONİK TEKNİK SERVİS A.Ş.', 'ANKARA', 'info@kurt.com.tr', 'www.elser.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (282, 'EMEK BORU  MAKİNA SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'emek@emekboru.com.tr', 'www.emekboru.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (283, 'EMEK ELEKT. END. A.Ş.', 'ANKARA', 'mehmet.eski@emek.com.tr', 'www.emek.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (284, 'EMEK TEKNOMAD JEOLOJİ MADEN. MÜH. HARİTA VE MÜŞ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@emekteknomad.com', '', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (285, 'EMES ELEKTROMEKANIK SIS. SAN. VE TIC. LTD. STI.', 'ANKARA', 'turker.ozturk@emesltd.com', 'www.emesltd.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (286, 'EMGE KOLLEKTİF ŞİRKETİ ELEKTRO MEKANİK GEREÇLER ENDÜSTRİSİ', 'ANKARA', 'mithat@emge.com.tr', 'www.emge.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (287, 'EMİT BİLİŞİM VE İLETİŞİM TEKNOLOJİLERİ SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'naslan@digitatek.com', 'http://www.emitbilisim.com/', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (288, 'EMS ELEKTRONİK MEKANİK SİSTEMLER LTD. ŞTİ.', 'ANKARA', 'mkdemir@ems-ltd.com.tr', 'www.ems-ltd.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (289, 'ENCON ÇEVRE DANIŞMANLIK LTD. ŞTİ.', 'ANKARA', 'encon@encon.com.tr', 'http://www.encon.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (290, 'ENDEL A.Ş.', 'ESKİŞEHİR', 'tarik.basay@endel.com.tr', 'www.endel.com.tr', 'mak,isl,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (291, 'ENDEL AŞ. (MANİSA)', 'MANİSA', 'inka@endel.com', 'www.endel.com.tr', 'end,ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (292, 'ENDER MÜHENDİSLİK İNŞAAT VE TİC. A.Ş.', 'ANKARA', 'yaseminduman@enderinsaat.com', 'http://www.enderinsaat.com', 'mak,ele,sat,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (293, 'ENDOKS ENERJİ SİST.LTD.ŞTİ.', 'ANKARA', 'info@endoks.com.tr', 'www.endoks.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (294, 'ENI S.P.A  TURKEY REPRESENTATIVE OFFICE', 'İSTANBUL', 'luigi.barberis@eni.com', 'www.eni.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (295, 'EPSİLON HAVACILIK UZAY VE  SAVUNMA SAN.TİC.LTD.ŞTİ.', 'ANKARA', 'aotabatmaz@epsiloncomposite.com', 'http://epsiloncomposite.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (296, 'EPTİM ELEKTRİK İNŞ.VE TİC.LTD.ŞTİ.', 'ANKARA', 'eptim@eptim.com.tr', 'www.eptim.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (297, 'ER MAKİNA İŞ MAK. DİŞLİ VE YEDEK PARÇA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'fatih@ermakina.com.tr', 'www.er-makina.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (298, 'ERALTEK BİLİŞİM TEKNOLOJİLERİ KIRTASİYE SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'murat.altiok@eraltek.com.tr', 'www.eraltek.com.tr', 'bil,mat,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (299, 'ERBAZLAR MOBİLYA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'cenkerbaz@erbazlar.com.tr', 'www.erbazlar.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (300, 'ERBOSAN ERCİYES BORU SAN. VE TİC. A.Ş.', 'ANKARA', 'personel@erbosan.com.tr', 'www.erbosan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (301, 'EREN TRAFO ELEKTRİK LTD. ŞTİ.', 'ANKARA', 'info@erentrafo.com', 'www.erentrafo.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (302, 'ERGENEKON ÇELİK SAN. TİÇ. A.Ş.', 'ANKARA', '', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (303, 'ERİŞİM MAKİNE LTD. ŞTİ.', 'ANKARA', 'info@erisimmak.com.tr', 'http://www.erisimmak.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (304, 'ERK BİLGİ TEKNOLOJİLERİ LTD. ŞTİ.', 'ANKARA', 'bilgi@erk.com.tr', 'www.erk.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (305, 'ERKENT SAĞLIK ÜRÜNLERİ PAZ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@erkentsaglik.com', 'www.erkentsaglik.com', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (306, 'ERLER MAK. VE GIDA SAN. LTD. ŞTİ.', 'ANKARA', 'info@aysegulerlercatering.com', 'http://www.aysegulerlercatering.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (307, 'ERMAKSAN MAKİNE DİŞLİ YEDEK PARÇA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'info@ermaksandisli.com.tr', 'www.ermaksandisli.com.tr', 'isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (308, 'EROK HİDROLİK PNÖMATİK LTD. ŞTİ.', 'İSTANBUL', 'info@erok.com.tr', 'www.erok.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (309, 'ERPİLİÇ ENTEGRE TAVUKÇULUK ÜRET. PAZ. VE TİC. LTD. ŞTİ.', 'BOLU', 'berkantugurlu@erpilic.com.tr', 'www.erpilic.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (310, 'ERSA OFİS MOBİLYALARI  SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'fusuncelebi@ersaofis.com', 'www.ersaofis.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (311, 'ERSİN DENİZCİLİK SAN.VE TİC.', 'İSTANBUL', 'hakan.ersin@ersinltd.com.tr', 'www.ersindenizcilik.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (312, 'ERTUNÇ ÖZCAN TIBBİ CİHAZ. ÜRETİM SAN. LTD. ŞTİ.', 'ANKARA', 'ertozcan@ttmail.com', '', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (313, 'ERYİĞİT TIBBİ CİHAZLAR A.Ş.', 'ANKARA', 'info@eryigit.com.tr', 'www.eryigit.com.tr', 'mak,bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (314, 'ERZURUM TİCARET VE SANAYİ ODASI', 'ERZURUM', 'kursat_k45@hotmail.com', 'www.erzurumtso.org.tr', 'ikt,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (315, 'ESÇELİK ISI CİHAZLARI LTD. ŞTİ.', 'ESKİŞEHİR', 'sales@escelikltd.com', 'www.escelikltd.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (316, 'ESER HOLDİNG TAAHÜT VE SANAYİ A.Ş.', 'ANKARA', 'bbaypinar@eser.com', 'http://www.eser.com', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (317, 'ESİN HUKUK BÜROSU', 'İSTANBUL', '', 'www.esin.av.tr/maintr.asp', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (318, 'ESKİŞEHİR BİLİŞİM İLETİŞİM A.Ş.', 'ESKİŞEHİR', 'ercan@eso-es.net', '', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (319, 'ESKİŞEHİR ENDÜSTRİYEL ENERJİ SAN. TİC. A.Ş.', 'ESKİŞEHİR', 'yilmazon@eee.com.tr', 'www.eee.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (320, 'ESKİŞEHİR SANAYİ ODASI', 'ESKİŞEHİR', 'eso@eso.org.tr', 'www.eso.org.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (321, 'ESKİŞEHİR TİCARET ODASI', 'ESKİŞEHİR', 'avarol@etonet.org.tr', 'www.etonet.org.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (322, 'ESPAŞ KOZMETİK ÜRÜN. PAZ. TİC. LTD. ŞTİ.', 'ANKARA', 'omerfdaglar@hotmail.com', 'www.ixora.com.tr', 'ulu,end,mat,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (323, 'ESTAŞ EKSANTRİK SAN. VE TİC. A.Ş.', 'SİVAS', 'estas@estas.com.tr', 'www.estas.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (324, 'ETAP İNŞAAT MÜH. LTD. ŞTİ.', 'ANKARA', '', '', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (325, 'ETİ GIDA SAN.VE TİC.A.Ş.', 'ESKİŞEHİR', 'zaytac@etigida.com.tr', 'www.etigida.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (326, 'EUROPOWER ENERJİ VE OTOMASYON TEKNOLOJİLERİ SAN. TİC. A.Ş.', 'ANKARA', 'europower@europowerenerji.com.tr', 'www.europowerenerji.com.tr', 'mak,ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (327, 'EVGER EV GEREÇLERİ SAN. VE TİC. A.Ş.', 'KAYSERİ', 'mehmet.durak@evger.com.tr', 'www.evger.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (328, 'EYÜP SABRİ TUNCER KOZMETİK SAN. A.Ş.', 'ANKARA', 'sonmez@eyupsabrituncer.com', 'www.eyupsabrituncer.com', 'end,sat,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (329, 'FAREL PLASTİK İMAL. SAN. A.Ş.', 'TEKİRDAĞ', 'hselvi@farel.com.tr', 'www.farel.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (330, 'FARSEL İNŞAAT TİC. A.Ş.', 'ANKARA', 'farsel@farsel.com.tr', 'http://www.farsel.com.tr/', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (331, 'FATMA ENGİN ORTAKLIĞI MALİ MÜŞAVİRLİK', 'BURSA', '', '', 'mat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (332, 'FEDERAL ELEKTRİK YATIRIM VE TİC. A.Ş.', 'SAKARYA', 'alkan.kaya@federal.com.tr', 'www.federal.com.tr', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (333, 'FENİŞ TEKNİK  ÜRÜNLER A.Ş.', 'KOCAELİ', 'fenisteknik@fenis.com.tr', 'www.fenisteknik.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (334, 'FER ISI TEKNOLOJİLERİ SAN.VE TİC.LTD.ŞTİ.', 'MANİSA', 'info@ferisi.com.tr', 'http://www.ferisi.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (335, 'FESTO SAN. VE TİC. A.Ş.', 'İSTANBUL', 'fikret_akyuz@festo.com', 'http://www.festo.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (336, 'FETAŞ YANGIN EKİPMANLARI MAKİNE METAL SAN. VE TİC. A.Ş.', 'ANKARA', 'serkan@fetas.com', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (337, 'FİREBAL BİLGİSAYAR HİZMETLERİ LTD. ŞTİ.', 'ANKARA', 'timucinedman@firebal.net', 'www.firebal.net', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (338, 'FNSS SAVUNMA SİSTEMLERİ A.Ş.', 'ANKARA', 'hudaver.degirmenci@fnss.com.tr', 'www.fnss.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (339, 'FORMMETAL MAK. SAN. LTD. ŞTİ.', 'ANKARA', 'info@formmetal.com.tr', 'www.formmetal.com.tr', 'ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (340, 'FORUM FUARCILIK VE GELİŞTİRME A.Ş.', 'ANKARA', 'basak@forumfuar.com', 'www.forumfuar.com', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (341, 'GAMA GÜÇ SİSTEMLERİ MÜH.VE TAAH. A.Ş.', 'ANKARA', 'aziz.coskun@gama.com.tr', 'www.gamapower.com.tr', 'ulu,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (342, 'GAMA HOLDİNG A.Ş.', 'ANKARA', 'perdemli@gama.com.tr', 'www.holding.gama.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (343, 'GAMZE SARAÇOĞLU FASHION DESİNG STUDIO', 'İSTANBUL', 'info@gamzesaracoglu.com', 'http://www.gamzesaracoglu.com/', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (344, 'GAP GÜNEYDOĞU TEKSTİL SAN. VE TİC. A.Ş.', 'İSTANBUL', '', 'www.calikdenim.com', 'ikt,bil,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (345, 'GAP MAĞAZACILIK A.Ş.', 'İSTANBUL', 'selenk@marka.com.tr', 'http://www.fibaholding.com.tr', 'tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (346, 'GATE ELEKTR. SAN. VE TİC. A.Ş.', 'ANKARA', 'cerens@gateelektronik.com.tr', 'www.gateelektronik.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (347, 'GAZİANTEP ABİGEM DANIŞMANLIK VE EĞİTİM A.Ş.', 'GAZİANTEP', 'fsuran@abigem.org', 'www.gaziantep.abigem.org', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (348, 'GAZİANTEP TİCARET ODASI', 'GAZİANTEP', 'serpilkinaci@gto.org.tr', 'http://www.gto.org.tr', 'ikt,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (349, 'GBS GENTAŞ BOLU LAMİNE LİF LEVHA ENTEGRE AĞAÇ SAN. VE TİC. A.Ş.', 'BOLU', 'fikretkansiz@gentas.com.tr', 'www.gentas.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (350, 'GEA KLİMA SAN. VE TİC. A.Ş.', 'KOCAELİ', 'gamze.yilmaz@geagroup.com', 'www.geagroup.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (351, 'GENÇ ATILIM DERSHANESİ', 'ANKARA', 'bilgi@gad.com.tr', '', 'mat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (352, 'GENÇ EĞİTİM VE YAYINCILIK A.Ş.', 'KONYA', 'fsen@gencegitim.com.tr', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (353, 'GENÇ KARINCA DERSHANESİ', 'ANKARA', 'info@gençkarincadershanesi.com.tr', 'http://www.genckarincadershanesi.com.tr', 'tde,mat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (354, 'GENEL MAKİNA TASARIM İMALAT PAZ. SAN. TİC. LTD. ŞTİ.(GMT)', 'ANKARA', 'sozel@gmtmakina.com.tr', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (355, 'GENEL METAL SAN. TİC. A.Ş. (GENTAŞ)', 'BOLU', 'msargin@gentas.com.tr', 'www.gentas.com.tr', 'ikt,ele,isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (356, 'GENPOWER JENARATÖR SAN. VE TİC. A.Ş.', 'ANKARA', 'a.colak@genpower.com.tr', 'www.genpower.com.tr', 'ele,end,isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (357, 'GEREME YAPI MALZ. TUR. VE YAT İŞLET. SAN. TİC. A.Ş.', 'İZMİR', 'infogereme@gereme.com', 'http://www.gereme.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (358, 'GES TEKNİK KLİMA KONTROL OTOMASYON SİST. SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'yesim.aktay@gesteknik.com', '', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (359, 'GIPTA OFİS KIRTASİYE VE PROMOSYON ÜRÜNLERİ İMALAT SAN. A.Ş.', 'ANKARA', 'yguler@gipta.com.tr', 'www.gipta.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (360, 'GİRESUN TİCARET VE SANAYİ ODASI', 'GİRESUN', 'giresuntso@tobb.org.tr', 'www.giresuntso.com', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (361, 'GLOBAL FORTE BİLİŞİM TEKNOLOJİLERİ VE DANIŞMANLIK LTD.ŞTİ.', 'İSTANBUL', 'sdonmez@globalforte.com', 'www.globalforte.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (362, 'GLOBAL TEKNİK ELEKTRONİK YAZILIM MÜH. HAVACILIK SAN. TİC. A.Ş.', 'ANKARA', 'melek.taskin@globalteknik.com.tr', 'www.globalteknik.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (363, 'GNF BİLİŞİM TEKNOLOJİ HİZM. SAN. TİC. LTD. ŞTİ.', 'ANKARA', '', '', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (364, 'GÖNKA KLİMA TESİSAT İNŞ. SAN. VE TİC. A.Ş.', 'ANKARA', 'diler@gonka.com.tr', 'www.gonka.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (365, 'GRANISER GRANIT SERAMIK SAN. VE TIC. A.Ş', 'YURTDIŞI', 'info@graniser.com.tr', 'http://www.graniser.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (366, 'GRAS SAVOYE SİGORTA VE REASÜRANS BROKERLİK A.Ş.', 'İSTANBUL', 'galip.gokakin@grassavoye.com.tr', 'www.grassavoye.com.tr', 'isl,ikt,mat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (367, 'GRUP OFİS MARKA VE PATENT AJANLIĞI MÜŞAVİRLİK VE TİC. LTD. ŞTİ.', 'ANKARA', 'belma@grupofis.com.tr', 'www.grupofis.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (368, 'GÜÇSAN MAKİNA DOĞALGAZ SAN. VE TİC. LTD. ŞTİ.', 'DENİZLİ', 'gucsanmakina@gucsanmakina.com.tr', 'www.gucsanmakina.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (369, 'GÜLEÇ GIDA İNŞ. NAKL. SAN. VE TİC. LTD.', 'ÇORUM', 'mugurgulec@mynet.com', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (370, 'GÜLERMAK AĞIR SAN. İNŞ. VE TAAH. A.Ş.', 'ANKARA', 'ounyazici@gulermak.com.tr', 'www.gulermak.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (371, 'GÜMRÜK VE TURİZM İŞLETMELERİ TİCARET A.Ş.', 'ANKARA', 'ssenkaya@gtias.com.tr', 'www.gtias.com.tr', 'isl,ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (372, 'GÜNCEL MEVZUAT İKTİSADİ İŞLETMESİ', 'ANKARA', 'merve.gulculer@mevzuat.com.tr', '', 'huk,end,tde,isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (373, 'GÜNCEL YEMİNLİ MALİ MÜŞ. LTD. ŞTİ.', 'ANKARA', 'guncel@guncelmusavirlik.com.tr', 'www.guncelmusavirlik.com.tr', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (374, 'GÜNEŞ GÜMRÜK MÜSTEŞARLIĞI LTD. ŞTİ.', 'ANKARA', 'gunayesref@gmail.com', 'www.gunesgumruk.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (375, 'GÜNGÖR MAKİNA SAN. VE TİC. LTD. ŞTİ.', 'İZMİR', 'info@gungormakina.com.tr', 'www.gungormakina.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (376, 'GÜNO PAZ.REK.TURİZM SAN.VE TİC.LTD.ŞTİ.', 'ANKARA', 'guno@guno.com.tr', 'www.guno.com.tr', 'ikt,mak,end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (377, 'GÜRAL PORSELEN TURİZM VE VİTRİFİYE SAN. A.Ş.', 'KÜTAHYA', 'darman@guralporselen.com.tr', 'www.guralporselen.com.tr', 'mak,end,ikt,isl,ulu,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (378, 'GÜRBAĞ İNŞAAT MÜHENDİSLİK MADENCİLİK SAN.TİC.A.Ş.', 'ANKARA', '', 'www.gurbag.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (379, 'GÜRGENLER A.Ş.', 'ANKARA', 'qualitycontrol@gurgenler.com.tr', 'www.gurgenler.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (380, 'GÜRİŞ HOLDİNG A.Ş.', 'ANKARA', 'munalan@guris.com.tr', 'www.gurisholding.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (381, 'GÜRMAK METAL  SAN. VE TİC. A.Ş.', 'ANKARA', 'gurmak@gurmakmetal.com.tr', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (382, 'GÜRMAS GÜREL MAK. SAN. A.Ş.', 'AFYON', 'cgurel@gurmas.com.tr', 'www.gurmas.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (383, 'GÜVEN MALİ MÜŞAVİRLİK A.Ş.', 'ANKARA', 'mky2050@gmail.com', '', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (384, 'HALKALI KAĞIT KARTON  SAN. VE TİC. A.Ş.', 'İSTANBUL', 'insankaynaklari@halkalikagit.com', 'www.halkalikagıt.com', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (385, 'HAS ÇELİK VE HALAT SAN.TİC.A.Ş.', 'KAYSERİ', 'Hascelik@hascelik.com.tr', 'www.hascelik.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (386, 'HATBORU ÇELİK BORU SAN. VE TİC. LTD. ŞTİ.', 'HATAY', 'hatboru@hatboru.com', 'http://www.hatboru.com', 'end,ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (387, 'HAVELSAN HAVA ELEKTRONİK SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'dileks@havelsan.com.tr', 'www.havelsan.com.tr', 'ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (388, 'HAVELSAN TEKNOLOJİ RADAR SAN. VE TİC. A.Ş.', 'ANKARA', 'sahin.yagmuroglu@htr.com.tr', 'www.htr.com.tr', 'bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (389, 'HEMAKS HALI VE TEKSTİL MAK. SAN. VE TİC. A.Ş.', 'GAZİANTEP', 'hemaks@hemaks.com', 'www.hemaks.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (390, 'HERAEUS ELECTRO-NİTE A.Ş.', 'ANKARA', 'zeynep.guldur@heraeus.com', 'www.electro-nite.com', 'end,isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (391, 'HES HACILAR ELEKTRİK SANAYİ VE TİC. A.Ş.', 'ANKARA', 'myerer@hes.com.tr', 'www.hes.com.tr', 'mak,bil,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (392, 'HIDIR KÖSE SERBEST MUHASEBECİ MALİ MÜŞAVİR', 'ANKARA', '', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (393, 'HİDROMEK-HİDROLİK VE MEKANİK MAKİNA İMALAT SAN. VE TİC. A.Ş.', 'ANKARA', 'eliz.sahillioglu@hidromek.com.tr', 'www.hidromek.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (394, 'HİDROPOL MÜHENDİSLİK MAK. ELEKTRİK ELEKTRONİK SAN. VE TİC. LTD.ŞTİ.', 'ANKARA', 'info@hidropol.com', 'http://www.hidropol.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (395, 'HİDRO-SAN DAMPER VE HİDROLİK MAKİNA  SAN. TİC. A.Ş.', 'ANKARA', 'hidrosan01@hotmail.com', 'www.hidrosandamper.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (396, 'HİLAL BÜRO MOB. SAN. VE TİC. LTD. ŞTİ.', 'İSTANBUL', 'info@hilalburo.com', '', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (397, 'HİSARLAR MAK. SAN. TİC. A.Ş.', 'ESKİŞEHİR', 'ik@hisarlar.com.tr', 'www.hisarlar.com.tr', 'mak,end,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (398, 'HİSBİM BİLGİ VE İLETİŞİM TEKNOLOJİLERİ SAN. VE TİC. A.Ş.', 'ESKİŞEHİR', 'taskin@hisbim.com', 'http://www.hisbim.com', 'bil,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (399, 'HİZMETGAZ TİC. SAN. A.Ş.', 'ÇORUM', 'yasmin.196@hotmail.com', '', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (400, 'HN SİSTEM DANIŞMANLIK DENETİM VE YEMİNLİ MALİ MÜŞAVİRLİK LTD. ŞTİ.', 'ANKARA', 'demet.allar@sistem-ymm.com', 'http://www.sistem-ymm.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (401, 'HOLIDAY PLAN TUR. İŞL. VE TİC. A.Ş. (MAJESTY CLUB TUANA)', 'MUĞLA', 'info@majesty.com.tr', 'www.majesty.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (402, 'HOLLANDA YÜKSEK ÖĞRETİM ENSTİTÜSÜ', 'ANKARA', 'melekyucel@nihankara.org', 'www.nihankara.org', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (403, 'HUKUK VE ARAŞTIRMA BÜROSU', 'ANKARA', 'iletisim@hukukarastirma.com.tr', 'http://www.hukukarastirma.com.tr', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (404, 'HUNT HAVACILIK UZAY NANO TEKNOLOJİLER İMALAT SANAYİ VE TİCARET ANONİM ŞİRKETİ', 'ANKARA', 'dilek@hunt.com.tr', 'www.hunt.com.tr', 'bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (405, 'HUSAN &HUĞLU AV MALZ. SAN. TİC. LTD. ŞTİ.', 'KONYA', 'info@husanmetal.com', '-', 'ulu,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (406, 'HÜRRİYET GAZETECİLİK VE MATBAACILIK A.Ş.', 'ANKARA', 'bmuratoglu@hurriyet.com.tr', 'www.hurriyet.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (407, 'ICC-TÜRKİYE MİLLETLERARASI TİCARET ODASI', 'ANKARA', 'yeliz.geris@tobb.org.tr', 'http://icc.tobb.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (408, 'IFM', 'YURTDIŞI', 'info@zirveenergie.com.tr', 'www.zirvenergie.com.tr', 'ele,isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (409, 'I-KON BİLGİSAYAR TEKN. SAN. VE TİC. LTD. ŞTİ.', 'KOCAELİ', 'ozlem@i-con.com.tr', 'www.i-con.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (410, 'INFOTRON ELEKTRİK VE BİLGİSAYAR SİSTEMLERİ ÜRETİM VE TİC. A.Ş.', 'İSTANBUL', 'oguz.altay@infotron.com.tr', 'www.infotron.com.tr', 'mak,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (411, 'ISISAN ISI SAN. VE TİC. A.Ş.', 'KAYSERİ', 'info@isisan.com.tr', 'www.isisan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (412, 'ISSD BİLİŞİM ELEKTRONİK EĞİTİM SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'cagri.yuzbasioglu@issd.com.tr', 'www.issd.com.tr', 'ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (413, 'İBA KİMYA SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'serhat.karabulut@iba.com.tr', 'www.iba.com.tr', 'end,isl,ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (414, 'İCK YAPI TEKS. TUR. GIDA BİL. TİC. LTD. ŞTİ.', 'ANKARA', 'info@ickyapi.com.tr', 'www.ickyapi.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (415, 'İÇDAŞ ÇELİK ENERJİ TERSANE VE ULAŞIM SAN. A.Ş.', 'ÇANAKKALE', 'dkenet@icdas.com.tr', 'www.icdas.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (416, 'İKİSOFT YAZILIM LTD. ŞTİ.', 'ANKARA', 'armagan@taleworlds.com', 'www.taleworlds.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (417, 'İKRE DIŞ TİC. LTD. ŞTİ.', 'İSTANBUL', '', '', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (418, 'İKTİSADİ KALKINMA VAKFI', 'YURTDIŞI', '', '', 'ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (419, 'İKTİSADİ KALKINMA VAKFI (İKV)', 'İSTANBUL', 'dcihangir@ikv.org.tr', 'www.ikv.org.tr', 'isl,ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (420, 'İLCİ GRUP', 'ANKARA', 'serdar@ilci.com.tr', 'http://ilci.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (421, 'İLG BİLİŞİM TEKNOLOJİLERİ LTD. ŞTİ', 'ANKARA', 'baris.misman@ilgstudios.com', 'www.ilgstudios.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (422, 'İLK ELEKTRİK ENERJİ ÜRETİMİ SAN. VE TİC. A.Ş.', 'ANKARA', 'ozcan@ilkenerji.com.tr', 'http://www.ilkenerji.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (423, 'İLK REKLAM BİLİŞİM', 'ANKARA', 'bilgi@renklisayfa.com', 'www.renklisayfa.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (424, 'İLKA PLASTİK SAN. VE TİC. LTD. ŞTİ.', 'KOCAELİ', 'ilka@il-ka.com.tr', 'www.il-ka.com.tr', 'isl,ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (425, 'İMEKS MAKİNA SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'imeks@imeks.com.tr', 'www.imeks.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (426, 'İMMAK MAKİNE PLS. DAY. TÜK. MAL. MÜH. HİZ. LTD. ŞTİ.', 'DENİZLİ', 'immak@immakmakina.com.tr', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (427, 'İMPARATOR METAL VE GIDA SAN. TİC. LTD. ŞTİ.', 'KONYA', 'info@imparatormetal.com.tr', 'http://www.imparatormetal.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (428, 'İMR ELEKTRİK MÜHENDİSLİK LTD. ŞTİ.', 'ANKARA', 'nbilecen@imr.com.tr-mozkan@imr.com.tr', 'www.imr.com.tr', 'ele,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (429, 'İNCEKARA HOLDİNG A.Ş.', 'ANKARA', 'filiz.atici@incekara.com.tr', 'www.incekara.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (430, 'İNFİNA YAZILIM A.Ş.', 'İSTANBUL', 'marabacioglu@infina.com.tr', 'www.infina.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (431, 'İNFODİF YAZILIM VE BİLİŞİM TEKNOLOJİLERİ SAN.VE TİC. LTD.ŞTİ.', 'ANKARA', 'syilmaz@infodif.com', 'www.infodif.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (432, 'İNNOVA BİLİŞİM ÇÖZÜMLERİ A.Ş.', 'ANKARA', 'ckalkan@innova.com.tr', 'www.innova.com.tr', 'bil,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (433, 'İNOKSAN MUTFAK SAN. VE TİC. A.Ş.', 'BURSA', 'mkaymak@inoksan.com.tr', 'www.inoksan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (434, 'İNSUTAŞ YAPI SAN. TUR. VE TİC. LTD. ŞTİ.', 'ANKARA', 'insutas@insutas.com', 'www.insutas.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (435, 'İNTA MÜH.İNŞAAT MİM.MÜŞ.TEKS.SAN.TİC.A.Ş.', 'ANKARA', 'umit.oktamis@inta.com.tr', 'www.inta.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (436, 'İNTEMA İNŞ. VE TESİSAT MALZ. YAT. VE PAZ. A.Ş. (ECZACIBAŞI HOLDİNG)', 'İSTANBUL', 'selin.derya@eczacibasi.com.tr', 'www.eczacibasi.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (437, 'İNTERMAK MAKİNA İMALAT İTHALAT SAN. VE TİC. AŞ.', 'KONYA', 'intermak@intermak.com.tr', 'intermak.com.tr', 'isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (438, 'İPEK KAĞIT SAN. VE TİC. A.Ş. (ECZACIBAŞI HOLDİNG)', 'İSTANBUL', 'goksu.korkmaz@ipekkagit.com.tr', 'www.ipekkagit.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (439, 'İPEK MATBAACILIK SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'onens@koza.com.tr', 'www.koza.com.tr', 'ikt,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (440, 'İPEKYOLU TEKSTİL SAN. VE TİC.  A.Ş.', 'DENİZLİ', 'skatranci@ipekyolutex.com.tr', 'www.ipekyolutex.com.tr', 'isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (441, 'İRONFT OTOMASYON SANAYİ VE TİCARET A.Ş.', 'İSTANBUL', 'ibrahimk@ironft.com', 'www.ironft.com', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (442, 'İSERER EĞİTİM BİLİŞİM REKLAM VE DANIŞMANLIK SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'zaferizgi06@hotmail.com', 'www.iserer.com.tr', 'bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (443, 'İSKENDERUN TİCARET VE SANAYİ ODASI', 'HATAY', '"kocadolu@hotmail.com	"', 'http://www.iskenderuntso.org.tr', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (444, 'İSMAİL TUNCA S.M. MALİ MÜŞAVİR', 'ANKARA', 'ismail@ismailtunca.com', 'http://ismailtunca.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (445, 'İSOMER BİLİŞİM HİZMETLERİ SAN.TİC.LTD.ŞTİ.', 'ANKARA', 'ik@isomer.com.tr', 'www.isomer.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (446, 'İSTANBUL ALTIN RAFİNERİSİ A.Ş.', 'İSTANBUL', 'sevim@iar.com.tr', 'www.iar.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (447, 'İSTANBUL MARMARA EGE ADZ. KDZ. BÖL. DENİZ TİC. ODASI', 'İSTANBUL', 'ozden.karakas@denizticaretodasi.org', 'www.denizticaretodasi.org', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (448, 'İSTANBUL SANAYİ ODASI-İSO', 'İSTANBUL', 'betan@iso.org.tr', 'www.iso.org.tr', 'bil,ikt,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (449, 'İSTİKBAL MOBİLYA SANAYİ VE TİC. A.Ş.', 'KAYSERİ', 'istikbal@istikbal.com.tr', 'www.istikbal.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (450, 'İZELTAŞ İZMİR EL ALETLERİ SAN. VE TİC. A.Ş.', 'İZMİR', 'lami.kaska@izeltas.com.tr', 'www.izeltas.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (451, 'İZMİR ABİGEM DANIŞMANLIK VE ÖZEL EĞİTİM A.Ş.', 'İZMİR', 'ayeniocak@abigem.org', 'http://www.izmir.abigem.org', 'ulu,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (452, 'İZMİR DEMİR ÇELİK SAN. A.Ş.', 'İZMİR', 'a.celik@izdemir.com.tr', 'www.izdemir.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (453, 'İZMİR TİCARET BORSASI', 'İZMİR', 'sinemcelikten@itb.org.tr', 'www.itb.org.tr', 'ikt,ulu,isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (454, 'JAKARSAN MAKİNE LTD. ŞTİ.', 'GAZİANTEP', 'macine@hemaks.com.tr', 'www.hemaks.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (455, 'JOHNSON CONTROLS KLİMA VE SOĞUTMA', 'ANKARA', 'murat.ozcelik@jci.com', 'www.johnsoncontrols.com.tr', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (456, 'JOURNEY-YOL TEKSTİL SAN.İÇ VE DIŞ TİC.LTD.ŞTİ.', 'ANKARA', 'ozgeg@journey.com.tr', 'www.journey.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (457, 'KABEL KABLO ELEMANLARI SAN. VE TİC. AŞ.', 'KOCAELİ', 'inka@kabel.com', 'www.kabel.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (458, 'KADIN HAREKETİ DERNEĞİ', 'ANKARA', '', 'www.kadinhareketidernegi.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (459, 'KAHRAMANMARAŞ TİCARET VE SANAYİ ODASI', 'K.MARAŞ', 'a.ozturk@kmtso.org.tr', 'www.kmtso.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (460, 'KALE ALTINAY ROBOTİK VE OTOMASYON SAN. VE TİC. A.Ş.', 'İSTANBUL', 'pelin.korfez@kalealtinay.com.tr', 'www.kalealtinay.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (461, 'KALEKALIP MAKİNA VE KALIP SAN. A.Ş.', 'İSTANBUL', 'hr@kalekalip.com.tr', 'www.kalekalip.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (462, 'KALEKİM KİMYEVİ MAD. SAN. VE TİC. A.Ş.', 'İSTANBUL', 'gamzedeniz@kalekim.com.tr', 'www.kalekim.com.tr', 'ulu,end,bil,ikt,mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (463, 'KALEMADEN ENDÜSTRİYEL HAMMADDELER SAN. VE TİC.A.Ş.', 'İSTANBUL', 'gokhanguner@kalemaden.com.tr', 'www.kalemaden.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (464, 'KALESERAMİK ÇANAKKALE KAL. SER. SAN. A.Ş.', 'ÇANAKKALE', 'dilaraseren@kale.com.tr', 'www.kale.com.tr', 'ele,mak,isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (465, 'KAM ANKARA BETON SAN. A.Ş.', 'ANKARA', 'neslihanguzel@kam.com.tr', 'www.kambeton.com.tr', 'mak,bil,end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (466, 'KAM BETON LTD.ŞTİ', 'ADANA', 'kambeton@kambeton.com.tr', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (467, 'KARADENİZ EREĞLİ TİCARET VE SANAYİ ODASI', 'ZONGULDAK', 'bilgi@ereglitso.org.tr', 'www.ereglitso.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (468, 'KARAMANCI TURISTIK TESISLERI A.Ş. (MELAS RESORT HOTEL)', 'ANTALYA', 'info@melashotels.com', 'http://www.melashotels.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (469, 'KARATAŞ CAM TİC.', 'ANKARA', 'karatas@karatascam.com.tr', 'www.karatascam.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (470, 'KARDELEN BOYA VE KİMYA SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'selim@kardelenboya.com.tr', 'www.kardelenboya.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (471, 'KAREL ELEKTRONİK SANAYİ VE TİCARET A.Ş. ANKARA ŞB.', 'ANKARA', 'ikm@karel.com.tr-gozde.isaoglu@karel.com.tr', 'www.karel.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (472, 'KARLAR BASIM YAYIN DAĞITIM BİLG. ÜRÜNLERİ İNŞ.TURİZM PAZ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@karlarltd.com', 'www.karlarltd.com', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (473, 'KARSAN OTOMOTİV SAN. TİC. A.Ş.', 'BURSA', 'yonem.oktay@karsan.com.tr', 'www.karsan.com.tr', 'end,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (474, 'KASIRGA BİLİŞİM ELEKTRONİK LTD. ŞTİ.', 'ANKARA', 'oguz.ergin@kasirgabilisim.com.tr', 'www.kasirga.com.tr', 'bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (475, 'KASTAMONU TICARET VE SANAYI ODASI', 'KASTAMONU', 'info@kastamonutso.org.tr', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (476, 'KAYAHAN MAK. END. TİC. A.Ş.', 'KONYA', 'kbabacan@kayahan.com', 'www.kayahan.com.tr', 'mak,end,sat,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (477, 'KAYA-PEN PLASTİK SAN. VE TİC. LTD. ŞTİ.', 'SİNOP', 'kayapen@dsl.ttnet.net.tr', 'www.kayapen.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (478, 'KAYHAN MÜHENDİSLİK MİMARLIK LTD.ŞTİ.', 'ANKARA', 'info@kayhanmuhendislik.com', 'http://www.kayhanmuhendislik.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (479, 'KAYNAK TEKNİĞİ SAN. VE TİC. A.Ş. (ECZACIBAŞI-LINCOLN ELEKTRİK-ASKAYNAK)', 'KOCAELİ', 'alper.erden@askaynak.com.tr', 'www.askaynak.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (480, 'KAYSERİ SANAYİ ODASI', 'KAYSERİ', 'info@kayso.org.tr', 'www.kayso.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (481, 'KAYSERİ TİCARET ODASI', 'KAYSERİ', 'kaytic@kayserito.org.tr', 'www.kayserito.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (482, 'KDS TEKSTİL SANAYİ VE TİCARET LTD.ŞTİ.', 'BURSA', 'kds@texstile.com', 'www.kdstexstile.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (483, 'KEM KİMYA ENDÜSTRİ MERKEZİ LTD. ŞTİ.', 'İÇEL', 'bilgi@kem.com.tr', 'www.kem.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (484, 'KES KLİMA SANAYİİ VE TİCARET LTD. ŞTİ.', 'ANKARA', 'hkes@kesklima.com', 'http://www.kesklima.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (485, 'KEYS YAZILIM DANIŞMANLIK LTD. ŞTİ.', 'ANKARA', 'ekaramese@hotmail.com', 'www.keysyazilim.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (486, 'KG HAKLA İLİŞKİLER EĞİT. ORG. REK. BİLG. DIŞ TİC. ENERJİ DANIŞMANLIK HİZM LTD.ŞTİ.', 'ANKARA', 'kg@kg.biz.tr', 'www.kg.biz.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (487, 'KIRIKKALE TİCARET BORSASI', 'KIRIKKALE', 'kirikkaletb@tobb.org.tr', 'http://www.kirikkaletb.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (488, 'KIRIKKALE TİCARET VE SANAYİ ODASI', 'KIRIKKALE', 'info@kirikkaletso.org.tr', '', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (489, 'KİBAR SİGORTA ARACILIK HİZM. A.Ş.', 'İSTANBUL', 'derya.gonullu@kibarholding.com', '', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (490, 'KİMETSAN İÇ VE DIŞ TİC. MÜH. MÜŞ. LTD. ŞTİ.', 'ANKARA', 'pazarlama@kimetsan.com', 'www.kimetsan.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (491, 'KMS ENDÜSTRİ MAKİNE METAL TEKSTİL GIDA TURİZM TAŞ. SAN. TİC. LTD. ŞTİ.', 'ZONGULDAK', 'kardeslerltd@mynet.com', 'www.kmsmetal.net', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (492, 'KOBİ GİRİŞİM SERMAYESİ YATIRIM ORTAKLIĞI A.Ş.', 'ANKARA', 'syilmaz@kobias.com.tr', 'www.kobias.com.tr', 'isl,ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (493, 'KOCAELİ ABİGEM A.Ş.', 'KOCAELİ', 'mturabi@abigem.org', 'http://www.kocaeli.abigem.org', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (494, 'KOCAELİ SANAYİ ODASI', 'KOCAELİ', 'eyilmaz@kosano.org.tr', 'www.kosano.org.tr', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (495, 'KOÇALİ HUKUK BÜROSU', 'ANKARA', 'mkkocali@kocalihukuk.com', 'www.kocalihukuk.com', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (496, 'KOÇOĞLU INSAAT SANAYI VE TICARET A.Ş.(KARINNA HOTEL)', 'ANKARA', 'zgokcakan@kocoglu.com.tr', 'www.kocoglu.com.tr,www.karinnahotel.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (497, 'KODSAN KAZAN İNŞ. SAN. VE TİC. A.Ş.', 'ANKARA', 'teknik@kodsan.com.tr', 'www.kodsan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (498, 'KOLEKSİYON MOBİLYA SAN. A.Ş.', 'ANKARA', 'nese.kara@koleksiyon.com.tr', 'http://www.koleksiyon.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (499, 'KOLİN İNŞAAT A.Ş.', 'ANKARA', 'nkocaoglu@kolin.com.tr', 'www.kolin.com.tr', 'mak,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (500, 'KONAK TIP ÇEVRE VE MADENCİLİK LTD. ŞTİ.', 'ANKARA', '', 'http://konaktip.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (501, 'KONTUR-SEL ALÜMİNYUM MAMÜLLERİ SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'kontursel@kontursel.com', 'www.kontursel.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (502, 'KONYA SANAYİ ODASI', 'KONYA', 'kso@kso.org.tr', 'www.kso.org.tr', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (503, 'KONYA TİCARET BORSASI', 'KONYA', 'bilgi@ktb.org.tr', 'www.ktb.org.tr', 'ikt,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (504, 'KORTEKS MENSUCAT SANAYİ VE TİCARET A.Ş.', 'BURSA', 'aliihsan.erdogan@zorlu.com', 'www.korteks.com.tr', 'isl,ikt,end,ele,bil,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (505, 'KOZA ALTIN ŞİRKETİ', 'İZMİR', 'ozlem.cansoy@kozagold.com', 'www.kozagold.com', 'ele,ikt,isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (506, 'KOZANOĞLU KOZMAKSAN İMAL. SAN. LTD. ŞTİ', 'ANKARA', 'ertug@kozmaksan.com.tr', 'www.kozmaksan.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (507, 'KOZLAR İNŞAAT LTD. ŞTİ.', 'ANKARA', '', 'http://www.kozlarinsaat.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (508, 'KREDİ GARANTİ FONU A.Ş.', 'ANKARA', 'hikmetkurnaz@kgf.com.tr', 'www.kgf.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (509, 'KRİTİKAL FAKTÖR BİL. ENERJİ TUR. İNŞ. EMLAK GIDA SAN. TİC. İTH. İHR. LTD. ŞTİ.', 'ANTALYA', 'akarasulu@nextury.com', '', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (510, 'KSG MAKİNA İMALAT SAN. VE TİC. A.Ş.', 'ADANA', 's.sezgin@ksg.com.tr', 'www.ksg.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (511, 'KUHNE+NAGEL NAKLİYAT LTD. ŞTİ.', 'İSTANBUL', 'sinan.mutlu@kuehne-nagel.com', 'www.kuehnenagel.com', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (512, 'KURGU ENDÜSTRİYEL ÜRÜNLER VE MOBİLYA PAZARLAMA TİC VE LTD. ŞTİ.', 'ANKARA', 'kurgu@kurgu.com.tr', 'http://www.kurgu.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (513, 'KÜÇÜKPAZARLI KARDEŞLER KALIP VE MAK. SAN. LTD. ŞTİ.', 'ANKARA', 'murat.yildiz@kucukpazarli.com.tr', 'www.kucukpazarli.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (514, 'LAL GAYRIMENKUL DEĞERLEME VE MÜŞAVIRLIK A.Ş.', 'ANKARA', 'info@laldegerleme.com.tr', 'www.laldegerleme.com.tr', 'bil,end,ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (515, 'LAMPART MODERN AYDINLATMA SIVAMA SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'lampartaydinlatma@gmail.com', 'www.modernaydinlatma.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (516, 'LAYNE BOWLER POMPA SAN. A.Ş.', 'ANKARA', 'mujgan@laynebowler.com.tr', 'laynebowler.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (517, 'LAZZONİ MOBİLYA İNŞ. TUR.  SAN. LTD. ŞTİ.', 'ANKARA', 'seyda@lazzoni.com.tr', 'www.lazzoni.com.tr', 'end,bil,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (518, 'LGE GIDA TURİZM TEKS. DAN. ORG. EĞT. İHR. VE TİC. LTD. ŞTİ. (BİG CHEFS)', 'ANKARA', 'gokhan@bigchefs.com', '', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (519, 'LONDRA TURİZM MÜŞAVİRLİĞİ', 'YURTDIŞI', '', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (520, 'MADENCİ GEMİ SAN. LTD. ŞTİ.', 'ZONGULDAK', 'info@madenciyard.com.', 'www.madenciyard.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (521, 'MAKİM MAKİNA TEKNOLOJİLERİ SAN. VE TİC. A.Ş.', 'ANKARA', 'info@makim.com.tr', 'http://www.makim.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (522, 'MALATYA TİCARET VE SANAYİ ODASI', 'MALATYA', 'tso@malatyatso.org.tr', 'www.malatyatso.org.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (523, 'MAN TÜRKİYE A.Ş.', 'ANKARA', 'Isin.Sekercioglu@man.eu', 'http://www.man.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (524, 'MANİSA TİCARET VE SANAYİ ODASI', 'MANİSA', 'ozguryilmaz@mtso.org', 'www.mtso.org', 'ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (525, 'MARMARA PAMUKLU MENSUCAD SAN. VE TİC. A.Ş.', 'TEKİRDAĞ', 'banu.kilic@lilakagit.com', '', 'end,isl,ikt,ele,mak,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (526, 'MARSH SİGORTA VE REASÜRANS BROKERLIĞI A.Ş.', 'ANKARA', 'derya.tasan@marsh.com', 'www.marsh.com.tr', 'ulu,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (527, 'MARTI DENİZ İŞLETMECİLİĞİ A.Ş.', 'İSTANBUL', 'marti@superonline.com', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (528, 'MASS MAKİNE SAN. İNŞ. TİC. LTD. ŞTİ.', 'ANKARA', 'mustafaakkiz@massmak.com.tr', 'http://www.massmak.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (529, 'MASTAR METALURJİ SAN.VE TİC A.Ş.', 'İZMİR', 'opaksoy@aysananadolu.yay.com.tr', 'http://mastarmetalurji.com.tr/', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (530, 'MAVZER PAZARLAMA MATB.REKLAM AMB. GIDA KİMYA SAN.VE TİC. ŞTİ.', 'ANKARA', '', 'www.mavzerambalaj.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (531, 'MED-MAR TUZ. SAN.TİC. A.Ş.', 'ÇANKIRI', 'akguc@salti.com.tr', 'www.salti.com.tr', 'ele,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (532, 'MEHMET TAYFUR SERBEST MUHASEBECİ MALİ MÜŞAVİR', 'ANKARA', 'smmmtayfur@hotmail.com', '', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (533, 'MEKA MÜH. LTD. ŞTİ.', 'ANKARA', 'eakcan@meka.com.tr', 'www.meka.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (534, 'MEKLAS OTOMOTIV ITHALAT-IHRACAT SAN.VE TIC.LTD.STI', 'BURSA', 'info@meklas.com', 'http://www.meklas.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (535, 'MEMİŞOĞLU  TARIM ÜRÜN.TİC.LTD.ŞTİ.', 'İÇEL', 'insankaynaklari@tatbakliyat.com.', 'www.tatbakliyat.com.tr', 'ele,mak,isl,ulu,bil,end,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (536, 'MERİH ASANSÖR SAN. TİC. A.Ş.', 'ANKARA', 'aysedemir@merihasansor.com', 'www.merihasansor.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (537, 'MERİNOS HALI SANAYİ VE TİC. A.Ş.', 'GAZİANTEP', 'calkal@merinos.com.tr', 'www.merinos.com.tr', 'ele,bil,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (538, 'MERİT CRYSTAL COVE HOTEL&CASINO', 'YURTDIŞI', 'info@merithotels.com', 'www.merithotels.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (539, 'MERKEZ ÇELİK SAN. VE TİCARET A.Ş.', 'KAYSERİ', 'tuba.balcioglu@istikbal.com.tr', 'www.merkezcelik.com.tr', 'bil,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (540, 'MERLİN BİLGİSAYAR HİZM. SAN. VE TİC. A.Ş.', 'İSTANBUL', 'phbyonetim@merlin.com.tr', 'www.merlin.com.tr', 'end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (541, 'MERSİN TİCARET VE SANAYİ ODASI', 'İÇEL', 'info@mtso.org.tr', 'www.mtso.org.tr', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (542, 'MERTY ENERJİ PETROL ARAMA EĞİTİM VE SERVİS HİZM. A.Ş.', 'ANKARA', 'berriny@mertyenergy.com', 'www.mertyenergy.com', 'ikt,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (543, 'MESA İMALAT SANAYİ VE TİC. A.Ş.', 'ANKARA', 'info@mesaimalat.com.tr', 'www.mesaimalat.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (544, 'MESA MESKEN SANAYİ A.Ş.', 'ANKARA', 'ukaradeniz@mesa.com.tr', 'www.mesa.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (545, 'MGS MERKEZ GALVANİZ SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'finans@galvanerji.com', 'www.merkezgalvenelji.com', 'ulu,mak,isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (546, 'MİKRON MAKİNA SAN. VE TİC. LTD.ŞTİ.', 'ANKARA', 'mikronmakina@tr.net', 'http://mikronmakina.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (547, 'MİKROPOR MAKİNA SAN. VE TİC. A.Ş.', 'ANKARA', 'volkan@mikropor.com.tr', 'www.mikropor.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (548, 'MİM MÜHENDİSLİK İNŞ. ÇELİK END. SAN. TİC.A.Ş.', 'ANKARA', 'ahmet@mimmuh.com.tr', 'www.mimmuh.com.tr', 'mak,ikt,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (549, 'MİMAR BİLGİ İLETİŞİM  SAVUNMA TEKNOLOJİLERİ LTD. ŞTİ.', 'ANKARA', 'asoran@mimarbilisim.com', 'www.mimarbilisim.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (550, 'MİNA MATBAACILIK İLETİŞİM NEŞRİYAT AJANSI LTD. ŞTİ.', 'ANKARA', 'bilgi@minaajans.com.tr', 'www.minaajans.com.tr/', 'bil,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (551, 'MİNDER BİLGİSAYAR EĞİT. DAN. HİZM. SAN. LTD. ŞTİ.', 'ANKARA', 'info@minder.com.tr', 'www.minder.com.tr', 'bil,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (552, 'MİTAŞ ENERJİ VE MADENİ İNŞAAT İŞLERİ TÜRK A.Ş', 'ANKARA', '..', 'www.mitas.com.tr-www.mitastower.com', 'ele,end,bil,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (553, 'MODAİLGİ KONF. İMAL. SAN. VE TİC.  LTD. ŞTİ.', 'ANKARA', 'modailgi@modailgi.com.tr', 'www.modailgi.com.tr', 'ikt,isl,ulu,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (554, 'MOTALİ TEKNOLOJİK SİST. A.Ş.-SERAY MOBİLYA', 'ANKARA', 'aliye@seray.com', 'www.motali.com', 'end,sat,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (555, 'MUMCU TENEKE SAN. VE TİC. LTD. ŞTİ.', 'BALIKESİR', 'mumcultd@superonline.com', 'www.mumcuteneke.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (556, 'MURAT UN SANAYİİ A.Ş.', 'ANKARA', 'muratun@muratun.com.tr', 'www.muratun.com.tr', 'mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (557, 'MÜSAN MAKİNE ÜRET. SAN. VE TİC. A.Ş.', 'ANKARA', 'caydin@musan.com.tr', 'www.musan.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (558, 'MYER FİLTRE VE OTO YEDEKLERİ SAN. VE TİC. A.Ş.', 'ANKARA', 'utkuercan@myer.com.tr', 'http://www.myer.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (559, 'MYTECHNIC AIRCRAFT MRO SERVICES', 'İSTANBUL', 'pinar.altay@mytechnic.aero', 'www.mytechnic.aero', 'end,mak,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (560, 'NABAY TEKSTİL SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'seref.ozcan@baydemirler.com.tr', 'www.baydemirler.com.tr', 'mak,bil,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (561, 'NACE MAKİNA SAN. A.Ş.', 'ANKARA', 'nace@nace.com.tr', 'www.nace.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (562, 'NAME ENDÜSTRİ A.Ş.', 'ANKARA', 'na-me@na-me.com.tr', 'www.na-me.com.tr', 'mak,sat,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (563, 'NANOBIZ (NANO-BIYO TEKNOLOJIK SIST. EĞITIM BILIŞIM DAN.  AR-GE SAN.TIC.LTD.ŞTI.)', 'ANKARA', 'zeynep.nanobiz@gmail.com', 'www.nanobiz.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (564, 'NEMA ALÜMINYUM SAN. TIC. LTD. ŞTI.', 'ANKARA', 'muhasebe@metalmarket.com.tr', '', 'mak,end,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (565, 'NOBEL YAZILIM', 'ANKARA', 'bilgi@nobelyazilim.com', 'www.nobelyazilim.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (566, 'NOKSEL ÇELİK BORU SANAYİ A.Ş.', 'SAKARYA', 'noksel@noksel.com.tr', 'www.noksel.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (567, 'NOKTACOM MEDYA İNTERNET HIZMETLERI SAN. VE TIC. A.Ş.', 'ANKARA', '', 'http://www.nokta.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (568, 'NORDKAPP KİMYA SAN. VE TİC. LTD. ŞTİ.', 'İSTANBUL', 'burakk@nordkapp.com.tr', 'www.nordkapp.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (569, 'NORMA YAZILIM DANIŞMANLIK LTD. ŞTİ.', 'ANKARA', 'dincera@normayazilim.com.tr', 'www.normayazilim.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (570, 'NORTEL NETWORKS NETAŞ TELEKOMÜNİKASYON A.Ş.', 'İSTANBUL', 'aorel@netas.com.tr', 'www.netas.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (571, 'N-T GRUP TRANSMİKSER MAK. İML. SAN. İNŞAAT VE DIŞ LTD. ŞTİ.', 'ANKARA', '', '', 'end,mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (572, 'NUH ÇİMENTO SANAYİ A.Ş.', 'KOCAELİ', 'muharrem.gokgoz@nuhcimento.com.tr', 'www.nuhcimento.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (573, 'NUHUN ANKARA MAKARNASI SAN. VE TİC.  A.Ş.', 'ANKARA', 'tamerkirici@gmail.com', 'www.nuh.com.tr', 'ele,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (574, 'NUMAŞ-NURETTİN USTA MOBİLYA İMAL. SANAYİ A.Ş.', 'ANKARA', 'insankaynaklari@nurus.com.tr', 'www.nurus.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (575, 'NURDİL TEKNİK SOĞUTMA SAN. VE TİC. A.Ş.', 'ANKARA', 'rizadilber@nurdil.com.tr', 'http://www.nurdil.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (576, 'NURİŞ ELEKTRİK VE KAYNAK MAKİNALARI SAN. VE TİC. A.Ş.', 'ANKARA', 'nuris@nuris.com.tr', 'www.nuris.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (577, 'NURİŞ PREFABRİK YAPI İNŞ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'alituran@nurisprefabrik.com', 'http://nurisprefabrik.com/', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (578, 'NUROL MAKİNA VE SANAYİ A.Ş.', 'ANKARA', 'melihs@nurolmakina.com.tr', 'www.nurolmakina.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (579, 'NUROL TEKNOLOJİ A.Ş.', 'ANKARA', 'semra.tas@nurol.com.tr', 'www.nurolteknoloji.com', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (580, 'NURUS A.Ş.', 'İSTANBUL', 'hr@nurus.com.tr', 'www.nurus.com.tr', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (581, 'NÜVE SAN. MALZ. İMALAT VE TİC. A.Ş.', 'ANKARA', 'nuvepubl@nuve.com.tr', 'www.nuve.com.tr', 'ikt,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (582, 'OĞUZ HUKUK BÜROSU', 'ANKARA', 'av.arzuoguz@gmail.com', 'http://www.arzuoguz.av.tr/tr/', 'tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (583, 'OK KARDEŞLER TREYLER A.Ş.', 'AYDIN', 'info@okkardesler.com.tr', 'http://www.okkardesler.com.tr/', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (584, 'OLCA GIDA VE PLASTİK AMB.SAN. TİC. LTD. ŞTİ.', 'TOKAT', 'olca@olca.com.tr', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (585, 'OLTAN GIDA MAD. İHR. İTH. VE TİC. LTD. ŞTİ.', 'TRABZON', 'oltan@oltangida.com.tr', 'www.oltangida.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (586, 'OMEGA GMBH', 'YURTDIŞI', 'info@omegagmbh.com', 'www.omegagmbh.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (587, 'OMSAN LOJİSTİK', 'YURTDIŞI', 'omsan@omsan.fr', 'www.omsan.com.tr', 'isl,end,ikt,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (588, 'OMTAŞ A.Ş.', 'KOCAELİ', 'h.eren@omtas.com.tr', 'www.omtas.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (589, 'ON ELEKTRONİK  SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'on@onelektronik.com', 'http://www.onelektronik.com/', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (590, 'ONUR İNŞAAT TİC.LTD. ŞTİ.', 'ANKARA', 'onur@onursan.com.tr', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (591, 'OPAL SU VE GIDA TEK. ÜRETİM PAZ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'diler.ercan@opalsu.com.tr', 'www.opalsu.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (592, 'OPTİMA MÜHENDİSLİK LTD. ŞTİ.', 'ANKARA', 'optima@optima-engineering.com', 'http://www.optima-engineering.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (593, 'ORDU TİCARET VE SANAYİ ODASI', 'ORDU', 'info@otso.org.tr', 'www.otso.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (594, 'ORTADOĞU RULMAN SAN. VE TİC. A.Ş.', 'ANKARA', 'kaptandogan06@yahoo.com.tr', 'www.ors.com.tr', 'isl,mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (595, 'ORTADOĞU STRATEJİK ARAŞTIRMALAR MERKEZİ-ORSAM', 'ANKARA', 'hasankanbolat@gmail.com', 'http://www.orsam.org.tr', 'ulu,tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (596, 'ORTANA ELEKTRONİK YAZILIM TAAH. SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'ozcan.tezcan@ortana.com', 'www.ortana.com', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (597, 'ORTEKS TEKSTİL ÜRÜNLERİ SAN. TİC. A.Ş.', 'NİĞDE', 'sedkayy@hotmail.com', '', 'end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (598, 'OSB ÜST KURULUŞU', 'ANKARA', 'ali@osbük.org.tr', 'http://www.osbuk.org', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (599, 'OSMAN SARGIN YMM', 'ANKARA', 'osmansargin1@hotmail.com', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (600, 'OSMANİYE TİCARET VE SANAYİ ODASI', 'OSMANİYE', 'otso80@ttmail.com', '', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (601, 'OSTİM ENDÜSTRİYEL YATIRIMLAR VE İŞLETME A.Ş.', 'ANKARA', 'hakand@ostimyatirim.com.tr', 'www.ostimyatirim.com.tr', 'end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (602, 'OTOKAR OTOBÜS KAROSERİ SANAYİ A.Ş.', 'SAKARYA', 'cmihmanli@otokar.com.tr', 'www.otokar.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (603, 'OZON GİYİM SAN. VE TİC. A.Ş. (DEFACTO)', 'İSTANBUL', 'oguz.erdogan@defacto.com.tr', 'http://www.defacto.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (604, 'ÖNER EV ALETLERİ SAN. VE TİC. LTD. ŞTİ.', 'SAKARYA', 'biroloner@elmob.com', 'www.elmob.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (605, 'ÖZALSAN PÜLVARİZATÖR SANAYİ/ÖZCAN ÖZAL', 'ADANA', 'ozalsantarmak@hotmail.com', 'www.ozalsantarmak.com', 'mak,ikt,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (606, 'ÖZÇELİK TEKSTİL MAKİNALARI VE PRES DÖKÜM SAN. VE TİC. AŞ.', 'GAZİANTEP', 'info@polyspin.com', 'www.polyspin.com', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (607, 'ÖZÇELİKLER HİDROLİK SİLİNDİR SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'mustafa@ozceliklerhydraulic.com', 'http://ozceliklerhydraulic.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (608, 'ÖZDEMİR İNŞ. SAN. TİC. LTD. ŞTİ.', 'ERZURUM', 'satis@ozdemirinsaat.com', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (609, 'ÖZEL TOBB ETÜ HASTANESİ', 'ANKARA', 'burcubilgin@tobbetuhastanesi.com.tr', 'http://www.tobbetuhastanesi.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (610, 'ÖZGÜN MATBAACILIK SAN. VE TİC. A.Ş.', 'ANKARA', 'seviyebim@gmail.com', '', 'isl,ele,end,mak,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (611, 'ÖZGÜNEY ELEKTRİK İNŞ. NAK. MOB. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@ozguney.com.tr', 'http://www.ozguney.com.tr/', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (612, 'ÖZGÜR DÖKÜM LTD. ŞTİ.', 'ANKARA', 'beratdar@ozgurdokum.com.tr', 'http://www.ozgurdokum.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (613, 'ÖZKA LASTİK VE KAUÇUK SAN. TİC. A.Ş.', 'KOCAELİ', 'kciftci@oz-ka.com', 'www.oz-ka.com', 'mak,ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (614, 'ÖZKA PREFABRİK YAPI SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'can@ozkaprefabrik.com', 'www.ozkaprefabrik.com', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (615, 'ÖZKAR OTOMOTİV PARÇALARI İMALAT SAN. TİC. A.Ş.', 'KOCAELİ', 'ozkaras@superonlıne.com', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (616, 'ÖZKIVRAK ISI SAN VE TİC.  LTD.ŞTİ.', 'KONYA', 'bilgi@kivrakisi.com', 'www.ozkivrak.com.tr', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (617, 'ÖZKUL BETON ELM.İNŞ.TUR.TİC.A.Ş.', 'ANKARA', 'ozkul@ozkulkaro.com.tr', 'www.ozkulkaro.com.tr', 'ikt,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (618, 'ÖZKURAL TEKSTİL  VE TURİZM SAN. A.Ş.', 'İSTANBUL', 'ozguro@ozkural.com', 'www.ozkural.com', 'isl,sat,ikt,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (619, 'ÖZMAK MAKİNA VE ELEKTRİK  A.Ş.', 'ANKARA', 'kkontrol@ozmak-as.com', 'www.ozmak-as.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (620, 'ÖZNUR SAVUNMA HAVACILIK VE MAKINA SAN. TIC. LTD. ŞTI.', 'ANKARA', 'dekiciler@oznurmakina.com.tr', 'www.oznurmakina.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (621, 'ÖZTÜRKLER OTOMOTİV A.Ş.', 'SAKARYA', 'destek@ozturkleroto.com.tr', 'ozturkleroto.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (622, 'ÖZUTKU OTOMOTİV MAKİNA PETROL ÜRÜN. SAN. TİC. LTD. ŞTİ.', 'AFYON', 'ozutku@ttnet.net.tr', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (623, 'PARSAN MAKİNA PARÇALARI SANAYİİ A.Ş.', 'İSTANBUL', 'dcaliskan@parsan.com', 'www.parsan.com.', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (624, 'PAŞAOĞULLARI TEKSTİL SAN. VE TİC. LTD. ŞTİ.', 'UŞAK', 'info@pasaogullari.com.tr', '', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (625, 'PEKER ORTAK GİRİŞİMİ', 'ANKARA', 'deniz.kaya@hotmail.com', 'http://www.kolejimyemek.com/', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (626, '"PELENKOĞLU HAZIR BETON YAPI ELEMANLARI İNŞ. TAAH. 			"', 'BARTIN', 'info@pelenkoğlu.com.tr', 'http://www.pelenkoglu.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (627, 'PELENKOĞLU HAZIR BETON YAPI ELEMANLARI İNŞ. TAAH. SAN. LTD.ŞTI.', 'BARTIN', 'info@pelenkoglu.com.tr', 'http://www.pelenkoglu.com.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (628, 'PETAŞ PROFESYONEL ELEKTRONİK SAN. VE TİC. AŞ.', 'ANKARA', 'kinal@petas.com.tr', 'www.petas.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (629, 'PETRA ENDÜSTRİYEL ÜRÜNLER SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'gulay.kucuk@petratr.com.tr', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (630, 'PFIFFNER TRANSFORMATÖR VE ELEKT. GER. ÜRET. SAN. VE TİC. A.Ş.', 'ANKARA', 'ytumay@pfiffner.com.tr', 'www.pfiffner.com.tr', 'end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (631, 'Pİ MAKİNA OTOMOTİV İNŞAAT MAKİNA PAZ. İHR. İTHL.SAN. VE TİC. LTD ŞTİ.', 'ANKARA', 'csavran@pimakina.com.tr', 'http://www.pimakina.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (632, 'PİMMAKSAN İŞ MAKİNALARI SAN.TİC.LTD. ŞTİ.', 'ANKARA', 'fabrika@pimmaksan.com', 'http://www.pimmaksan.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (633, 'PİSTONSAN MOTOR PİSTONLARI İMALAT VE SAN. TİC. LTD. ŞTİ.', 'KONYA', 'pistonsan@pistonsan.com.tr', 'www.pistonsan.com.tr', 'end,ulu,ikt,mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (634, 'PLATFORM MOBİLYA SAN. TİC. AŞ.', 'AMASYA', 'platform@platformprofil.com.tr', 'www.platformprofil.com.tr', 'isl,mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (635, 'PMS POLİETİLEN MAMULLERİ SAN. TİC. LTD. ŞTİ.', 'İZMİR', 'hatice.guzeldemir@pms.com.tr', 'http://www.pms.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (636, 'POELSAN PLASTİK SAN. VE TİC. LTD. ŞTİ.', 'SAMSUN', 'poelsan@poelsan.com', 'www.poelsan.com', 'isl,mak,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (637, 'POLİMER KAUÇUK SAN. VE PAZ. A.Ş.', 'İSTANBUL', 'muzaffer.topcuoglu@sel.com.tr', 'www.sel.com.tr', 'end,isl,ulu,mak,ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (638, 'PRESAN PREFABRİK İŞ. SAN. TİC. LTD. ŞTİ.', 'KONYA', 'info@presan.com.tr', 'www.presan.com.tr', 'mak,end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (639, 'PRESMAK A.Ş.', 'BURSA', 'nhakcil@presmak.com', 'www.presmak.com', 'end,mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (640, 'PROBİL BİLGİ İŞLEM DESTEK VE DANIŞMANLIK SAN.VE TİC.A.Ş.', 'ANKARA', 'arda.donmezer@probil.com.tr', 'www.probil.com.tr', 'ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (641, 'PROFİLO TELRA ELEKTRONİK SANAYİ VE TİCARET AŞ.', 'İSTANBUL', 'dkeskin@profilo-telra.com.tr', 'www.profilo-telra.com.tr', 'ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (642, 'PROKON MÜH. VE MÜŞ. A.Ş.', 'ANKARA', 'info@prokon.com.tr', 'www.prokon.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (643, 'PROTA BİLGİSAYAR A.Ş.', 'ANKARA', 'protasatis@prota.com.tr', 'http://www.prota.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (644, 'RADSAN ELEKTROMEKANİK İNŞ. SAN. TİC. A.Ş.', 'ANKARA', 'ct@radsan.com.tr', 'www.radsan.com.tr', 'bil,ele,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (645, 'RADYO VE TELEVİZYON ÜST KURULU (RTÜK)', 'ANKARA', 'nihalevci@rtuk.org.tr', 'www.rtuk.org.tr', 'bil,ele,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (646, 'RAMAZAN BAŞARAN MALİ MÜŞ.', 'ANKARA', 'ramazan_basaran@yahoo.com.tr', '', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (647, 'RANDA ELEKTRONİK SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'info@randa.com.tr', 'http://www.randaelektronik.com', 'ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (648, 'RASİM ÇELİK MAK. SAN. A.Ş.', 'ANKARA', 'info@blockmac.com', 'www.blockmac.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (649, 'REFERANS ÇEVRE TEKNOLOJİLERİ MAK. BİL. İTH. İHR. DAN. TİC. LTD. ŞTİ.', 'ANKARA', 'emre@referanscevre.com.tr', 'www.referanscevre.com.tr', 'bil,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (650, 'REKSAN REKOR SAN. VE TİC. A.Ş.', 'ANKARA', 'info@uncoreksan.com.tr', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (651, 'RNA İLETİŞİM DANIŞMANLIK VE REKLAM PAZARLAMA', 'İSTANBUL', 'info@rna.com.tr', 'www.rna.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (652, 'ROBUTEL ELEKTRONİK MAKİNA YAZILIM LTD. ŞTİ.', 'ANKARA', 'scozturk@robutel.com', 'www.robutel.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (653, 'ROKETSAN  A.Ş.', 'ANKARA', 'idogusal@roketsan.com.tr', 'www.roketsan.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (654, 'RONA  MAKİNA SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'rona@rona.com.tr', 'www.rona.com.tr', 'isl,mak', 1, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (655, 'RÜYA AJANS DİJİTAL BASKI VE AÇIK HAVA REKLAMCILIK LTD. ŞTİ.', 'ANKARA', 'info@ruyaajans.com.tr', 'www.ruyajans.com.tr', 'sat,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (656, 'SAĞLIK KAYNAK SUYU İŞLET. GIDA SAN. VE TİC. A.Ş.', 'ANKARA', 'myalcin83@hotmail.com', 'www.sagliksu.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (657, 'SAINT-GOBAIN RİGİPS ALÇI SAN.VE TİC.A.Ş.', 'ANKARA', '', 'www.saint-gobain.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (658, 'SAKARYA TİCARET VE SANAYİ ODASI', 'SAKARYA', 'info@adptso.org.tr', 'www.adptso.org.tr', 'ikt,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (659, 'SA-MO-PAR SAN. VE TİC. A.Ş.', 'KOCAELİ', 'samopar@samopar.com', '', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (660, 'SAMSUN TİCARET VE SANAYİ ODASI', 'SAMSUN', 'samsuntso@samsuntso.org.tr', 'www.samsuntso.org.tr', 'mat,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (661, 'SAMUR HALILARI SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'muhasebe@samur.com.tr', 'www.samur.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (662, 'SANEM MATBAACILIK A.Ş.', 'ANKARA', 'gizem@sanem.com.tr', 'www.sanem.com.tr', 'end,mak,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (663, 'SANKO MAKİNA SAN.VE TİC. A.Ş.', 'GAZİANTEP', 'pazarlama@sankomakina.com.tr', 'www.sankomakina.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (664, 'SANO-MED SAĞLIK HİZMETLERİ TİC. LTD. ŞTİ.', 'ANKARA', 'dromerdeveci@gmail.com', '', 'isl,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (665, 'SANSET İKOOR PROJE TAAH VE DEK. SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'ikoor@ikoor.com.tr', 'http://www.ikoor.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (666, 'SARAR GİYİM TEKSTİL SAN. VE TİC. A.Ş.', 'ESKİŞEHİR', 'yasemin.uca@sarar.com', 'www.sarar.com.tr', 'ikt,end,isl,ulu,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (667, 'SARIKAYA HUKUK BÜROSU', 'ANKARA', 'info@sarikaya.av.tr', 'http://sarikaya.av.tr/avukat/iletisim.php', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (668, 'SASA VE SASA HUKUK BÜROSU', 'ANKARA', 'sasa@sasa.av.tr', 'http://www.sasa.av.tr/', 'ulu,huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (669, 'SASEL ELEKTROMEKANİK SAN. VE TİC. A.Ş.', 'ANKARA', 'auzun@sasel.com.tr', 'www.sasel.com.tr', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (670, 'SAVRONİK ELEKT. SAN. VE TİC. A.Ş.', 'ANKARA', 'savronik@savronik.com.tr', 'www.savronik.com.tr', 'ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (671, 'SCHNEIDER ELEKTRİK SANAYİ VE TİCARET A.Ş.', 'MANİSA', 'tuncaycigeroglu@tr.Schneider-electric.com', 'www.schneiderelectric.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (672, 'SCHOTT ORİM CAM SAN. VE TİC. A.Ş.', 'İSTANBUL', 'metin.suzgen@schott.com', 'www.schott.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (673, 'SDT UZAY VE SAVUNMA TEKNOLOJILERI A.Ş.', 'ANKARA', 'dtaylan@sdt.com.tr', 'www.sdt.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (674, 'SEÇİL PLASTİK KAUÇUK SAN.VE TİC.LTD.ŞTİ.', 'İÇEL', '', 'www.seciltr.com/', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (675, 'SEÇKİN BEST OTELCİLİK TURİZM İŞLETMECİLİĞİ TİC.LTD.ŞTİ.', 'MUĞLA', 'info@seckinbest.com.tr', 'http://www.seckinbest.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (676, 'SEÇKİN İÇECEK GIDA NAK. OTO. PAZ. İTH. İHR. VE TİC. LTD. ŞTİ.', 'ANTALYA', '', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (677, 'SEÇKİN YAYINCILIK A.Ş.', 'ANKARA', 'seckin@seckin.com.tr', 'www.seckin.com.tr', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (678, 'SELAMOĞLU MAKİNE LTD. ŞTİ.', 'ANKARA', 'info@selamoglumakina.com.tr', 'www.selamoglumakina.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (679, 'SELAMOĞLU ULUSLARARASI NAK. VE TİC. A.Ş.', 'ANKARA', 'memduh@selamoglu.com', 'www.selamoglu.com', 'isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (680, 'SELEN GİYİM TEKS. SAN. TİC.LTD. ŞTİ.', 'ANKARA', 'deryagunes@selengiyim.com', 'www.selengiyim.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (681, 'SELEX KOMÜNİKASYON A.Ş.', 'ANKARA', 'sibel.aksoy@selex-comms.com.tr', 'www.selex-comms.com.tr', 'ulu,bil,ele,mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (682, 'SELNİKEL ISITMA VE KLİMA CİH. SAN. A.Ş.', 'ANKARA', 'musa@selnikel.com.tr', 'www.selnikel.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (683, 'SENTES-BİR SAN. TES. İMAL. VE MONTAJ TİC. A.Ş.', 'İZMİR', 'mulayim.tuncelli@sentes-bir.com', 'www.sentes-bir.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (684, 'SERDAR PLASTİK SAN. VE TİC. LTD.ŞTİ.', 'ANKARA', 'ik@serdarplastik.com.tr', 'http://www.serdarplastik.com.tr', 'mak,end,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (685, 'SESLİM TEKSTİL SAN.VE TİCARET A.Ş.', 'UŞAK', 'ozmensak@seslim.com', 'www.seslim.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (686, 'SETEKS KONFEKSİYON ÜRÜNLERİ SANAYİ VE İHRACAT LTD.', 'İSTANBUL', 'halil@seteks.net', 'www. seteks.net', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (687, 'SEVİNÇ MAKİNA SAN. VE TİC. A.Ş.', 'ANKARA', 'lkucukaslan@sevincmuhendislik.com.tr', 'http://sevincmakina.com.tr/', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (688, 'SEVİNÇ MÜHENDİSLİK MÜŞAVİRLİK LTD. ŞTİ.', 'ANKARA', 'tahatiryaki@sevincmuhendislik.com.tr', 'http://sevincmuhendislik.com.tr/', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (689, 'SEVİYE DERSHANECİLİK YAY. LTD. ŞTİ.', 'ANKARA', 'info@seviye.com.tr', 'www.seviye.com.tr', 'tde,mat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (690, 'SIEMENS EC KURUMSAL İLETİŞİM HİZMETLERİ SAN. VE TİC. AŞ.', 'ANKARA', 'sen.ik.tr@siemens-enterprise.com', 'www.siemens.com.tr', 'bil,end,isl,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (691, 'SILVERLINE ENDÜSTRİ VE TİC. A.Ş.', 'AMASYA', 'rifat.celikkaya@silverline.com.tr', 'www.silverline.com.tr', 'end,ikt,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (692, 'SILVERLINE EV GEREÇLERİ SATIŞ VE PAZARLAMA A.Ş.', 'İSTANBUL', 'cagil.dervisoglu@silverline.com.tr', 'www.silverline.com.tr', 'mak,end,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (693, 'SİBERCOM YAZILIM VE BİLGİSAYAR VE OTOMASYON SİSTEMLERİ SAN VE TİC LTD ŞTİ.', 'ANKARA', 'cem@sibercom.com.tr', 'www.sibercom.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (694, 'SICPA ASSAN', 'İSTANBUL', 'gokturk.basli@sicpaassan.com', 'http://www.sicpaassan.com', 'end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (695, 'SİNOP TİCARET VE SANAYİ ODASI', 'SİNOP', 'sinoptso@tobb.org.tr', 'http://www.sinoptso.org.tr', 'ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (696, 'SİNTER METAL İMALAT SAN. A.Ş.', 'İSTANBUL', 'sibel@sinter-metal.com', 'www.sinter-metal.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (697, 'SİRUS AHŞAP SAN. LTD. ŞTİ', 'ANKARA', 'info@sirusahsap.com.tr', 'www.sirusahsap.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (698, 'SİSTEM YAPI İNŞAAT VE TİC. A.Ş.', 'İSTANBUL', 'hayala@sistemyapi.com.tr', 'www.sistemyapi.com.tr', 'ulu,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (699, 'SİSTEM YAZILIM TASARIM SAN. VE TİC. A.Ş.', 'ANKARA', 'h.guler@sys-inc.com', 'www.sys-inc.com', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (700, 'SİSTEMİM(KARACA GRUP BILIŞIM ELEKTRONIK MAK. DANIŞ. SAN. VE TIC. LTD.ŞTI.)', 'ANKARA', 'mehmet@sistemim.com.tr', 'http://www.internetreklampaketi.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (701, 'SİVAS TICARET VE SANAYI ODASI', 'SİVAS', 'info@sivastso.org', '', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (702, 'SLOVENYA İŞ VE ARAŞTIRMA BİRLİĞİ', 'YURTDIŞI', '', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (703, 'SMM HIDIR KÖSE', 'ANKARA', '', 'hidirkose@gmail.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (704, 'SMMM (SALİH ÜNAL)', 'İSTANBUL', 'salihunal@yahoo.com', '', 'ulu,ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (705, 'SOLVEKA YAZ. TELEK. BİLGİ VE  İLETİŞİM EĞİTİM TEK. VE HİZM. ELEKT. SAN. TİC.  LTD. ŞTİ', 'ANKARA', 'kcaglar@solveka.com.tr', 'www.solveka.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (706, 'SONÇELİK MÜHENDİSLİK İNŞAAT PROJE TAAHHÜT SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'soncelikmuhendislik@gmail.com', '', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (707, 'SÖĞÜTÖZÜ İNŞAAT VE İŞLETME A.Ş.', 'ANKARA', 'murat@armadaavm.com.', 'www.armadaavm.com.', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (708, 'SÖNMEZ A.S.F. İPLİK DOKUMA VE BOYA SAN. A.Ş.', 'BURSA', 'sps.personel@sonmezholding.com.tr', 'www.sonmezholding.com.t', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (709, 'SÖNMEZ AGB TEKNOLOJİ SAN. TEKNOLOJİ SAN. VE TİC. A.Ş.', 'BURSA', 'info@agb.com.tr', 'www.sonmezholding.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (710, 'SÖNMEZ PAMUKLU SAN. A.Ş.', 'BURSA', 'sps.personel@sonmezholding.com.tr', 'www.sonmezholding.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (711, 'SÖZ GIDA A.Ş.', 'KONYA', 'ssozen@sozgida.com.tr', 'www.sozgida.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (712, 'STANDART GAYRİMENKUL DEĞERLEME UYGULAMALARI A.Ş.', 'İSTANBUL', 'yyturan@standartgd.com', 'www.standartgd.com', 'isl,huk,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (713, 'STRATEK STRATEJİK TEKNOLOJİLER ARAŞTIRMA VE GELİŞTİRME LTD. ŞTİ.', 'ANKARA', 'selim@stratek.com.tr', 'http://www.stratek.com.tr', 'end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (714, 'SU-ENER MÜHENDISLIK VE ENERJI HIZMETLERI SAN. VE TIC. LTD. ŞTI.', 'ANKARA', '', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (715, 'SUNAR MISIR ENTEGRE TESİSLERİ SAN. VE TİC. A.Ş.', 'ADANA', 'bandi@sunarmisir.com', 'ww.sunarmisir.com', 'mak,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (716, 'SUPPORT  YAZILIM DONANIM  DANIŞMANLIK  TICARET  LTD. ŞTI.', 'İSTANBUL', 'info@support.com.tr', 'www.support.com.tr', 'end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (717, 'SUTA İNŞAAT VE MÜHENDİSLİK LTD.ŞTİ.', 'ANKARA', '', 'www.suta.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (718, 'SÜPER FİLM AMBALAJ SANAYİ VE TİCARET A.Ş.', 'GAZİANTEP', 'baybey@superfilm.com', 'www.superfilm.com.', 'ele,bil,isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (719, 'SÜRAT BİLİŞİM TEKNOLOJİLERİ SAN.  TİC. A.Ş.', 'ANKARA', 'serkan.calisicioglu@surat.com', 'http://www.surat.com.tr/', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (720, 'ŞAHİNLER METAL SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'pinar@sahinler.com.tr', 'www.sahinler.com.tr', 'end,isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (721, 'ŞANLIURFA TİCARET BORSASI', 'ŞANLIURFA', 'borsa@sutb.org.tr', 'www.sutb.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (722, 'ŞANLIURFA TİCARET VE SANAYİ ODASI', 'ŞANLIURFA', 'bilgi@sutso.org.tr', 'www.sutso.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (723, 'ŞAPÇI AHŞAP VE MOBİLYA', 'AFYON', 'sapciahsap@hotmail.com', '', 'isl,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (724, 'ŞİDA TEKSTİL ORG. SAN. TİC. LTD. ŞTİ. (SHEDA MODAEVİ)', 'ANKARA', 'sheda@shedamoda.com - damla.sonat@gmail.com', 'www.shedamoda.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (725, 'ŞÖLEN ÇİKOLATA GIDA SAN VE TİC A.Ş.', 'GAZİANTEP', 'info@solen.com.tr', 'www.solen.com.tr', 'ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (726, 'T.C. HALK BANKASI A.Ş.', 'ANKARA', 'canan.atay@halkbank.com.tr', 'www.halkbank.com.tr', 'end,ikt,mat,bil,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (727, 'TABİM BİLGİSAYAR PAR. TİC. LTD. ŞTİ.', 'ANKARA', 'muhasebe@tabim.com.tr', 'www.tabim.com.tr', 'ikt,ulu,bil,isl,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (728, 'TALYA BİLİŞİM TİC. SAN. LTD. ŞTİ.', 'ANKARA', 'nilufer@talyabilisim.net', '', 'bil,ele,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (729, 'TAM ESER İNŞAAT VE ÇELİK EŞYA SAN. TİC.A.Ş', 'ANKARA', 'tameser@tameser.com.tr', 'www.tameser.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (730, 'TAM MÜHENDİSLİK TİC. VE TAAH. LTD. ŞTİ.', 'ANKARA', 'namikozcan@tamengineering.com', 'www.tamengineering.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (731, 'TAQ TAQ OPERATING COMPANY LTD. TÜRKİYE', 'ANKARA', 'h.savas@ttopco.com', 'www.ttopco.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (732, 'TARİH VAKFI DÖNER SERMAYE İŞLETMESİ', 'ANKARA', 'uozen@tarihvakfi.org.tr', '', 'tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (733, 'TAŞOLUK BELEDİYESİ (İMAR VE ŞEHİRCİLİK MÜDÜRLÜĞÜ)', 'İSTANBUL', 'bircan_gs@hotmail.com', 'www.tasoluk.bel.tr', 'mak,bil,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (734, 'TAV HAVALİMANLARI HOLDİNG A.Ş.', 'ANKARA', 'sinem.toker@tav.aero', 'www.tav.aero', 'end,ikt,isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (735, 'TBD TESİS BAKIM DESTEK TİC. LTD.ŞTİ.', 'ANKARA', 'destek@tesisbakim.com', 'http://tbdweb.weebly.com', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (736, 'TBP OTOMOTİV SAN. TİC. A.Ş.', 'KONYA', 'info@kahveci.com.tr', 'www.kahveci.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (737, 'TEFİROM İNŞAAT ENERJİ SAN. TİC.A.Ş.', 'ANKARA', 'oberendi@tefirom.com.tr', 'www.tefirom.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (738, 'TEGA MÜHENDISLIK SANAYI VE TICARET A.Ş.', 'ANKARA', 'abostan@tega.com.tr', 'www.tega.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (739, 'TEI - TUSAŞ MOTOR SANAYİİ A.Ş.', 'ESKİŞEHİR', 'yeliz.vural@tei.com.tr', 'http://www.tei.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (740, 'TEKNOTES A.Ş.', 'ANKARA', '', '', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (741, 'TEKTES TEKNOLOJİK TESİSAT SİSTEMLERİ SAN.VE TİC.A.Ş.', 'ANKARA', 'tektes@tektes.com', 'www.tektes.com', 'mak,sat,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (742, 'TELMEK TELEKOMÜNİKASYON MEK. SAN. VE TİC.  A.Ş.', 'ANKARA', 'ozkan@telmek.com', 'www.telmek.com', 'isl,sat,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (743, 'TEMEL EKEN HUKUK BÜROSU', 'ANKARA', '', 'www.temelekenhukukburosu.com', 'huk', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (744, 'TEMPO METAL AKSESUAR SAN VE TİC. A.Ş.', 'İSTANBUL', 'selda.aydin@timay-tempo.com', 'www.timay-tempo.com/', 'mak,end,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (745, 'TEMSA SANAYI VE TICARET A.Ş', 'ADANA', 'pinar.gocer@temsaglobal.com', 'www.temsa.com.tr', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (746, 'TENGEN BILIŞIM TEKNOLOJILERI VE DANIŞMANLIK HIZMETLERI TICARET LTD. ŞTİ.', 'ANKARA', 'cemil.sezer@tengen.com.tr', 'http://tengen.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (747, 'TEOREM  BİLİŞİM VE DANIŞMANLIK LTD. ŞTİ.', 'ANKARA', 'dromerdeveci@gmail.com', 'şikayetvar.com', 'sat,mat,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (748, 'TEPAV-TÜRKİYE EKONOMİ POLİTİKALARI ARAŞTIRMA VAKFI', 'ANKARA', 'mezenef@tepav.org.tr', 'www.tepav.org.tr', 'ulu,ikt,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (749, 'TEPE TEKNOLOJİK SERVİSLER A.Ş.', 'ANKARA', 'dduzgunoglu@tepeteknoloji.com.tr', 'www.tepeteknoloji.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (750, 'TERMİKEL MADENİ EŞYA SAN. İTH. VE İHR.  A.Ş.', 'ANKARA', 'mehmetcinar@termikel.com.tr', 'www.termikel.com.tr', 'mak,end,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (751, 'TETA END. ELEKTRONİK SAN. VE TİC. A.Ş.', 'ANKARA', 'info@teta.com.tr', 'www.teta.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (752, 'TETNAK TAŞIMACILIK TUR. VE TİC. A.Ş.', 'ANKARA', 'erhang@tetnak.com.tr', 'www.tetnak.com.tr', 'isl,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (753, 'TILDA TELEKOM PAZARLAMA DANIŞMANLIK BILGISAYAR SAN. LTD. ŞTI.', 'ANKARA', 'onder@tilda.com.tr', 'www.tilda.com.tr', 'ele,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (754, 'TİLTAY GIDA SAN. A.Ş.', 'ADANA', 'haluk@tiltaygida.com', '', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (755, 'TİMAŞ BASIM TİC. VE SAN. A.Ş.', 'İSTANBUL', 'bayramgurbuz@timas.com.tr', 'www.timas.com.tr', 'tde,ulu,sat,tar,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (756, 'TİMAY ÇIT ÇIT RİVET VE PERÇİN A.Ş.', 'AMASYA', 'emine.bozkurt@timay-tempo.com', 'http://www.timay-tempo.com', 'mak,ikt,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (757, 'TKG OTOMOTİV SAN. VE TİC.A.Ş.', 'BURSA', 'a.isbilir@tkg.com.tr', 'www.tkg.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (758, 'TMMOB MAKİNA MÜHENDİSLERİ ODASI', 'ANKARA', 'sekreterlik@mmo.org.tr', 'http://www.mmo.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (759, 'TMO - TOBB TARIM ÜRÜNLERİ LİSANSLI DEPOCULUK SAN. VE TİC. A.Ş.', 'ANKARA', 'tahsinaksoy58@gmail.com', '', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (760, 'TOBB ETÜ', 'ANKARA', 'hcotuk@gmail.com', 'www.etu.edu.tr', 'isl,end,ikt,bil,mat,ele,ulu,tar,mak,tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (761, 'TOBB ETÜ SÜREKLİ EĞİTİM MERKEZİ', 'ANKARA', 'sebnem@etu.edu.tr', 'www.etu.edu.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (762, 'TOFAŞ TÜRK OTOMOBİL FABRİKASI A.Ş.', 'BURSA', 'stajyeryonetimi@tofas.com.tr', 'http://www.tofas.com.tr', 'end,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (763, 'TOKAT TİCARET VE SANAYİ ODASI', 'TOKAT', 'yze@sademturk.com', '', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (764, 'TOROS AYDINLATMA SAN. TİC. LTD. ŞTİ.', 'ISPARTA', 'kadir@torosaydinlatma.com', 'www.torosaydinlatma.com', 'mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (765, 'TOSUNOĞLU TEKSTİL SAN. VE TİC. A.Ş.', 'DENİZLİ', 'tosunoglu@tosunoglu.com.tr', 'http://www.integro.com.tr/, www.tosunoglu.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (766, 'TOYOTA OTOMOTİV SAN. TÜRKİYE A.Ş.', 'SAKARYA', 'Burcu.PIRIC@toyotatr.com', 'http://www.toyotatr.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (767, 'TOZMETAL TİC. VE SAN. A.Ş.', 'İSTANBUL', 'ozdural@tozmetal.com', 'www.tozmetal.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (768, 'TRABZON TİCARET VE SANAYİ ODASI', 'TRABZON', 'ttso@ttso.org.tr', 'www.ttso.org.tr', 'isl,ulu,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (769, 'TREYSAN PREFABRİK ÇELİK YAPILAR SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'ayca.kiral@treysan.com.tr', 'www.treysan.com.tr', 'mak,end,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (770, 'TROY ÜRETİM DÖKÜM PROJE VE TEKNOLOJİK ÜRÜNLER SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'troy@troyteknoloji.com', 'www.troyteknoloji.com', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (771, 'TROYA TEKSTİL SAN. VE TİC. LTD. ŞTİ.', 'DENİZLİ', 'faruk@troyatextile.com', 'www.troyatextile.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (772, 'TT ÇELİKYAY OTOMOTİV DIŞ TİC. SAN. A.Ş.', 'İSTANBUL', 'fabrika@celikyay.com.tr', 'www.celikyay.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (773, 'TURBO - TURKISH RESEARCH BUSINESS ORGANIZATION', 'YURTDIŞI', 'gokgoz@turboppp.org', 'www.turboppp.org', 'ulu,ikt,isl,mat,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (774, 'TURKTIPSAN A.Ş.', 'ANKARA', 'e.koyuncu@turktipsan.com.tr', 'http://www.turktipsan.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (775, 'TUSA ZEMİN YAPI MARKET İNŞ. SAN. TİC. LTD.ŞTİ.', 'ANKARA', 'mustafa@tusa.com.tr', 'www.tusa.com.tr', 'bil,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (776, 'TUSAŞ TÜRK HAVACILIK VE UZAY SANAYİ A.Ş.(TAI)', 'ANKARA', 'ubaydur@tai.com.tr', 'www.tai.com.tr', 'bil,end,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (777, 'TÜFEKÇİOĞLU KAUÇUK SAN. LTD. ŞTİ.', 'ANKARA', 'info@tk.com.tr', 'www.tk.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (778, 'TÜRE MOBİLYA LTD. ŞTİ.', 'ANKARA', 'info@turemobilya.com', 'www.turemobilya.com', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (779, 'TÜRK DAYANIŞMA BÜROSU', 'YURTDIŞI', 'korkmaz@tdb-immo.de', 'www.tdb-immo.de', 'mak,isl,ikt,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (780, 'TÜRK DİL KURUMU', 'ANKARA', 'bilgi@tdk.org.tr', 'www.tdk.gov.tr', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (781, 'TÜRK TARİH KURUMU', 'ANKARA', 'bilgi@ttk.org.tr', 'www.ttk.org.tr', 'tar', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (782, 'TÜRK TELEKOMÜNİKASYON A.Ş.', 'ANKARA', 'serhat.binici@turktelekom.com.tr', 'http://www.turktelekom.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (783, 'TÜRK TRAKTÖR VE ZİRAAT MAKİNELERİ A.Ş.', 'ANKARA', 'cereng@turktraktor.com.tr', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (784, 'TÜRKİYE KURUMSAL SOSYAL  SORUMLULUK DERNEĞİ', 'ANKARA', 'serdar.dinler@csrturkey.org', 'www.kssd.org', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (785, 'TÜRKİYE ODALAR VE BORSALAR BİRLİĞİ (TOBB)', 'ANKARA', 'ramazan.atalar@tobb.org.tr', 'www.tobb.org.tr', 'isl,ikt,ulu,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (786, 'TÜRKİYE RADYO TELEVİZYON KURUMU', 'ANKARA', 'ramazan.sutcu@trt.net.tr', 'www.trt.net.tr', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (787, 'TÜRKİYE TEKNOLOJİ GELİŞTİRME VAKFI (TTGV)', 'ANKARA', 'fkurtay@ttgv.org.tr', 'www.ttgv.org.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (788, 'TÜRKSAT UYDU HABERLEŞME VE KABLO TV A.Ş.', 'ANKARA', 'maksu@turksat.com.tr', 'www.turksat.com.tr', 'ele,end,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (789, 'TÜR-SUM İNŞ. PROJE LTD. ŞTİ.', 'ANKARA', 'tur-sum@tur-sum.com.tr', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (790, 'TÜZÜN GİYİM SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@tuzun.com.tr', 'www.tuzun.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (791, 'TÜZÜN KARDEŞLER MAK. SAN. TİC. A.Ş.', 'ANKARA', 'aysutuzun@hotmail.com', 'www.tuzunkardesler.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (792, 'UDEA ELEKTRONİK TİC. LTD. ŞTİ.', 'ANKARA', 'ober@udea.com.tr', 'http://www.udea.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (793, 'UĞUR MUTFAK SAN.TİC.LTD.ŞTİ.', 'ANKARA', '', '', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (794, 'ULUKARTAL HOLDİNG A.Ş.', 'İSTANBUL', 'bilgi@ulukartalholding.com.tr', 'http://www.ulukartal.com.tr', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (795, 'ULUSLARARASI İLİŞKİLER KONSEYİ DERNEĞİ', 'İSTANBUL', 'sacikmese@etu.edu.tr', 'www.uik.org.tr', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (796, 'ULUSOY DENİZ YOLLARI İŞLETMECİLİĞİ A.Ş.', 'İSTANBUL', 'basboga@ulusoysealines.com', 'http://www.ulusoysealines.com', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (797, 'ULUSOY ELEKTRİK İMALAT TAAH. VE TİC. A.Ş.', 'ANKARA', 'pelin.bolukbasi@ulusoyelektrik.com.tr', 'www.ulusoyelektrik.com.tr', 'end,ele,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (798, 'UMG ENDÜSTRİYEL MUTFAK GIDA TEKS. İÇ VE DIŞ SAN TİC. LTD. ŞTİ.', 'İSTANBUL', 'info@umgmutfak.com', 'www.umgmutfak.com', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (799, 'UMUMİ MAĞAZALAR TÜRK A.Ş.', 'ANKARA', 'kiymet@umat.com.tr', 'www.umat.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (800, 'UNICOM UNİVERSAL BİLGİSAYAR HİZ. TİC. LTD. ŞTİ.', 'ANKARA', 'recep@unicomltd.com.tr', 'www.unicomltd.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (801, 'UNICORN', 'YURTDIŞI', 'unicorn-js@wp.pl', 'www.Unicorn-sme.org', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (802, 'UNORMAK DEĞİRMEN MAKİNALARI SAN. VE TİC. LTD. ŞTİ.', 'KONYA', 'unormak@unormak.com.tr', 'www.unormak.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (803, 'UPA MAKINA SANAYI VE TICARET LTD. STI.', 'ANKARA', 'umut.diril@gmail.com', 'www.upamakina.com', 'mak,bil,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (804, 'UTES DERNEĞİ(İNGİLTERE TÜRKİYE ÇEVRE DERNEĞİ)', 'ANKARA', 'irem.ipci@utes-der.org', 'www.utes-der.org', 'ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (805, 'UYGUN UZAY VE SAVUNMA TEKNOLOJİLERİ ELK. MAK. YAZ. SAN TİC LTD.ŞTİ.', 'ANKARA', 'omer@uygunuzay.com', '', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (806, 'UYUMSOFT BİLGİ SİSTEMLERİ VE TEKN TİC. A.Ş.', 'ANKARA', 'selcuk.alkas@uyumsoft.com.tr', 'http://www.uyumsoft.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (807, 'ÜÇDE MÜHENDİSLİK SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'burcubarin@ucde.com.tr', 'www.ucde.com.tr', 'mak,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (808, 'ÜÇGEN DEK. İNŞ. MİM. MÜH.TUR. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'sinanerdogan18@hotmail.com', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (809, 'ÜÇMED TIBBİ CİHAZLAR LTD. ŞTİ.', 'ANKARA', 'trimed@trimed.com.tr', 'www.trimed.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (810, 'ÜLGEN ENDÜSTRİYEL SİSTEMLER VE TEKNİK CİHAZLAR SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'admin@ulgen.com.tr', 'www.ulgen.com.tr', 'ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (811, 'ÜLKER GIDA SAN. VE TİC. A.Ş.', 'İSTANBUL', 'İlknur.seviner@ulker.com.tr', 'www.ulker.com.tr', 'mak,ele,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (812, 'ÜNAL PASLANMAZ ÇELİK ÜRETİM İMALAT PAZ. LTD. ŞTİ.', 'ANKARA', 'unal@unalpaslanmaz.com.tr', 'www.unalpaslanmaz.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (813, 'ÜNER YAYINCILIK BASIM SANAYİ VE TİC. A. Ş.', 'ANKARA', 'isilkarabiyik@hotmail.com', 'http://www.uneryayincilik.com', 'tde', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (814, 'ÜNTES ISITMA KLİMA SOĞUTMA SAN. VE TİC. A.Ş', 'ANKARA', 'sonaydursun@mynet.com', 'www.untes.com.tr', 'end,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (815, 'ÜZÜMCÜ TIBBİ CİHAZ VE MEDİKAL GAZ SİSTEMLERİ A.Ş.', 'ANKARA', 'saide.dinlen@uzumcu.com.tr', 'www.uzumcu.com', 'mak,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (816, 'VAILLANT ISI SAN. VE TİC. LTD. ŞTİ.', 'İSTANBUL', 'sinan.torum@vaillant.com.tr', 'www.vaillant.com.tr', 'bil,ulu', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (817, 'VEN İÇMİMARLIK İNŞAAT DEK. SAN. TİC. LTD.ŞTİ.', 'ANKARA', 'tulay@venmimarlik.com', 'www.venicmimarlik.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (818, 'VENTURA YAZILIM LTD. ŞTİ.', 'İSTANBUL', 'baran@ventura.com.tr', 'www.ventura.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (819, 'VESTEL BEYAZ EŞYA SANAYİ VE TİCARET A.Ş.', 'MANİSA', '', 'www.vestel.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (820, 'VESTEL DİJİTAL ÜRETİM SANAYİ A.Ş.', 'MANİSA', 'cansu.turkan@vestel.com.tr', 'www.vestel.com.tr', 'bil,end,mak,ele', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (821, 'VESTEL ELEKTRONİK SAN. VE TİC. A.Ş.', 'MANİSA', 'cansu.turkan@vestel.com.tr', 'www.vestel.com.tr', 'ele,ikt,isl,ulu,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (822, 'VİG MAKİNE SAN. VE TİC. LTD. ŞTİ.', 'KOCAELİ', 'u.uzunoglu@vigmakina.com', 'www.vigmakina.com', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (823, 'VİP DÖŞEMECİLİK MOB.SAN.TİC.LTD.ŞTİ.', 'ANKARA', 'vipmobilya@gmail.com', 'www.vipmobilya.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (824, 'YAKUPOĞLU TEKSTİL VE DERİ SAN. TİC. A.Ş.', 'ANKARA', '@yakupoglu.com.tr', 'www.yakupoglu.com.tr', 'end,mak,ikt,isl,sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (825, 'YAMANLAR LAMİNAT LTD. ŞTİ.', 'ANKARA', 'ariftezer@yahoo.com', '', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (826, 'YAPI KREDİ BANKASI A.Ş.', 'İSTANBUL', 'yesim.erdogan@yapikredi.com.tr', 'http://www.yapikredi.com.tr', 'isl,bil,end,mat,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (827, 'YENAR DÖKÜM SAN. VE TİC. A.Ş.', 'KONYA', 'omeryegin@yenkar.com.tr', 'www.yenar.com.tr', 'end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (828, 'YENMAK MOTOR GÖMLEK VE PİSTON A.Ş.', 'KONYA', 'muammerk@yenmak.com.tr', 'www.yenmak.com.tr', 'mak,end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (829, 'YEŞİLYURT DÖKÜM MAKİNA SANAYİ İNŞ.TİC. İTH.İHR.LTD.ŞTİ.', 'ANKARA', 'yesilyurt@yesilyurtdokum.com', 'www.yesilyurtdokum.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (830, 'YILDIZLAR İNŞ. VE TİC. A.Ş.', 'DİYARBAKIR', 'info@yildizlar.com', 'www.yildizlar.com', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (831, 'YİĞİT AKÜ MALZEMELERİ SANAYİ VE TİCARET A.Ş.', 'ANKARA', 'dileka@yigitbattery.com', 'www.yigitbattery.com', 'ele,end,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (832, 'YİĞİT SAĞLIK ARAÇ VE GEREÇLERİ İTH. İHR. PAZ. LTD. ŞTİ.', 'ANKARA', 'yusufyigit@yigitsaglik.com', 'www.yigitsaglik.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (833, 'YOZGAT BELEDİYE BAŞKANLIĞI', 'YOZGAT', 'ibmunal@hotmail.com', 'www.yozgat-bld.gov.tr/', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (834, 'YOZGAT TİCARET VE SANAYİ ODASI', 'YOZGAT', 'ziya.saydam@hotmail.com', '', 'ikt,ulu,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (835, 'YÖN DAY. TÜK. MAL. PAZ. SAN. TİC. A.Ş.', 'ANKARA', 'sivic@yonpazarlama.com', 'www.yonpazarlama.com', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (836, 'YÖNET YMM VE BAĞIMSIZ DENETİM A.Ş.', 'İSTANBUL', 'cavit.akyayla@yonet.com.tr', 'www.yonet.com.tr', 'ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (837, 'YUNUS EMRE ENSTİTÜSÜ', 'YURTDIŞI', 'iletisim@yunusemrevakfi.com.tr', 'www.yunusemrevakfi.com.tr', 'tde,tar,ikt', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (838, 'YÜCE BİLGİ SİSTEMLERİ YAZILIM VE EĞİTİM A.Ş', 'ANKARA', 'serkan@yuce.com.tr', 'www.yucebs.com', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (839, 'YÜKSEL İNŞAAT A.Ş.', 'ANKARA', 'skervancioglu@yuksel.net', 'http://www.yuksel.net', 'ikt,isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (840, 'YÜKSEL PROJE ULUSLARARASI A.Ş.', 'ANKARA', 'ahoroz@yukselproje.com.tr', 'www.yukselproje.com.tr', 'bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (841, 'YÜKSEL SAVUNMA SİSTEMLERİ A.Ş.', 'ANKARA', 'cakyurek@yukselsavunma.com', 'http://www.yukselsavunma.com/', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (842, 'YÜKSEL TOPRAK SAN. VE TİC. AŞ.', 'ÇORUM', 'info@yukselkiremit.com', 'www.yukselkiremit.com', 'isl', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (843, 'YÜKSEL YAPI ELEMANLARI SAN. VE TİC. A.Ş.', 'ANKARA', 'khekimoglu@yukselyapielemanlari.com', 'www.yukselboru.com', 'isl,mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (844, 'ZEBRANO MOBİLYA TAS. PAZ. İNŞ. TAAH. İTH. İHR. SAN. TİC. LTD. ŞTİ.', 'ANKARA', 'fatihafsar1@hotmail.com', 'www.zebranomobilya.com.tr', 'sat', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (845, 'ZEYSİ CAM İNŞ. SAN. VE TİC. LTD. ŞTİ.', 'ANKARA', 'info@zeysicam.com.tr', 'zeysicam.com.tr', 'end', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (846, 'ZORLUTEKS TEKSTİL SAN. VE TİC. A.Ş.', 'KIRKLARELİ', 'hulya.kocabas@zorlu.com', 'www.zorlu.com.', 'isl,bil', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (847, 'ZÜMRÜT CAM KUDRET GÖZÜAÇIK', 'DENİZLİ', 'export@zumrutcam.com.tr', 'www.zumrutcam.com.tr', 'mak', 0, 0, 0, 0, 1, '2011-10-18 15:19:32', '2011-10-18 15:19:32', 0);
INSERT INTO `oeds_firms` VALUES (848, 'FASON FIRMA', '', '', '', '', 0, 0, 0, 0, 14, '2011-10-20 12:22:39', '2011-10-20 12:22:39', 0);