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
        <?php if (count($entries) == 0): ?>
        <div class="info">Bu firma hakkında hiç değerlendirme yazılmamış ve soru sorulmamış.</div>
        <?php else: ?>
        <?php foreach ($entries as $i => $e): ?>
        <?php if (!isset($e['question'])): ?>
        <div class="entryContainer commentContainer">
          <a name="comment<?php echo $e['id']; ?>"></a>
          <div class="commentInfo">tarih: <?php echo mysql2date($e['created']); ?></div>
          <div class="commentTitle">
            <?php echo $commentCount--; ?>. değerlendirme
            <span class="actions commentActions">
              <?php
              if ($this->user && $this->user['id'] == $e['user_id']) {
                $this->ActionButton->myvote('Katılanlar: '.$e['vote_count'], 'Değerlendirmene katılanlar')
                                   ->delete('comment.php?s=delete&id='.$e['id'], 'Sil', 'Bunu sil')
                                   ->edit('comment.php?s=edit&id='.$e['id'], 'Düzenle', 'Bunu düzenle');
              } else {
                if (in_array($e['id'], $votedCommentIds)) {
                  $this->ActionButton->vote('vote.php?s=delete&comment_id='.$e['id'], 'Vazgeç: '.$e['vote_count'], 'Bu değerlendirmeye katılmaktan vazgeç');
                } else {
                  $this->ActionButton->vote('vote.php?comment_id='.$e['id'], 'Katıl: '.$e['vote_count'], 'Bu değerlendirmeye katıl');
                }
              }
              ?>
            </span>
          </div>
          <div class="commentContent">
            <?php echo nl2br($e['comment']); ?>
          </div>
          <div class="reviews">
            <?php if ($e['review_count'] > 0): ?>
            <?php foreach ($e['reviews'] as $r): ?>
            <div class="reviewContent">
              <div class="review">
                <?php echo nl2br($r['comment']); ?>
                <span class="actions qaActions">
                  <?php
                  if ($this->user && $this->user['id'] == $r['user_id']) {
                    $this->ActionButton->myvote('Katılanlar: '.$r['vote_count'], 'Yorumuna katılanlar')
                                       ->delete('comment.php?s=delete_review&id='.$r['id'], 'Sil', 'Yorumunu sil')
                                       ->edit('comment.php?s=edit_review&id='.$r['id'], 'Düzenle', 'Yorumunu düzenle');
                  } else {
                    if (in_array($e['id'], $votedQuestionIds)) {
                      $this->ActionButton->vote('vote.php?s=delete&comment_id='.$r['id'], 'Vazgeç: '.$r['vote_count'], 'Bu yoruma katılmaktan vazgeç');
                    } else {
                      $this->ActionButton->vote('vote.php?comment_id='.$r['id'], 'Katıl: '.$r['vote_count'], 'Bu yoruma katıl');
                    }
                  }
                  ?>
                </span>
              </div>
            </div>
            <?php endforeach; ?>
            <?php endif; ?>
            <label for="reviewText<?php echo $e['id']; ?>">Yorum yaz:</label>
            <form action="comment.php?s=add_review&firm_id=<?php echo $firm['id']; ?>&comment_id=<?php echo $e['id']; ?>" method="post">
              <textarea id="reviewText<?php echo $e['id']; ?>" class="inputTextarea reviewTextarea" name="review[text]"></textarea>
              <input class="inputButton qaButton" type="submit" value="Gönder" />
            </form>
          </div>
        </div>
        <?php else: ?>
        <div class="entryContainer qaContainer">
          <div class="question">
            <a name="question<?php echo $e['id']; ?>"></a>
            <?php echo nl2br($e['question']); ?>
            <span class="actions qaActions">
              <?php
              if ($this->user && $this->user['id'] == $e['user_id']) {
                $this->ActionButton->myvote('Katılanlar: '.$e['vote_count'], 'Soruna katılanlar')
                                   ->delete('question.php?s=delete&id='.$e['id'], 'Sil', 'Bunu sil')
                                   ->edit('question.php?s=edit&id='.$e['id'], 'Düzenle', 'Bunu düzenle');
              } else {
                if (in_array($e['id'], $votedQuestionIds)) {
                  $this->ActionButton->vote('vote.php?s=delete&question_id='.$e['id'], 'Vazgeç: '.$e['vote_count'], 'Bu sorunun cevabını öğrenmekten vazgeç');
                } else {
                  $this->ActionButton->vote('vote.php?question_id='.$e['id'], 'Katıl: '.$e['vote_count'], 'Bu sorunun cevabını ben de merak ediyorum');
                }
              }
              ?>
            </span>
          </div>
          <?php if ($e['answer_count'] > 0): ?>
          <div class="answers">
            <?php foreach ($e['answers'] as $a): ?>
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
                    $this->ActionButton->vote('vote.php?question_id='.$a['id'], 'Katıl: '.$a['vote_count'], 'Bu cevaba katıl');
                  }
                }
                ?>
              </span>
            </div>
            <?php endforeach; ?>
          </div>
          <?php endif; ?>
          <label for="answerAnswer<?php echo $e['id']; ?>">Cevap yaz:</label>
          <form action="answer.php?s=reply&question_id=<?php echo $e['id']; ?>" method="post">
            <textarea id="answerAnswer<?php echo $e['id']; ?>" class="inputTextarea qaTextarea" name="answer[answer]"></textarea>
            <input class="inputButton qaButton" type="submit" value="Gönder" />
          </form>
        </div>
        <div class="seperator"></div>
        <?php endif; ?>
        <?php endforeach; ?>
        <?php endif; ?>
        <a name="newcomment"></a>
        <div class="entryContainer commentContainer">
          <label for="commentComment">Değerlendirme yaz:</label>
          <form action="comment.php?s=write&firm_id=<?php echo $firm['id']; ?>" method="post">
            <textarea id="commentComment" class="inputTextarea commentTextarea" name="comment[comment]"></textarea>
            <input class="inputButton qaButton" type="submit" value="Gönder" />
          </form>
        </div>
        <div class="seperator"></div>
        <a name="ask"></a>
        <div class="entryContainer qaContainer">
          <label for="questionQuestion">Soru sor:</label>
          <form action="question.php?s=ask&firm_id=<?php echo $firm['id']; ?>" method="post">
            <textarea id="questionQuestion" class="inputTextarea qaTextarea" name="question[question]"></textarea>
            <input class="inputButton qaButton" type="submit" value="Gönder" />
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
