<?php $link = sprintf('http://www.etuoeds.com/comment.php?s=view&id=%s', $comment['id']); ?>
<p><b><?php echo $comment['comment']; ?></b></p>
değerlendirmesi hakkındaki
<?php if ($review['vote_count'] > 1): ?>
yorumuna bir arkadaşın daha katıldı.
<?php else: ?>
yorumuna bir arkadaşın katıldı.
<?php endif; ?>
<br/><br/>
Yorumuna aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>