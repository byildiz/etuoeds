<?php
// Tuna Çağlar GÜMÜŞ
// 30 Temmuz 2011 18:56
?>
<div id="container">
  <div id="title">Değerlendirmek için Firma Seç</div>
  <div id="content">
    <div class="form">
      <form action="comment.php?s=select" method="post">    
        <table class="formTable">
          <tr>
            <td>
              <div class="formLabel">
                <label for="firmName">Firma:</label>
              </div>
            </td>
            <td>
              <select id="firmName" class="inputSelect" name="firm[id]">
                <?php foreach ($firms as $f): ?> 
                <option value="<?php echo $f['id']; ?>"><?php echo $f['name']; ?></option>
                <?php endforeach; ?>
              </select>
            </td>
          </tr>
          <tr>
            <td></td>
            <td><input class="inputButton" type="submit" value="Değerlendirme Yaz"/></td>
          </tr>
          <tr>
            <td></td>
            <td>Firma listede yoksa <a href="firm.php?s=add">buradan</a> ekle</td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>