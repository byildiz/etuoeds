<?php $link = sprintf('http://www.etuoeds.com/comment.php?s=view&id=%s', $comment['id']); ?>
Ortak eğitim yaptığın
<p><b><?php echo $firm['name']; ?></b></p>
hakkındaki
<?php if ($comment['vote_count'] > 1): ?>
değerlendirmeye bir arkadaşın daha katıldı.
<?php else: ?>
değerlendirmene bir arkadaşın katıldı.
<?php endif; ?>
<br/><br/>
Değerlendirmeye aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>