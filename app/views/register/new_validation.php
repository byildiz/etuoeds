<div id="container">
  <div id="title">Yeni Doğrulama E-postası</div>
  <div id="content">
    <div class="form">
      <form action="register.php?s=new_validation" method="post">
        <table class="formTable">
          <tr>
          	<td colspan="2">
              <div>
                <p>Yeni doğrulama linki için e-posta adresinizi yazın.</p>
                <p>Formu doldurduktan sonra doğrulama linkiniz e-posta adresinize gönderilecektir.</p>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="validationEmail">E-posta:</label>
              </div>
            </td>
            <td>
              <input id="validationEmail" class="inputText" type="text" name="validation[email]" value="<?php $this->UserForm->getField('email'); ?>" />
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