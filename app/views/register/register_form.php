<div id="container">
  <div id="title">Kayıt</div>
  <div id="content">
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
              <input id="registerEmail" class="inputText" type="text" name="register[email]" value="<?php $this->UserForm->getField('email'); ?>" />
              <div class="emailHost">@etu.edu.tr</div>
              <?php $this->UserForm->errorFor('email'); ?>
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
                <label for="registerCpassword">Şifre Tekrar:</label>
              </div>
            </td>
            <td>
              <input id="registerCpassword" class="inputText" type="password" name="register[cpassword]" />
              <?php $this->UserForm->errorFor('cpassword'); ?>
            </td>
          </tr>
          <tr>
          	<td></td>
          	<td>
              <input type="hidden" name="register[tos]" value="0" />
              <input id="registerTos" class="inputCheck" type="checkbox" name="register[tos]" value="1" />
              <label for="registerTos"><a href="pages.php?s=tos" target="_blank">Kullanıcı sözleşmesi</a>ni okudum ve kabul ediyorum.</label>
              <?php $this->UserForm->errorFor('tos'); ?>
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