<div id="container">
  <div id="title">Hata</div>
  <div id="content">
    <div class="info">
      <?php if ($this->Message->has('authError')): ?>
      <div class="authError">
        <?php echo $this->Message->get('authError'); ?>
      </div>
      <?php else: ?>
      Niye girdin bu sayfaya anlamadım
      <?php endif; ?>
    </div>
  </div>
</div>