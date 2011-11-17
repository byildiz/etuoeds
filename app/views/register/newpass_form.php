<div id="container">
  <div id="title">Şifre Tanımlama</div>
  <div id="content">
    <div class="form">
      <form action="register.php?s=newpass" method="post">
        <table class="formTable">
          <tr>
          	<td colspan="2">
              <div>
                <p>E-posta adresinin sana ait olduğunu doğruladın.</p>
                <p>Son olarak şifreni belirle ve kaydını tamamla.</p>
              </div>
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
              <?php $this->UserForm->errorFor('password'); ?>
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
              <?php $this->UserForm->errorFor('cpassword'); ?>
            </td>
          </tr>
          <tr>
          	<td></td>
          	<td><input class="inputButton" type="submit" value="Kaydet" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>