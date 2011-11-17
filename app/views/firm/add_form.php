<?php
// Tuna Çağlar GÜMÜŞ
// 30 Temmuz 2011 18:56
?>
<div id="container">
  <div id="title">Firma Ekle</div>
  <div id="content">
    <div class="form">
      <form action="firm.php?s=add" method="post">
        <table class="formTable">
          <tr>
            <td>
              <div class="formLabel">
                <label for="firmName">Firma Adı:</label>
              </div>
            </td>
            <td>
              <input id="firmName" class="inputText" type="text" name="firm[name]" value="<?php echo $this->FirmForm->getField('name'); ?>" />
              <?php $this->FirmForm->errorFor('name'); ?>
            </td>
          </tr>
          <tr>
          	<td></td>
          	<td><input class="inputButton" type="submit" value="Ekle" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>