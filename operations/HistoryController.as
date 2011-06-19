package operations 
{
	
	import com.adobe.serialization.json.JSON;
	
	import flash.display.Sprite;
	
	import vk.gui.InputField;
	import communication.RequestSender;
	import ourGui.HistoryItem;
	/**
	 * @author namecoinAir
	 */
	public class HistoryController
	{
		private var baseSprite:Sprite;
		
		private var panel:Sprite;
		public function HistoryController()
		{
		}
		public function show(panel:Sprite)
		{
			this.panel = panel;
			if(baseSprite!=null)
			{	
				panel.removeChild(baseSprite);
				baseSprite = null;
			}	
			baseSprite = new Sprite();
			panel.addChild(baseSprite);
			
			
			
			
			var argArray:Vector.<String> = new Vector.<String>();
			argArray.push("listtransactions");
			RequestSender.sendAsk(argArray,makeTrasaction);
		}
		
		public function makeTrasaction(value:String):void
		{
			
			var historyArr:Array = JSON.decode(value) as Array;
			
			
			for (var i=0;i< historyArr.length;i++)
			{
				
				var historyItem:HistoryItem = new HistoryItem(historyArr[i].category,historyArr[i].address,historyArr[i].amount,historyArr[i].confirmations);
				baseSprite.addChild(historyItem);
				historyItem.y += i*30;
			}	
				
		}
	}
}