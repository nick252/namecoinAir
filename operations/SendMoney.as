package operations
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import vk.gui.InputField;
	import vk.gui.RoundButton;
	import communication.RequestSender;
	/**
	 * @author namecoinAir
	 */
	public class SendMoney
	{
		private var res:InputField;
		public function SendMoney(movic:Sprite)
		{
			var inp:InputField;
			inp = new InputField(100,20,250,1,true);
			movic.addChild(inp);
			
			var address:InputField;
			address = new InputField(20,20,50,1,false);
			address.textField.text = "address";
			movic.addChild(address);
			
			var amount:InputField;
			amount = new InputField(380,20,50,1,false);
			amount.textField.text = "amount";
			movic.addChild(amount);
			
			var summ:InputField;
			summ = new InputField(460,20,50,1,true);
			movic.addChild(summ);
			
			var button:RoundButton = new RoundButton("Send namecoins",550,20);
			button.addEventListener(MouseEvent.CLICK,function(ev:MouseEvent):void{
				trace("test");
				var argArray:Vector.<String> = new Vector.<String>();
				argArray.push("sendtoaddress");
				argArray.push(inp.textField.text);
				argArray.push(summ.textField.text);
				RequestSender.sendAsk(argArray,makeTrasaction);
			})
			movic.addChild(button);
			
			var resultPanel:InputField;
			resultPanel = new InputField(50,70,100,1,false);
			resultPanel.textField.text ="operation result";
			movic.addChild(resultPanel);
			
			res = new InputField(50,90,300,10,false);
			//res.textField.text ="operation result";
			movic.addChild(res);
			
			
			
		}
		public function makeTrasaction(value:String):void
		{
			res.textField.text = value;
		}
	}
}