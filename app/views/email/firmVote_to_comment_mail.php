<?php $link = sprintf('http://www.etuoeds.com/comment.php?firm_id=%s', $firm['id']); ?>
Değerlendirme yazdığın
<p><b><?php echo $firm['name']; ?></b></p>
<?php if ($firm['vote_count'] > 1): ?>
firmasını bir arkadaşın daha önerdi.
<?php else: ?>
firmasını bir arkadaşın önerdi.
<?php endif; ?>
<br/><br/>
Firma sayfasına aşağıdaki linkten ulaşabilirsin:<br/>
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br/><br/>