<div id="container">
  <div id="title"><a href="comment.php?firm_id=<?php echo $firm['id']; ?>"><?php echo $firm['name']; ?></a></div>
  <div id="content">
    <div class="qaContainer entryContainer askContainer">
      <label for="answerAnswer"><?php echo $question['question']; ?></label>
      <form action="<?php echo $formAction; ?>" method="post">
        <textarea id="answerAnswer" class="inputTextarea qaTextarea" name="answer[answer]"><?php echo $this->AnswerForm->getField('answer'); ?></textarea>
        <input class="inputButton qaButton" type="submit" value="Kaydet" />
      </form>
    </div>
  </div>
</div>