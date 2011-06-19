// RoundButton DisplayState

package vk.gui
{
  import flash.display.Sprite;
  import flash.text.TextField;
  
  /**
  * @author Andrew Rogozov
  * @modified by Alexey Kharkov
  */
  internal class RoundButtonDS extends Sprite
  {
    public function RoundButtonDS( bt:uint, state:uint, s:String ):void
    {
      var col:uint = 0;
      var txtCol:uint = 0;

      switch (bt)
      {
      case Button.GRAY_BUTTON:
        col = 0xDEDEDE;
        txtCol = (state == 0) ? 0x222222 : 0x606060;
        break;
      default:
        col = (state == 0) ? 0xEEEEEE: 0x818181;
        txtCol = (state == 0) ? 0x000000 : 0xff9600;
        break;
      }

      var txt:TextField = Utils.addText( 10, 0, 1000, 11, s, txtCol, Utils.TXT_AUTOSIZE );
      addChild( txt );

      const w:uint = txt.textWidth + 24;
      const h:uint = 23;

      txt.y = Math.round((h - txt.textHeight) / 2) - 2;

      Utils.fillRRect( this, 0, 0, w, h, col, 6 );
    }
  }
}
