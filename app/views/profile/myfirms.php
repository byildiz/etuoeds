<div id="container">
  <div id="title">Sayfam - <?php echo $this->user['email']; ?></div>
  <div id="content">
    <?php echo $this->part('../general/horizontal_tab.php'); ?>
    <div class="seperator"></div>
    <form action="firm.php?s=update_match" method="post">
      <div class="subContainer">
        <div class="subTitle">Ortak Eğitim Yaptığım veya Yapıyor Olduğum Firmalar:</div>
        <div class="subContent">
          <ol id="historyList" class="myfirmList">
            <?php foreach ($histories as $f): ?>
            <li>
              <a class="firmNameLink" href="comment.php?firm_id=<?php echo $f['id']; ?>"><?php echo $f['name']; ?></a>
              <span class="action delete">
                <a title="Bunu sil" onclick="if(this.innerHTML=='Silinsin mi?')deleteHistory(this.parentNode.parentNode, <?php echo $f['id']; ?>);else this.innerHTML='Silinsin mi?';return false;">Sil</a>
              </span>
            </li>
            <?php endforeach; ?>
            <li id="historyForm">
              <input id="historyName" class="inputText" type="text" name="historyName" placeholder="Yeni ekle"  autocomplete="off"/>
              <div id="historyFirms" class="autoCompleteList">
                <div style="padding: 3px 0;">Firma adını yazın ve listelenen firmalardan aradığınızı seçin</div>
              </div>
            </li>
          </ol>
          <div id="historyIds"></div>
        </div>
      </div>
      <div class="subContainer">
        <div class="subTitle">Ortak Eğitim Yapmak İstediğim Firmalar:</div>
        <div class="subContent">
          <ol id="wishList" class="myfirmList">
            <?php foreach ($wishes as $f): ?>
            <li>
              <a class="firmNameLink" href="comment.php?firm_id=<?php echo $f['id']; ?>"><?php echo $f['name']; ?></a>
              <span class="action">
                <a title="Hayaldi, gerçek oldu :)" onclick="wish2History(this.parentNode.parentNode, <?php echo $f['id']; ?>);">Oldu</a>
              </span>
              <span class="action delete">
                <a title="Bunu sil" onclick="if(this.innerHTML=='Silinsin mi?')deleteWish(this.parentNode.parentNode, <?php echo $f['id']; ?>);else this.innerHTML='Silinsin mi?';return false;">Sil</a>
              </span>
            </li>
            <?php endforeach; ?>
            <li id="wishForm">
              <input id="wishName" class="inputText" type="text" name="wishName" placeholder="Yeni ekle"  autocomplete="off"/>
              <div id="wishFirms" class="autoCompleteList">
                <div style="padding: 3px 0;">Firma adını yazın ve listelenen firmalardan aradığınızı seçin</div>
              </div>
            </li>
          </ol>
          <div id="wishIds"></div>
        </div>
      </div>
      <div class="bottomButttons">
        <input class="inputButton" type="submit" value="Kaydet" id="saveButton" disabled="disabled"/>
        <input class="inputButton" type="button" value="İptal" id="cancelButton" disabled="disabled" onclick="window.location.reload();"/>
        <span class="warning" style="display: none;" id="dontForget">Kaydetmeyi unutma!</span>
      </div>
    </form>
    <script type="text/javascript">
      var firms = <?php echo $json; ?>;
      var saveButtonElem = document.getElementById('saveButton');
      var cancelButtonElem = document.getElementById('cancelButton');
      var dontForgetElem = document.getElementById('dontForget');
      
      document.onclick = function (event) {
        if (event.target.id != 'historyName') {
          historyFirmsElem.style.display = 'none';
        } else {
          if (historyFirmsElem.innerHTML != "")
            historyFirmsElem.style.display = 'block';
        }
        if (event.target.id != 'wishName') {
          wishFirmsElem.style.display = 'none';
        } else {
          if (wishFirmsElem.innerHTML != "")
            wishFirmsElem.style.display = 'block';
        }
      };
      
      // HISTORY LIST CODES
      var historyFormElem = document.getElementById('historyForm');
      var historyIdsElem = document.getElementById('historyIds');
      var historyNameElem = document.getElementById('historyName');
      var historyFirmsElem = document.getElementById('historyFirms');
      var historyListElem = document.getElementById('historyList');
      
      historyNameElem.onkeyup = function () {
        if (this.value.length > 0) {
          var finds = [];
          var findsCount = 0;
          for (var i = 0; i < firms.length; i++) {
            if (firms[i].name.indexOf(this.value.toUpperCase()) != -1) {
              finds.push(i);
              findsCount++;
              if (findsCount == 20)
                break;
            }
          }
          
          var result = '';
          for (var i = 0; i < finds.length; i++) {
            var firm = firms[finds[i]];
            if (i % 2 == 1)
              result += '<a onclick="addHistory('+finds[i]+');"><div class="searchItem odd">'+firm.name+'</div></a>';
            else
              result += '<a onclick="addHistory('+finds[i]+');"><div class="searchItem">'+firm.name+'</div></a>';
          }
          if (result.length == 0) {
            result = '<div style="padding: 3px 0;">Firma bulunamadı. Yeni eklemek için <a class="underline" href="firm.php?s=add">buraya</a> tıklayın</div></div>';
          }
          historyFirmsElem.innerHTML = result;
          historyFirmsElem.style.display = 'block';
        }
      };
      
      var addHistory = function (firmIndex) {
        var firm = firms[firmIndex];
        
        var find = false;
        var fs = historyIdsElem.children;
        for (var i = 0; i < fs.length; i++) {
          if (fs[i].value == firm.id) {
            fs[i].name = 'ha[id][]';
            find = true;
            break;
          }
        }
        if (!find) {
          historyIdsElem.innerHTML += '<input type="hidden" name="ha[id][]" value="'+firm.id+'"/>';
        }
        
        var newHistoryLi = document.createElement('li');
        newHistoryLi.innerHTML = '<a class="firmNameLink" href="comment.php?firm_id='+firm.id+'">'+firm.name+'</a> <span class="action delete"><a title="Bunu sil" onclick="if(this.innerHTML==\'Silinsin mi?\')deleteHistory(this.parentNode.parentNode, '+firm.id+');else this.innerHTML=\'Silinsin mi?\';return false;">Sil</a></span>';
        historyFormElem.parentNode.insertBefore(newHistoryLi, historyFormElem);
        historyNameElem.value = '';
        saveButtonElem.disabled = '';
        cancelButtonElem.disabled = '';
        dontForgetElem.style.display = 'inline';
      }
      
      var deleteHistory = function (listElem, firmId) {
        var find = false;
        var fs = historyIdsElem.children;
        for (var i = 0; i < fs.length; i++) {
          if (fs[i].value == firmId) {
            fs[i].name = 'hd[id][]';
            find = true;
            break;
          }
        }
        if (!find) {
          historyIdsElem.innerHTML += '<input type="hidden" name="hd[id][]" value="'+firmId+'"/>';
        }
        listElem.style.display = 'none';
        saveButtonElem.disabled = '';
        cancelButtonElem.disabled = '';
        dontForgetElem.style.display = 'inline';
      }
      
      // WISH LIST CODES
      var wishFormElem = document.getElementById('wishForm');
      var wishIdsElem = document.getElementById('wishIds');
      var wishNameElem = document.getElementById('wishName');
      var wishFirmsElem = document.getElementById('wishFirms');
      var wishListElem = document.getElementById('wishList');
      
      wishNameElem.onkeyup = function () {
        if (this.value.length > 0) {
          var finds = [];
          var findsCount = 0;
          for (var i = 0; i < firms.length; i++) {
            if (firms[i].name.indexOf(this.value.toUpperCase()) != -1) {
              finds.push(i);
              findsCount++;
              if (findsCount == 20)
                break;
            }
          }
          
          var result = '';
          for (var i = 0; i < finds.length; i++) {
            var firm = firms[finds[i]];
            if (i % 2 == 1)
              result += '<a onclick="addWish('+finds[i]+');"><div class="searchItem odd">'+firm.name+'</div></a>';
            else
              result += '<a onclick="addWish('+finds[i]+');"><div class="searchItem">'+firm.name+'</div></a>';
          }
          if (result.length == 0) {
            result = '<div style="padding: 3px 0;">Firma bulunamadı. Yeni eklemek için <a class="underline" href="firm.php?s=add">buraya</a> tıklayın</div></div>';
          }
          wishFirmsElem.innerHTML = result;
          wishFirmsElem.style.display = 'block';
        }
      };
      
      var addWish = function (firmIndex) {
        var firm = firms[firmIndex];
        
        var find = false;
        var fs = wishIdsElem.children;
        for (var i = 0; i < fs.length; i++) {
          if (fs[i].value == firm.id) {
            fs[i].name = 'ha[id][]';
            find = true;
            break;
          }
        }
        if (!find) {
          historyIdsElem.innerHTML += '<input type="hidden" name="wa[id][]" value="'+firm.id+'"/>';
        }
        
        var newWishLi = document.createElement('li');
        newWishLi.innerHTML = '<a class="firmNameLink" href="comment.php?firm_id='+firm.id+'">'+firm.name+'</a> <span class="action delete"><a title="Bunu sil" onclick="if(this.innerHTML==\'Silinsin mi?\')deleteWish(this.parentNode.parentNode, '+firm.id+');else this.innerHTML=\'Silinsin mi?\';return false;">Sil</a></span>';
        wishFormElem.parentNode.insertBefore(newWishLi, wishFormElem);
        wishNameElem.value = '';
        saveButtonElem.disabled = '';
        cancelButtonElem.disabled = '';
        dontForgetElem.style.display = 'inline';
      }
      
      var deleteWish = function (listElem, firmId) {
        var find = false;
        var fs = wishIdsElem.children;
        for (var i = 0; i < fs.length; i++) {
          if (fs[i].value == firmId) {
            fs[i].name = 'hd[id][]';
            find = true;
            break;
          }
        }
        if (!find) {
          wishIdsElem.innerHTML += '<input type="hidden" name="wd[id][]" value="'+firmId+'"/>';
        }
        listElem.style.display = 'none';
        saveButtonElem.disabled = '';
        cancelButtonElem.disabled = '';
        dontForgetElem.style.display = 'inline';
      }
      
      var wish2History = function (listElem, firmId) {
        deleteWish(listElem, firmId);
        for (var i = 0; i < firms.length; i++) {
          if (firms[i].id == firmId) {
            addHistory(i);
            break;
          }
        }
        addHistory();
        saveButtonElem.disabled = '';
        cancelButtonElem.disabled = '';
        dontForgetElem.style.display = 'inline';
      }
    </script>
  </div>
</div>

