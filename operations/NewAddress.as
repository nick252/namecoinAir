package operations
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import vk.gui.Button;
	import vk.gui.InputField;
	import vk.gui.RoundButton;
	import communication.RequestSender;
	/**
	 * @author namecoinAir
	 */
	public class NewAddress
	{
		private var typeText:InputField;
		public function NewAddress(panel:Sprite)
		{
			var butt:RoundButton = new RoundButton("Generate new address",20,40,1);
			butt.addEventListener(MouseEvent.CLICK,newAddress);
			panel.addChild(butt);
			
			typeText = new InputField(20,70,250,1,false);
			panel.addChild(typeText);
			
			
		}
		private function newAddress(ev:MouseEvent = null):void
		{
			var argArray:Vector.<String> = new Vector.<String>();
			argArray.push("getnewaddress");
			RequestSender.sendAsk(argArray,makeNewAddress);
		}
		public function makeNewAddress(value:String):void
		{
			typeText.textField.text = value;
		}
	}
}