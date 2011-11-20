<div id="container">
  <div id="title"><a href="comment.php?firm_id=<?php echo $firm['id']; ?>"><?php echo $firm['name']; ?></a></div>
  <div id="content">
    <?php echo $this->part('../general/horizontal_tab.php'); ?>
    <div class="qaContainer entryContainer askContainer">
      <label for="questionQuestion"><?php echo $title; ?></label>
      <form action="<?php echo $formAction; ?>" method="post">
        <textarea id="questionQuestion" class="inputTextarea qaTextarea" name="question[question]"><?php echo $this->QuestionForm->getField('question'); ?></textarea>
        <input class="inputButton qaButton" type="submit" value="Kaydet" />
      </form>
    </div>
    <?php if (isset($questions) && count($questions) > 0): ?>
    <div class="subContainer">
      <div class="subTitle">Önceden Sorulanlar</div>
      <div class="subContent">
        <?php foreach ($questions as $q): ?>
        <div class="qaContainer entryContainer"><?php echo nl2br($q['question']); ?></div>
        <?php endforeach; ?>
      </div>
    </div>
    <?php endif; ?>
  </div>
</div>