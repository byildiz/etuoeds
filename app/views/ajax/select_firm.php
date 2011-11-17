<div id="container">
  <div id="title"><?php echo $title; ?></div>
  <div id="content">
    <form id="searchForm" action="<?php echo $formAction; ?>" method="post">    
      <div id="searchBar">
        <input id="searchInput" class="inputText searchText" type="text" name="comment[search]" placeholder="Hızlı bul" autocomplete="off" />
        <input class="inputButton searchButton" type="submit" value="Seç" onclick="if(document.getElementById('searchInput').value=='')return false;"/>
        <input id="firmId" type="hidden" name="firm[id]" value="1"/>
        <div id="searchResult">
          <div style="padding: 3px 0;">Seçilecek firmayı girin</div>
        </div>
        <script type="text/javascript">
          var firms = <?php echo $json; ?>;
          var searchInput = document.getElementById('searchInput');
          var searchResult = document.getElementById('searchResult');
          var searchForm = document.getElementById('searchForm');
          var firmId = document.getElementById('firmId');
          var searchItemClick = function (elem) {
            searchInput.value = elem.children[0].innerHTML;
            firmId.value = elem.href.split('=').pop();
            searchForm.action = elem.href;
            searchInput.focus();
          }
          
          searchInput.onkeyup = function () {
            if (this.value.length > 0) {
              var finds = [];
              for (var i = 0; i < firms.length; i++) {
                if (firms[i].name.indexOf(this.value.toUpperCase()) != -1) {
                  finds.push(firms[i]);
                }
              }
              
              var result = '';
              for (var i = 0; i < finds.length; i++) {
                if (i % 2 == 1)
                  result += '<a onclick="" href="<?php echo $formAction; ?>&firm_id='+finds[i].id+'"><div class="searchItem odd">'+finds[i].name+'</div></a>';
                else
                  result += '<a onclick="" href="<?php echo $formAction; ?>&firm_id='+finds[i].id+'"><div class="searchItem">'+finds[i].name+'</div></a>';
              }
              if (result.length == 0) {
                result = '<div style="padding: 3px 0;">Firma bulunamadı. Yeni eklemek için <a class="underline" href="firm.php?s=add">buraya</a> tıklayın</div></div>';
              }
              
              searchResult.innerHTML = result;
              searchResult.style.display = 'block';
            }
          };
          
          document.onclick = function (event) {
            if (event.target.id != 'searchInput') {
              if (event.target.parentNode.parentNode.id && event.target.parentNode.parentNode.id == 'searchResult') {
                searchItemClick(event.target.parentNode);
              } else if (event.target.parentNode.id && event.target.parentNode.id == 'searchResult') {
                searchItemClick(event.target);
              }
              searchResult.style.display = 'none';
            } else {
              searchResult.style.display = 'block';
            }
          }
          
          window.onload = function () {
            var firmListElem = document.getElementById('firmList');
            var firmList = '';
            for (var i = 0; i < firms.length; i++) {
              firmList += '<li><div class="firmLink"><a href="<?php echo $formAction; ?>&firm_id=' + firms[i].id + '">' + firms[i].name + '</a></div>'
                          + '<div class="firmInfo">Değerlendirme sayısı: ' + firms[i].comment_count + ', Soru sayısı: ' + firms[i].question_count + ', Öneri sayısı: ' + firms[i].vote_count + '</div></li>';
            }
            if (firmList == '') {
              firmListElem.innerHTML = '<li style="list-style: none; padding-top: 10px;">Kayıtlı firma yok</li>';
            } else {
              firmListElem.innerHTML = firmList;
            }
          }
        </script>
      </div>
    </form>
    <div class="subContainer">
    	<div class="subContent">
        <div class="allFirms">
          <ul id="firmList"><li style="list-style: none; padding-top: 10px;">Firmalar yükleniyor...</li></ul>
        </div>
      </div>
    </div>
  </div>
</div>