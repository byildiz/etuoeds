<div id="container">
  <div id="title">Hesap Ayarları</div>
  <div id="content" class="settingsContent">
    <div class="subSpace"></div>
    <div class="subContainer">
    	<div class="subTitle">Hesaplar:</div>
    	<div class="subContent">
        <div class="form">
          <p class="settingsDarkInfo">
            ETÜOEDS hesabına ek olarak <b>twitter</b> ve <b>facebook</b> gibi
            sık kullandığın, şifresini unutma ihtimalinin az olduğu hesaplarınla
            ETÜOEDS'ye giriş yapabilmek için bu hesaplarını ETÜOEDS hesabınla
            eşleştirmen gerekmektedir.
          </p>
          <p class="settingsDarkInfo">
            Bunu yaparken <b>Oauth</b> protokolü kullanılmakta ve ETÜOEDS hiçbir
            şekilde bu hesapların kullanıcı adı ve şifre gibi gizli kalması
            gereken bilgilerine ulaşamamaktadır.
          </p>
          <p class="settingsDarkInfo">
            <a href="http://en.wikipedia.org/wiki/OAuth">Buradan</a> Oauth'un
            nasıl çalıştığını ve gizli bilgilerini nasıl koruduğunu
            öğrenebilirsin. 
          </p>
          <table class="formTable">
            <tr>
              <td class="label">
                <?php if ($twitterSynced): ?>
                <img class="twitterAccountButton" src="img/twitter_account.png" alt="Twitter Hesabı"/>
                <?php else: ?>
                <a href="settings.php?s=twitter_account">
                  <img class="twitterAccountButton" src="img/twitter_account.png" alt="Twitter Hesabı"/>
                </a>
                <?php endif; ?>
              </td>
              <td>
                <?php if ($twitterSynced): ?>
                <img class="okImg" src="img/ok.png" alt="Eşleştirilmiş" title="Eşleştirilmiş"/>
                <span class="okInfo">Twitter hesabın eşleştirilmiş.</span>
                <?php else: ?>
                <p class="settingsLightInfo">Twitter hesabınla ETÜOEDS'ye giriş yapmak için twitter hesabınla ETÜOEDS hesabını eşleştir.</p>
                <?php endif; ?>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="subContainer">
    	<div class="subTitle">E-posta:</div>
    	<div class="subContent">
        <div class="form settingsForm">
          <table class="formTable">
            <tr>
              <td class="label"><div style="color: #0C3F5C; font-weight: bold;">E-posta:</div></td>
              <td class="field"><b><?php echo $this->user['email'] ?></b></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="subContainer">
    	<div class="subTitle">Şifre:</div>
    	<div class="subContent">
        <div class="form settingsForm">
          <form action="settings.php?s=change_password" method="post">
            <table class="formTable">
              <tr>
                <td class="label">
                  <div class="formLabel">
                    <label for="passwordOpassword">Eski Şifre:</label>
                  </div>
                </td>
                <td class="field">
                  <input id="passwordOpassword" class="inputText" type="password" name="password[opassword]" />
                  <?php $this->UserForm->errorFor('opassword'); ?>
                </td>
              </tr>
              <tr>
                <td class="label">
                  <div class="formLabel">
                    <label for="passwordPassword">Yeni Şifre:</label>
                  </div>
                </td>
                <td class="field">
                  <input id="passwordPassword" class="inputText" type="password" name="password[password]" />
                  <?php $this->UserForm->errorFor('password'); ?>
                </td>
              </tr>
              <tr>
                <td class="label">
                  <div class="formLabel">
                    <label for="passwordCpassword">Tekrar Yeni Şifre:</label>
                  </div>
                </td>
                <td class="field">
                  <input id="passwordCpassword" class="inputText" type="password" name="password[cpassword]" />
                  <?php $this->UserForm->errorFor('cpassword'); ?>
                </td>
              </tr>
              <tr>
                <td class="label"></td>
                <td class="field"><input class="inputButton" type="submit" value="Kaydet" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
    </div>
    <div class="subContainer">
    	<div class="subTitle">Bildirimler:</div>
    	<div class="subContent">
        <div class="form settingsForm">
          Şu anda bildirim ayarları yapılamıyor!
          Ama yakında yapılabilecek...
        </div>
      </div>
    </div>
  </div>
</div>