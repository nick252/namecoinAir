package operations
{
	import com.adobe.serialization.json.JSON;
	
	import communication.RequestSender;
	
	import flash.display.Sprite;
	
	import vk.gui.InputField;

	public class InfoController
	{
		private var panel:Sprite;
		public function InfoController(panel:Sprite)
		{
			this.panel = panel;
			for(var i=1;i<12;i++)
			{	
				
				
				
			}
			var argArray:Vector.<String> = new Vector.<String>();
			argArray.push("getinfo");
			
			RequestSender.sendAsk(argArray,askInfo);
		}
		public function askInfo(value:String):void
		{
			
			var infoObj:Object = JSON.decode(value);
			
			var i:int = 0;
			for (var str:String in infoObj)
			{
				i++;
				var contentField:InputField = new InputField(200,30*i,150,1,false);
				contentField.textField.text = infoObj[str];
				panel.addChild(contentField);
				
				var descriptionField1:InputField = new InputField(20,30*i,150,1,false);
				descriptionField1.textField.text =str;
				panel.addChild(descriptionField1);
				
			}	
			
		}
	}
}