<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!-- Bismillahirrahmanirrahim -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ETÜ OEDS {Ortak Eğitim Değerlendirme Sistemi}</title>
    <link rel="stylesheet" href="css/etuoeds.css" type="text/css" media="all" />
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
  </head>

  <body>
    <div id="page">
      <div id="header">
        <a href="<?php echo $this->Account->isLogedin() ? $this->Account->getLoginRedirect() : 'index.php'; ?>"><img src="img/yeni_logo.png" alt="ETÜ OEDS" border="0"/></a>
      </div>
      <div id="left">
        <?php if (!$this->Account->isLogedin()): ?>
        <div id="loginForm">
          <form action="login.php" method="post">
            <dl>
              <dt><label for="loginEmail">E-posta:</label></dt>
              <dd>
                <input id="loginEmail" class="inputText" type="text" name="login[email]" />
                <div class="emailHost">@etu.edu.tr</div>
              </dd>
              <dt><label for="loginPassword">Şifre:</label></dt>
              <dd><input id="loginPassword" class="inputText" type="password" name="login[password]" /></dd>
              <dd>
                <input type="hidden" name="login[rememberme]" value="0" />
                <input id="loginRememberme" class="inputCheck" type="checkbox" name="login[rememberme]" value="1" />
                <label for="loginRememberme">Beni hatırla</label>
              </dd>
              <dd>
                <input class="inputButton" type="submit" value="Giriş" />
                <a href="register.php">Yeniyim</a> |
                <a href="register.php?s=forgot_password">Şifrem neydi?</a>
              </dd>
            </dl>
          </form>
          <div class="oauthSeperator">
          	<div class="oauthLine"></div>
            <div class="oauthOrContainer">
              <span class="oauthOr">Veya</span>
            </div>
          </div>
          <div class="loginWithTwitter">
            <a href="login.php?s=twitter_login">
              <img src="img/twitter_login.png" alt="Twitter ile giriş" title="Twitter ile giriş"/>
            </a>
          </div>
        </div>
        <?php else: ?>
        <?php $user = $this->Account->getLogedinUser(); ?>
        <div class="leftContainer">
        	<div class="leftTitle">Hesabım</div>
        	<div class="userLinks">
            <?php if ($this->Account->isAdmin()): ?>
            <div class="userLink"><a href="admin.php">Yönetici Paneli</a></div>
            <?php endif; ?>
            <div class="userLink"><a href="profile.php">Sayfam</a> (<span style="color: #AAAAAA">Beta</span>)</div>
            <div class="userLink"><a href="settings.php">Ayarlar</a>, <a href="logout.php">Çıkış (<?php echo array_shift(split('@', $user['email'])); ?>)</a></div>
          </div>
        </div>
        <?php endif; ?>
        <div class="leftContainer">
          <div class="leftTitle">İşlemler</div>
          <div class="userLinks">
            <div class="userLink"><a href="comment.php?firm_id=1">O.E. Değerlendirmeleri</a></div>
            <div class="userLink"><a href="comment.php?s=write&firm_id=1">O.E. Değerlendir</a></div>
            <div class="userLink"><a href="question.php?s=ask&firm_id=1">O.E. Hakkında Soru Sor</a></div>
            <div class="userLink"><a href="comment.php">Firma Değerlendirmeleri</a></div>
            <div class="userLink"><a href="comment.php?s=select">Firmaları Değerlendir</a></div>
            <div class="userLink"><a href="question.php?s=select">Firmalar Hakkında Soru Sor</a></div>
          </div>
        </div>
        <?php if ($this->Account->isLogedin()): ?>
        <div class="leftContainer">
          <div class="leftTitle">Son 10 Değerlendirme</div>
          <div class="leftContent">
            <?php foreach ($this->lastComments as $c): ?>
            <div class="leftItem">
              <a href="comment.php?s=view&id=<?php echo $c['comment_id'] ?>"><?php echo $c['name']; ?></a>
            </div>
            <?php endforeach; ?>
            <div class="leftItem">
              <a class="underline" href="comment.php?select=commented">Devamı...</a>
            </div>
          </div>
        </div>
        <div class="leftContainer">
          <div class="leftTitle">Son 10 Soru</div>
          <div class="leftContent">
            <?php foreach ($this->lastQuestions as $q): ?>
            <div class="leftItem">
              <a href="answer.php?s=reply&question_id=<?php echo $q['question_id'] ?>"><?php echo $q['name']; ?></a>
            </div>
            <?php endforeach; ?>
            <div class="leftItem">
              <a class="underline" href="comment.php?select=asked">Devamı...</a>
            </div>
          </div>
        </div>
        <div class="leftContainer">
          <div class="leftTitle">Son 10 Cevap</div>
          <div class="leftContent">
            <?php foreach ($this->lastAnswers as $a): ?>
            <div class="leftItem">
              <a href="answer.php?s=reply&question_id=<?php echo $a['question_id'] ?>"><?php echo $a['firm_name']; ?></a>
            </div>
            <?php endforeach; ?>
          </div>
        </div>
        <?php endif; ?>
      </div>
      <?php echo $pageContent; ?>
      <div id="footer">
        ETÜ OEDS &copy; 2011
        <div class="footerMenu">
          <a href="pages.php?s=dev">Geliştiriciler</a> ·
          <a href="pages.php?s=purpose">Amaç</a> ·
          <a href="pages.php?s=tos">Kullanıcı Sözleşmesi</a> ·
          <a href="pages.php?s=about">Hakkımızda</a> ·
          <a href="pages.php?s=contact">İletişim</a>
        </div>
        <div class="yasalUyari">
          Bu sitedeki yazılardan yazarları sorumludur ve yazılar yalan yanlış olabilir.
          Yalan yanlış olduğunu düşündüğünüz yazıları iletişim bölümünden bize bildirebilirsiniz.
          Herhangi bir yazıdan kaynaklanmış veya kaynaklanabilecek her türlü hukuki işlemin
          muhatabı yazının yazarıdır. Yazılanlardan hiçbir şekilde site veya site yönetimi sorumlu tutulamaz.
          Kurumların isim hakları kurumlara aittir.
        </div>
      </div>
    </div>
    <?php if (!$this->Account->isAdmin()): ?>
    <!-- Google Analytics -->
    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-24935579-2']);
      _gaq.push(['_setDomainName', 'etuoeds.com']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
    <!-- End Google Analytics -->
    <!-- Piwik -->
    <script type="text/javascript">
      var pkBaseURL = (("https:" == document.location.protocol) ? "https://www.etuoeds.com/piwik/" : "http://www.etuoeds.com/piwik/");
      document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
      try {
        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
        piwikTracker.trackPageView();
        piwikTracker.enableLinkTracking();
      } catch( err ) {}
    </script>
    <!-- End Piwik -->
    <?php endif; ?>
  </body>

</html>
