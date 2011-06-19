// RoundButton DisplayState

package vk.gui
{
  import flash.display.BitmapData;
  import flash.display.Sprite;
  import flash.text.TextField;
 
  
  /**
  * @author Andrew Rogozov
  * @modified by Alexey Kharkov
  */
  internal class RoundButtonDSNikola extends Sprite
  {
	  
	  
    public function RoundButtonDSNikola(bit:BitmapData,txtCo:uint, s:String ):void
    {
     
     var txtCol:uint;
	 var col:uint;
     
        col = txtCo;
        txtCol = 0x000000
       
      

	  
	  
      var txt:TextField = new TextField
		  
		txt.text ="  " + s   
		txt.width=180	
		  
		  // Utils.addText( 10, 0, 150, 20, s, txtCol);
      addChild( txt );

      const w:uint = 185;
      const h:uint = 25;

      txt.y = Math.round((h - txt.textHeight) / 2) - 2;

	  //obj:*, x:Number, y:Number, w:Number, h:Number, c:int, r:int
      Utils.fillRRectNikola(bit, this);
	  //this.alpha = 0.6
    }
  }
}
