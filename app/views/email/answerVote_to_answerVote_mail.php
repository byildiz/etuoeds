<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
<p><b><?php echo $firm['name']; ?></b></p>
hakkında sorulan
<p><b><?php echo $question['question']; ?></b></p>
sorusuna yazdığın
<p><b><?php echo $answer['answer']; ?></b></p>
<?php if ($answer['vote_count'] > 1): ?>
cevabına bir arkadaşın daha katıldı.
<?php else: ?>
cevabına bir arkadaşın katıldı.
<?php endif; ?>
<br/><br/>
Cevabına aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>