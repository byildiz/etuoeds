<?php
// Tuna Çağlar GÜMÜŞ
// 01 Ağustos 2011 18:56
?>
<div id="container">
  <div id="title"><?php echo $title; ?></div>
  <div id="content">
    <div class="subContainer">
    	<div class="subContent">
        <div class="seperator"></div>
        <label>Değerlendirme:</label>
        <div class="entryContainer commentContainer">
          <?php echo $parent['comment']; ?>
        </div>
      </div>
    </div>
    <div class="subContainer">
    	<div class="subContent">
        <form action="<?php echo $formAction; ?>" method="post">    
        <table class="formTable">
          <tr>
            <td><label for="reviewComment">Yorumun:</label></td>
          </tr>
          <tr>
            <td><textarea id="reviewComment" class="inputTextarea" name="review[comment]" type="text" /><?php echo $this->CommentForm->getField('comment'); ?></textarea></td>
          </tr>
          <tr>
            <td><input class="inputButton" name="write" type="submit" value="Kaydet"/></td>
          </tr>
        </table>
      </form>
      </div>
    </div>
    <?php if (isset($comments) && count($comments) > 0): ?>
    <div class="subContainer">
      <div class="subTitle">Önceden Yazılanlar</div>
      <div class="subContent">
        <?php foreach ($comments as $c): ?>
        <div class="commentContainer entryContainer"><?php echo nl2br($c['comment']); ?></div>
        <?php endforeach; ?>
      </div>
    </div>
    <?php endif; ?>
  </div>
</div>
