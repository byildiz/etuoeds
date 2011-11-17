<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
<p><b><?php echo $question['question']; ?></b></p>
soruna yazılan
<p><b><?php echo $answer['answer']; ?></b></p>
<?php if ($answer['vote_count'] > 1): ?>
cevaba bir arkadaşın daha katıldı.
<?php else: ?>
cevaba bir arkadaşın katıldı.
<?php endif; ?>
<br/><br/>
Cevaba aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>