<?php
// Tuna Çağlar GÜMÜŞ
// 01 Ağustos 2011 18:56
?>
<div id="container">
  <div id="title"><?php echo $title; ?></div>
  <div id="content">
    <?php echo $this->part('../general/horizontal_tab.php'); ?>
    <div class="form">
      <form action="<?php echo $formAction; ?>" method="post">    
        <table class="formTable">
          <tr>
            <td><b><a href="comment.php?firm_id=<?php echo $firm['id']; ?>"><?php echo $firm['name']; ?></a></b> hakkında toplam <?php echo $firm['comment_count']; ?> değerlendirme yazılmış.</td>
          </tr>
          <tr>
            <td><textarea class="inputTextarea" name="comment[comment]" type="text" /><?php echo $this->CommentForm->getField('comment'); ?></textarea></td>
          </tr>
          <tr>
            <td><input class="inputButton" name="write" type="submit" value="Kaydet"/></td>
          </tr>
        </table>
      </form>
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
