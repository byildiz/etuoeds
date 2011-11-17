<?php $link = sprintf('http://www.etuoeds.com/register.php?s=validate&email=%s&code=%s', $email, $user['code']); ?>
E-posta adresini doğrula:<br />
<a href="<?php echo $link; ?>"><?php echo $link; ?></a><br /><br />