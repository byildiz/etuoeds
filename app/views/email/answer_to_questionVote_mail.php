<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
Cevabını merak ettiğiniz
<p><b><?php echo $firm['name']; ?></b></p>
hakkında sorulan
<p><b><?php echo $question['question']; ?></b></p>
sorusuna verilen cevaba aşağıdaki linkten ulaşabilirsin:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />