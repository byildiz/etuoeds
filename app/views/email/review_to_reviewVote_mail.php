<?php $link = sprintf('http://www.etuoeds.com/comment.php?s=view&id=%s', $comment['id']); ?>
Yorumuna katıldığın
<p><b><?php echo $firm['name']; ?></b></p>
hakkında yazılan
<p><b><?php echo $comment['comment']; ?></b></p>
değerlendirmesine yapılan yeni yoruma aşağıdaki linkten ulaşabilirsin:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />