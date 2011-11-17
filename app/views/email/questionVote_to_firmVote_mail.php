<?php $link = sprintf('http://www.etuoeds.com/answer.php?s=reply&question_id=%s', $question['id']); ?>
Önerdiğin
<p><b><?php echo $firm['name']; ?></b></p>
hakkında sorulan
<p><b><?php echo $question['question']; ?></b></p>
sorusunun cevabını bir arkadaşın daha merak ediyor.
<br/><br/>
Bu soruya aşağıdaki linkten cevap yazabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>
Eğer bu soruya önceden cevap yazdıysan bu e-postayı hemen sil :)<br/><br/>