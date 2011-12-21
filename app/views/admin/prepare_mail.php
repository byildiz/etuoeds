<div id="container">
  <div id="title">Mail Gönderme Sistemi</div>
  <div id="content">
    <?php if ($this->Message->has('Admin.Mail')): ?>
    <div class="formError"><?php echo $this->Message->get('Admin.Mail'); ?></div>
    <?php endif; ?>
    <div class="info">Priority hariç boş alan bırakma. Priority boş olabilir.</div>
    <form action="admin.php?s=prepare_mail" method="post">
      <table border="0" style="width: 100%;">
        <tr>
          <td>To:</td>
          <td><input class="inputText" type="text" name="to"/></td>
        </tr>
        <tr>
          <td></td>
          <td>
            <span style="color: red;">Örn:</span><br/>
            <ul>
            	<li>herekese mail => .*</li>
            	<li>2008 girişlilere => st08.*</li>
            </ul>
          </td>
        </tr>
        <tr>
          <td>Subject:</td>
          <td><input class="inputText" type="text" name="subject"/></td>
        </tr>
        <tr>
          <td>Body:</td>
          <td><textarea class="inputTextarea" style="width: 100%;" name="body" ></textarea></td>
        </tr>
        <tr>
          <td>Priority:</td>
          <td><input class="inputText" type="text" name="priority"/></td>
        </tr>
        <tr>
          <td></td>
          <td>
            <span style="color: red;">Örn:</span><br/>
            <ul>
            	<li>Acil => 0</li>
            	<li>Önemli => 1</li>
            	<li>Normal => 5</li>
            	<li>Bir ara gönder => 10</li>
              <li>Boş bırakırsan mail Normal olarak gönderilir.</li>
            </ul>
          </td>
        </tr>
        <tr>
          <td></td>
          <td><input class="inputButton" type="submit" value="Kaydet"/></td></td>
          <td></td>
        </tr>
      </table>
    </form>
  </div>
</div>