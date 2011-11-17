<div id="container">
  <div id="title">Şifremi Unuttum</div>
  <div id="content">
    <div class="form">
      <form action="register.php?s=forgot_password" method="post">
        <table class="formTable">
          <tr>
          	<td colspan="2">
              <div>
                <p>Yeni şifre için e-posta adresinizi yazın.</p>
                <p>Formu doldurduktan sonra e-posta adresinize şifrenizi değiştirebilmenizi sağlayacak bir link gönderilecektir.</p>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="forgotEmail">E-posta:</label>
              </div>
            </td>
            <td>
              <input id="forgotEmail" class="inputText" type="text" name="forgot[email]" value="<?php $this->UserForm->getField('email'); ?>" />
              <div class="emailHost">@etu.edu.tr</div>
              <?php $this->UserForm->errorFor('email'); ?>
            </td>
          </tr>
          <tr>
          	<td></td>
          	<td><input class="inputButton" type="submit" value="Gönder" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>