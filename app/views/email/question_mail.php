<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
Değerlendirme yazdığın <b><?php echo $firm['name']; ?></b> hakkında sorulan soru:<br /><br />
<b><?php echo $question['question']; ?></b><br /><br />
Bu soruya aşağıdaki linkten cevap yazabilirsiniz:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />