<div id="container">
  <div id="title">Kullanıcılar</div>
  <div id="content">
    <div class="info">
      Kayıtlı kullancı sayısı: <?php echo $userCount; ?>
      <table border="1" style="width: 100%">
        <tr>
          <th>E-posta</th>
          <th>Doğrulanmış</th>
          <th>Kayıt Tarihi</th>
          <th colspan="2">İşlemler</th>
        </tr>
        <?php foreach ($users as $u): ?>
        <tr>
          <td><?php echo $u['email']; ?></td>
          <td><?php echo $u['validated']; ?></td>
          <td><?php echo $u['created']; ?></td>
          <td><a href="admin.php?s=validate_user&user_id=<?php echo $u['id']; ?>">Doğrula</a></td>
          <td><a href="admin.php?s=send_validation&user_id=<?php echo $u['id']; ?>">Doğrulama gönder</a></td>
        </tr>
        <?php endforeach; ?>
      </table>
    </div>
  </div>
</div>