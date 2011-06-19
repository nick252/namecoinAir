package operations
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.*;
	import flash.filters.BevelFilter;
	import flash.net.FileFilter;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import vk.gui.InputField;
	import vk.gui.RoundButton;
	import ourGui.SimpleAlert;
	/**
	 * @author namecoinAir
	 */
	public class SettingsController
	{
		private var so:SharedObject;
		private var directoryText:TextField;
		private var panel:Sprite;
		public function SettingsController(panel:Sprite)
		{
			this.panel = panel;
			so = SharedObject.getLocal("appNameCoin");
			
			var infoText:InputField = new InputField(20,30,200,1,false);
			infoText.textField.text ="Directory of namecoind.exe";
			panel.addChild(infoText);
			
			directoryText = new TextField();
			directoryText.x = 20;
			directoryText.y = 70;
			directoryText.width = 600
			directoryText.defaultTextFormat = new TextFormat(null,20);	
			panel.addChild(directoryText);
			if (!so.data.AppDirectory)
			{
				directoryText.text = "C:\\namecoin\\namecoind.exe";
			}else
			{
				directoryText.text = so.data.AppDirectory;
			}	
			
			var button:RoundButton = new RoundButton("choose another directory",20,110)
			panel.addChild(button);	
			button.addEventListener(MouseEvent.CLICK,openDirectory);
		}
		private function openDirectory(ev:MouseEvent=null):void
		{
			var fileToOpen:File = new File();
			
			try 
			{
				fileToOpen.browseForOpen("Open");
				fileToOpen.addEventListener(Event.SELECT, fileSelected);
			}
			catch (error:Error)
			{
				
			}
		}
		function fileSelected(event:Event=null):void 
		{
			
			so.data.AppDirectory = event.target.url;
			directoryText.text = event.target.url;
			var simpleAlert:SimpleAlert = new SimpleAlert("Reload programm to take effect");
			simpleAlert.y = 50;
			panel.addChild(simpleAlert);
			var timer:Timer = new Timer(3000,1)
			timer.start();
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,function(ev:TimerEvent):void{
				panel.removeChild(simpleAlert);
			})
			//var stream:FileStream = new FileStream();
			//stream.open(event.target, FileMode.READ);
			//var fileData:String = stream.readUTFBytes(stream.bytesAvailable);
			//trace(fileData);
		}
			
	}
}