<div id="container">
  <div id="title">Hoşgeldiniz</div>
  <div id="content">
    <div class="info">
      <p>Bu site ortak eğitim yaptığımız firmaları ve ortak eğitim sistemini
      değerlendirmek için kurulmuştur.</p>
      <p>Ortak eğitim için firma belirlenmede bizlere yardımcı olacak bu site
      aynı zamanda ortak eğitim sistemindeki eksikliklerin giderilmesinde de
      faydalı olacaktır.</p>
      <p>Kayıt için aşağıdaki formu doldurmanız yeterlidir.</p>
      <div class="form">
        <form action="register.php" method="post">
          <table class="formTable">
            <tr>
              <td>
                <div class="formLabel">
                  <label for="registerEmail">E-posta:</label>
                </div>
              </td>
              <td>
                <input id="registerEmail" class="inputText" type="text" name="register[email]" value="" />
                <div class="emailHost">@etu.edu.tr</div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="formLabel">
                  <label for="registerPassword">Şifre:</label>
                </div>
              </td>
              <td>
                <input id="registerPassword" class="inputText" type="password" name="register[password]" />
              </td>
            </tr>
            <tr>
              <td>
                <div class="formLabel">
                  <label for="registerPassword">Şifre Tekrar:</label>
                </div>
              </td>
              <td>
                <input id="registerPassword" class="inputText" type="password" name="register[cpassword]" />
              </td>
            </tr>
            <tr>
              <td></td>
              <td>
                <input type="hidden" name="register[tos]" value="0" />
                <input id="registerTos" class="inputCheck" type="checkbox" name="register[tos]" value="1" />
                <label for="registerTos"><a href="pages.php?s=tos" target="_blank">Kullanıcı sözleşmesi</a>ni okudum ve kabul ediyorum.</label>
              </td>
            </tr>
            <tr>
              <td></td>
              <td><input class="inputButton" type="submit" value="Kaydol" /></td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>