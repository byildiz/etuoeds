<div id="container">
  <div id="title">Sistem kayıtları</div>
  <div id="content">
    <div class="info">
      <?php if (count($logs) == 0): ?>
        Hiç sistem kaydı yok.
      <?php else: ?>
      <?php foreach ($logs as $i => $l): ?>
      <ul>
      	<li>[<?php echo $l['created']; ?>] [<?php echo $l['type']; ?>] <?php echo $l['message']; ?></li>
      </ul>
      <?php endforeach; ?>
      <?php endif; ?>
    </div>
  </div>
</div>