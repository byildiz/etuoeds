<div id="container">
  <div id="title">Sayfam - <?php echo $this->user['email']; ?></div>
  <div id="content" class="profileContent">
    <?php echo $this->part('../general/horizontal_tab.php'); ?>
    <?php if (count($myEntries) == 0): ?>
    <div class="info">
      Sayfanda gösterilecek herhangi bir eylemin yok.
      <div class="seperator"></div>
      <p><b>Hemen şimdi yapabileceklerin:</b></p>
      <ul>
      	<li><a href="comment.php?s=write&firm_id=1"><b>Ortak eğitim sistemi</b></a> hakkında değerlendirme yazabilirsin,</li>
        <li>veya ortak eğitim yaptığın <a href="comment.php?s=write"><b>firmalar</b></a> hakkında değerlendirme yazabilirsin,</li>
        <li>veya ortak eğitim firmaları hakkında <a href="question.php?s=select"><b>soru</b></a> sorabilirsin,</li>
        <li>veya arkadaşlarının firmalar hakkında yazdığı <a href="comment.php"><b>değerlendirmeleri</b></a> okuyabilirsin.</li>
      </ul>
    </div>
    <?php else: ?>
    <div class="seperator"></div>
    <?php foreach ($myEntries as $e): ?>
    <?php if (isset($e['comment'])): // DEĞERLENDİRME ?>
    <div class="subContainer">
    	<div class="subTitle profileSubTitle"><b><?php echo $e['firm']['name']; ?></b> hakkındaki değerlendirmen:</div>
    	<div class="subContent">
        <div class="entryContainer commentContainer">
          <a name="comment<?php echo $e['id']; ?>"></a>
          <div class="commentInfo">tarih: <?php echo mysql2date($e['created']); ?></div>
          <div class="commentTitle profileFontSize">
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
        </div>
        <div class="entryFooter"><b><?php echo $e['firm']['name']; ?></b> hakkındaki <a class="underline" href="comment.php?firm_id=<?php echo $e['firm']['id']; ?>">tüm değerlendirmeler, sorular ve cevaplar</a></div>
      </div>
    </div>
    <?php elseif (isset($e['question'])): // SORU VEYA CEVAP?>
    <div class="subContainer">
      <?php if (isset($e['isAnswer'])): ?>
      <div class="subTitle profileSubTitle"><b><?php echo $e['firm']['name']; ?></b> hakkındaki soruya verdiğin cevap:</div>
      <?php else: ?>
    	<div class="subTitle profileSubTitle"><b><?php echo $e['firm']['name']; ?></b> hakkındaki sorun:</div>
      <?php endif; ?>
    	<div class="subContent">
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
          <?php if (count($e['answers']) > 0): ?>
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
                  if (in_array($e['id'], $votedAnswerIds)) {
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
          <label for="answerAnswer">Cevap yaz:</label>
          <form action="answer.php?s=reply&question_id=<?php echo $e['id']; ?>" method="post">
            <textarea id="answerAnswer" class="inputTextarea qaTextarea" name="answer[answer]"></textarea>
            <input class="inputButton qaButton" type="submit" value="Gönder" />
          </form>
        </div>
        <div class="entryFooter"><b><?php echo $e['firm']['name']; ?></b> hakkındaki <a class="underline" href="comment.php?firm_id=<?php echo $e['firm']['id']; ?>">tüm değerlendirmeler, sorular ve cevaplar</a></div>
      </div>
    </div>
    <?php elseif (isset($e['object_name'])): // OY ?>
    <div class="subContainer">
      <?php if ($e['object_name'] == 'firm'): ?>
      <div class="subTitle profileSubTitle">Firma önerin:</div>
      <div class="subContent">
        <div class="entryContainer">
          <div class="entryContent">
            <b>"<?php echo $e['object']['name']; ?>"</b> firmasını önerdin.
            <?php $this->ActionButton->vote('vote.php?s=delete&'.$e['object_name'].'_id='.$e['object']['id'], 'Vazgeç: '.$e['object']['vote_count'], 'Bu firmayı önermekten vazgeç'); ?>
          </div>
        </div>
        <div class="entryFooter">Bu firma hakkındaki <a class="underline" href="comment.php?firm_id=<?php echo $e['object']['id']; ?>">tüm değerlendirmeler, sorular ve cevaplar</a></div>
      </div>
      <?php elseif ($e['object_name'] == 'question'): ?>
      <div class="subTitle profileSubTitle">Cevabını öğrenmek istediğin soru:</div>
      <div class="subContent">
        <div class="entryContainer">
          <div class="entryContent">
            <b>"<?php echo $e['object']['question']; ?>"</b> sorusunun cevabını sen de öğrenmek istedin.
            <?php $this->ActionButton->vote('vote.php?s=delete&'.$e['object']['name'].'_id='.$e['object']['id'], 'Vazgeç: '.$e['object']['vote_count'], 'Bu sorunun cevabını öğrenmekten vazgeç'); ?>
          </div>
        </div>
      </div>
      <?php elseif ($e['object_name'] == 'answer'): ?>
      <div class="subTitle profileSubTitle">Katıldığın cevap:</div>
      <div class="subContent">
        <div class="entryContainer">
          <div class="entryContent">
            <b>"<?php echo $e['object']['answer']; ?>"</b> cevabına katıldın.
            <?php $this->ActionButton->vote('vote.php?s=delete&'.$e['object_name'].'_id='.$e['object']['id'], 'Vazgeç: '.$e['object']['vote_count'], 'Cevaba katılmaktan vazgeç'); ?>
          </div>
        </div>
      </div>
      <?php elseif ($e['object_name'] == 'comment'): ?>
      <div class="subTitle profileSubTitle">Katıldığın değerlendirme:</div>
      <div class="subContent">
        <div class="entryContainer commentContainer">
          <a name="comment<?php echo $e['object']['id']; ?>"></a>
          <div class="commentInfo">tarih: <?php echo mysql2date($e['object']['created']); ?></div>
          <div class="commentTitle profileFontSize">
            <span class="actions commentActions">
              <?php
              if ($this->user && $this->user['id'] == $e['object']['user_id']) {
                $this->ActionButton->myvote('Katılanlar: '.$e['object']['vote_count'], 'Değerlendirmene katılanlar')
                                   ->delete('comment.php?s=delete&id='.$e['object']['id'], 'Sil', 'Bunu sil')
                                   ->edit('comment.php?s=edit&id='.$e['object']['id'], 'Düzenle', 'Bunu düzenle');
              } else {
                if (in_array($e['object']['id'], $votedCommentIds)) {
                  $this->ActionButton->vote('vote.php?s=delete&comment_id='.$e['object']['id'], 'Vazgeç: '.$e['object']['vote_count'], 'Bu değerlendirmeye katılmaktan vazgeç');
                } else {
                  $this->ActionButton->vote('vote.php?comment_id='.$e['object']['id'], 'Katıl: '.$e['object']['vote_count'], 'Bu değerlendirmeye katıl');
                }
              }
              ?>
            </span>
          </div>
          <div class="commentContent">
            <?php echo nl2br($e['object']['comment']); ?>
          </div>
        </div>
      </div>
      <?php endif; ?>
    </div>
    <?php endif; ?>
    <div class="entrySeperator"></div>
    <?php endforeach; ?>
    <?php endif; ?>
  </div>
</div>
