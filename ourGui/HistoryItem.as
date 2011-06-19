package ourGui
{
	import flash.display.Sprite;
	
	import vk.gui.InputField;
	/**
	 * @author namecoinAir
	 */
	public class HistoryItem extends Sprite
	{
		public function HistoryItem(type:String,adress:String,amount:String,confirmations:String)
		{
			var typeText:InputField = new InputField(20,50,50,1,false);
			typeText.textField.text = type;
			this.addChild(typeText);
			
			var adressText:InputField = new InputField(80,50,250,1,false);
			adressText.textField.text = adress;
			this.addChild(adressText);
			
			var amountText:InputField = new InputField(380,50,130,1,false);
			amountText.textField.text = amount +" coins";
			this.addChild(amountText);
			
			var confirmText:InputField = new InputField(550,50,130,1,false);
			confirmText.textField.text = confirmations +" confirm.";
			this.addChild(confirmText);
			
			
		}
	}
}