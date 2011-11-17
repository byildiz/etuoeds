<?php $link = sprintf('http://www.etuoeds.com/comment.php?s=view&id=%s', $comment['id']); ?>
<p><b><?php echo $firm['name']; ?></b></p>
hakkında yazdığın
<p><b><?php echo $comment['comment']; ?></b></p>
değerlendirmesine yapılan yoruma aşağıdaki linkten ulaşabilirsin:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />