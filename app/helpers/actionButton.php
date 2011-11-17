<?php
/**
 * ETÜOEDS {Ortak Eğitim Değerlendirme Sistemi}
 *
 * http://www.etuoeds.com
 * https://github.com/byildiz/etuoeds
 *
 * Burak YILDIZ, Tuna Çağlar GÜMÜŞ
 */


class ActionButton extends ViewHelper
{
  public function delete($link, $text, $title = '')
  {
?>
<span class="action delete"><a onclick="if(this.innerHTML=='Silinsin mi?')return true;else this.innerHTML='Silinsin mi?';return false;" title="<?php echo $title; ?>" href="<?php echo $link; ?>"><?php echo $text; ?></a></span>
<?php
    return $this;
  }
  
  public function edit($link, $text, $title = '')
  {
?>
<span class="action edit"><a href="<?php echo $link; ?>" title="<?php echo $title; ?>"><?php echo $text; ?></a></span>
<?php
    return $this;
  }
  
  public function vote($link, $text, $title = '')
  {
?>
<span class="action vote"><a href="<?php echo $link; ?>" title="<?php echo $title; ?>"><?php echo $text; ?></a></span>
<?php
    return $this;
  }
  
  public function myvote($text, $title = '')
  {
?>
<span class="action vote" title="<?php echo $title; ?>"><?php echo $text; ?></span>
<?php
    return $this;
  }
}