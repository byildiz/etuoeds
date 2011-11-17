<?php $link = sprintf('http://www.etuoeds.com/comment.php?s=view&id=%s', $comment['id']); ?>
Katıldığın
<p><b><?php echo $review['comment']; ?></b></p>
<?php if ($review['vote_count'] > 1): ?>
yorumuna bir arkadaşın daha katıldı.
<?php else: ?>
yorumuna bir arkadaşın katıldı.
<?php endif; ?>
<br/><br/>
Yoruma aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>