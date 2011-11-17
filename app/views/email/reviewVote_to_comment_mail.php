<?php $link = sprintf('http://www.etuoeds.com/comment.php?s=view&id=%s', $comment['id']); ?>
<p><b><?php echo $comment['comment']; ?></b></p>
değerlendirmene yapılan
<?php if ($review['vote_count'] > 1): ?>
yoruma bir arkadaşın daha katıldı.
<?php else: ?>
yoruma bir arkadaşın katıldı.
<?php endif; ?>
<br/><br/>
Yoruma aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>