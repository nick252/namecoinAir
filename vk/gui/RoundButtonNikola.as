package vk.gui
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;

  /**
  * @author Andrew Rogozov
  * @modified by Alexey Kharkov
  */
  public class RoundButtonNikola extends Button
  {
	  import flash.filters.GlowFilter
	public static var txtCol:uint
	public static var iiii:Number = -1
	public var bit:BitmapData	
	  //  public var labelic:String
    public function RoundButtonNikola(bitt:BitmapData, label:String, x:int, y:int, txtCo:int ):void
    {
		bit = bitt
		
		iiii = - iiii
		if(iiii == 1){
			txtCol = 0xFFFFFF
		}else{
			txtCol = 0xFFFFFF
		}
	//	var fil:Array = new Array
		
		this.alpha = 1
		//this.filters = [new GlowFilter(0xFFFFFF * 0.1, 1, 20, 20)]
			
			
      super( label, x, y, BLUE_BUTTON );
	// labelic = this.label
	 
    }
	
	
	
	 
    
    // ---------------------------------------------------------------------- Internal methods.
    internal override function updateButton():void
    {
		upState   = new RoundButtonDSNikola(bit, txtCol, s );
		overState = new RoundButtonDSNikola(bit, txtCol, s );
		downState = hitTestState = overState;
    }
  }
}
