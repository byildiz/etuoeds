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
        <div class="entryContainer commentContainer">
          <a name="comment<?php echo $comment['id']; ?>"></a>
          <div class="commentInfo">tarih: <?php echo mysql2date($comment['created']); ?></div>
          <div class="commentTitle">
            Değerlendirme
            <span class="actions commentActions">
              <?php
              if ($this->user && $this->user['id'] == $comment['user_id']) {
                $this->ActionButton->myvote('Katılanlar: '.$comment['vote_count'], 'Değerlendirmene katılanlar')
                                   ->delete('comment.php?s=delete&id='.$comment['id'], 'Sil', 'Bunu sil')
                                   ->edit('comment.php?s=edit&id='.$comment['id'], 'Düzenle', 'Bunu düzenle');
              } else {
                if (in_array($comment['id'], $votedCommentIds)) {
                  $this->ActionButton->vote('vote.php?s=delete&comment_id='.$comment['id'], 'Vazgeç: '.$comment['vote_count'], 'Bu değerlendirmeye katılmaktan vazgeç');
                } else {
                  $this->ActionButton->vote('vote.php?comment_id='.$comment['id'], 'Katıl: '.$comment['vote_count'], 'Bu değerlendirmeye katıl');
                }
              }
              ?>
            </span>
          </div>
          <div class="commentContent">
            <?php echo nl2br($comment['comment']); ?>
          </div>
          <div class="reviews">
            <?php if ($comment['review_count'] > 0): ?>
            <?php foreach ($comment['reviews'] as $r): ?>
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
                    if (in_array($comment['id'], $votedCommentIds)) {
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
            <label for="reviewText<?php echo $comment['id']; ?>">Yorum yaz:</label>
            <form action="comment.php?s=add_review&firm_id=<?php echo $firm['id']; ?>&comment_id=<?php echo $comment['id']; ?>" method="post">
              <textarea id="reviewText<?php echo $comment['id']; ?>" class="inputTextarea reviewTextarea" name="review[text]"></textarea>
              <input class="inputButton qaButton" type="submit" value="Gönder" />
            </form>
          </div>
        </div>
        <div class="seperator"></div>
        <a name="ask"></a>
        <div class="qaContainer entryContainer">
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