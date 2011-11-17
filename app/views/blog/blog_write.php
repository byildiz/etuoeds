<div id="container">
  <div id="title">Bir Gün Daha Geçti</div>
  <div id="content">
    <div class="form">
      <form action="blog.php?s=write" method="post">
        <table class="formTable">
          <tr>
            <td>
              <div class="formLabel">
                <label for="blogFirm">Firma:</label>
              </div>
            </td>
            <td>
              <input id="blogFirm" class="inputText" type="text" name="blog[firm]" autocomplete="off" />
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="blogToDate">Tarih:</label>
              </div>
            </td>
            <td>
              <input id="blogToDate" class="inputText" type="password" name="blog[to_date]" />
              <input type="button" class="inputButton" id="selectToButton" value="Seç" onclick="selectDate('blogToDate');" />
              <input id="blogFromDate" class="inputText" type="password" name="blog[from_date]" />
              <input type="button" class="inputButton" id="selectFromButton" value="Seç" onclick="selectDate('blogFromDate');" />
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="blogText">Günlük:</label>
              </div>
            </td>
            <td>
              <textarea id="blogText" class="inputTextarea" name="blog[text]"></textarea>
            </td>
          </tr>
          <tr>
            <td>
              <div class="formLabel">
                <label for="blogPhoto">Fotoğraf:</label>
              </div>
            </td>
            <td>
              <input id="blogPhoto" class="inputText" type="file" name="blog[photo]" />
            </td>
          </tr>
          <tr>
            <td></td>
            <td>
              <input type="hidden" name="blog[publishing]" value="0" />
              <input id="blogPublishing" class="inputCheck" type="checkbox" name="blog[publishing]" value="1" />
              <label for="blogPublishing">Yayınla</label>
            </td>
          </tr>
          <tr>
            <td></td>
            <td><input class="inputButton" type="submit" value="Kaydet" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>