<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
Ortak eğitim yaptığın
<p><b><?php echo $firm['name']; ?></b></p>
hakkında sorulan soru:
<p><b><?php echo $question['question']; ?></b></p>
Bu soruya aşağıdaki linkten cevap yazabilirsiniz:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />