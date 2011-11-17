<div id="container">
  <div id="title">Giriş</div>
  <div id="content">
    <div class="form">
      <form action="login.php" method="post">
        <table class="formTable">
          <?php if ($this->Message->has('authError')): ?>
          <tr>
          	<td colspan="2">
              <div class="authError">
                <?php echo $this->Message->get('authError'); ?>
              </div>
            </td>
          </tr>
          <?php endif; ?>
          <tr>
            <td>
              <div class="formLabel">
                <label for="loginEmail">E-posta:</label>
              </div>
            </td>
            <td>
              <input id="loginEmail" class="inputText" type="text" name="login[email]" value="<?php $this->UserForm->getField('email'); ?>" />
              <div class="emailHost">@etu.edu.tr</div>
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="loginEmail">Şifre:</label>
              </div>
            </td>
            <td>
              <input id="loginPassword" class="inputText" type="password" name="login[password]" />
            </td>
          </tr>
          <tr>
          	<td></td>
          	<td style="vertical-align: middle;">
              <input type="hidden" name="login[rememberme]" value="0" />
              <input id="loginRememberme" class="inputCheck" type="checkbox" name="login[rememberme]" value="1" />
              <label for="loginRememberme">Beni hatırla</label>
            </td>
          </tr>
          <?php if ($this->Message->has('loginError')): ?>
          <tr>
          	<td></td>
            <td><div class="loginError"><?php echo $this->Message->get('loginError'); ?></div></td>
          </tr>
          <?php endif; ?>
          <tr>
          	<td></td>
          	<td>
              <input class="inputButton" type="submit" value="Giriş" />
              <a href="register.php">Ben yeniyim</a> |
              <a href="register.php?s=forgot_password">Şifrem neydi?</a>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>