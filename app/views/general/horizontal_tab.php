<?php if (is_array($tabs)): ?>
<div id="horTab">
  <?php foreach ($tabs as $t): ?>
  <span class="horTabElem<?php echo ($t['name'] == $this->app->actionName) ? ' horTabElemSelected' : ''; ?>"><a href="<?php echo $t['link']; ?>"><?php echo $t['label']; ?></a></span>
  <?php endforeach; ?>
</div>
<?php endif; ?>
