<div id="container">
  <div id="title" class="firmTitle">
    <div class="titleLink">
      <a href="comment.php?s=write&firm_id=<?php echo $firm['id']; ?>">{değerlendirme yaz}</a>
    </div>
    <a href="comment.php?firm_id=<?php echo $firm['id']; ?>"><?php echo $firm['name']; ?></a>
    <?php
    if ($firm['id'] != 1) {
      if ($isFirmVoted) {
        $this->ActionButton->vote('vote.php?s=delete&firm_id='.$firm['id'], 'Vazgeç: '.$firm['vote_count'], 'Bu firmayı önermekten vazgeç');
      } else {
        $this->ActionButton->vote('vote.php?firm_id='.$firm['id'], 'Öner: '.$firm['vote_count'], 'Bu firmayı öner');
      }
    }
    ?>
  </div>
  <div id="content" class="firmContent">
    <div class="subContainer">
      <div class="subContent">
        <div class="qaContainer entryContainer">
          <div class="question">
            <a name="question<?php echo $question['id']; ?>"></a>
            <?php echo nl2br($question['question']); ?>
            <span class="actions qaActions">
              <?php
              if ($this->user && $this->user['id'] == $question['user_id']) {
                $this->ActionButton->myvote('Katılanlar: '.$question['vote_count'], 'Soruna katılanlar')
                                   ->delete('question.php?s=delete&id='.$question['id'], 'Sil', 'Bunu sil')
                                   ->edit('question.php?s=edit&id='.$question['id'], 'Düzenle', 'Bunu düzenle');
              } else {
                if (in_array($question['id'], $votedQuestionIds)) {
                  $this->ActionButton->vote('vote.php?s=delete&question_id='.$question['id'], 'Vazgeç: '.$question['vote_count'], 'Bu sorunun cevabını öğrenmekten vazgeç');
                } else {
                  $this->ActionButton->vote('vote.php?question_id='.$question['id'], 'Katıl: '.$question['vote_count'], 'Bu sorunun cevabını ben de merak ediyorum');
                }
              }
              ?>
            </span>
          </div>
          <?php if (count($question['answers']) > 0): ?>
          <div class="answers">
            <?php foreach ($question['answers'] as $a): ?>
            <div class="answer">
              <a name="answer<?php echo $a['id']; ?>"></a>
              <?php echo nl2br($a['answer']); ?>
              <span class="actions qaActions">
                <?php
                if ($this->user && $this->user['id'] == $a['user_id']) {
                  $this->ActionButton->myvote('Katılanlar: '.$a['vote_count'], 'Cevabınıza katılanlar')
                                     ->delete('answer.php?s=delete&id='.$a['id'], 'Sil', 'Bunu sil')
                                     ->edit('answer.php?s=edit&id='.$a['id'], 'Düzenle', 'Bunu düzenle');
                } else {
                  if (in_array($a['id'], $votedAnswerIds)) {
                    $this->ActionButton->vote('vote.php?s=delete&answer_id='.$a['id'], 'Vazgeç: '.$a['vote_count'], 'Cevaba katılmaktan vazgeç');
                  } else {
                    $this->ActionButton->vote('vote.php?answer_id='.$a['id'], 'Katıl: '.$a['vote_count'], 'Bu cevaba katıl');
                  }
                }
                ?>
              </span>
            </div>
            <?php endforeach; ?>
          </div>
          <?php endif; ?>
          <label for="answerAnswer">Cevap yaz:</label>
          <form action="answer.php?s=reply&question_id=<?php echo $question['id']; ?>" method="post">
            <textarea id="answerAnswer" class="inputTextarea qaTextarea" name="answer[answer]"></textarea>
            <input class="inputButton qaButton" type="submit" value="Gönder" />
          </form>
        </div>
      </div>
    </div>
  </div>
</div>