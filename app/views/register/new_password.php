<div id="container">
  <div id="title">Yeni Şifre Belirleme</div>
  <div id="content">
    <div class="form">
      <form action="register.php?s=new_password" method="post">
        <table class="formTable">
          <tr>
          	<td colspan="2">
              <div>
                <p>Yeni şifrenizi belirlemek için aşağıdaki formu doldurunuz.</p>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="passwordPassword">Şifre:</label>
              </div>
            </td>
            <td>
              <input id="passwordPassword" class="inputText" type="password" name="password[password]" />
              <?php $this->UserForm->errorFor('password'); ?>
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="passwordCpassword">Şifre Tekrar:</label>
              </div>
            </td>
            <td>
              <input id="passwordCpassword" class="inputText" type="password" name="password[cpassword]" />
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