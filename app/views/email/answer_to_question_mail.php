<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
<p><b><?php echo $firm['name']; ?></b></p>
hakkında sorduğun
<p><b><?php echo $question['question']; ?></b></p>
sorusuna verilen cevaba aşağıdaki linkten ulaşabilirsin:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />