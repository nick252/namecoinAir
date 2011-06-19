package  {
	
	import communication.RequestSender;
	import communication.Start;
	
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import operations.HistoryController;
	import operations.InfoController;
	import operations.NewAddress;
	import operations.SendMoney;
	import operations.SettingsController;
	
	import vk.gui.InputField;
	import vk.gui.MainMenu;
	import vk.gui.MenuItem;

	/**
	 * @author namecoinAir
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="25", width="800", height="600")]
	public class MainClass extends MovieClip 
	{
		
		private var process:NativeProcess;
		private var mainMenu:MainMenu;
		private var loadingText:InputField = new InputField(200,200,100,1,false);
		private var balansContent:InputField;
		private var historyController:HistoryController = new HistoryController();
		public static var thisInstance:MainClass;
		public function MainClass() 
		{
			thisInstance = this;
			
			new Start();
			var timer:Timer = new Timer(1000,10);
			timer.start();
			
			timer.addEventListener(TimerEvent.TIMER,timerTick);
			
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerEvent);
		}
		public function timerTick(ev:TimerEvent = null):void
		{
			loadingText.textField.text ="Loading... "+String(ev.currentTarget.currentCount*10) +"%";
			loadingText.scaleX = 2;
			loadingText.scaleY = 2;
			this.addChild(loadingText);
		}	
		public function timerEvent(ev:TimerEvent = null):void
		{
			loadingText.visible = false;
			
			mainMenu = new MainMenu(null);
			var mainMenuItem1:MenuItem =  mainMenu.addItem("Send coin","");
			var mainMenuItem2:MenuItem =  mainMenu.addItem("History","");
			var mainMenuItem3:MenuItem =  mainMenu.addItem("New address","");
			var mainMenuItem4:MenuItem =  mainMenu.addItem("Settings","");
			var mainMenuItem5:MenuItem =  mainMenu.addItem("Info","");
			mainMenu.addEventListener(Event.CHANGE, function(e:Event):void
			{
				if (e.target is MainMenu)
				{
					if(e.target.selectedPage ==1)
						historyController.show(mainMenuItem2.panel);
				}
			})	
			
			//mainMenu.addEventListener(
			this.addChild(mainMenu);
			//inp.textField.text ="dddd";
			new SendMoney(mainMenuItem1.panel);
			new NewAddress(mainMenuItem3.panel);
			new SettingsController(mainMenuItem4.panel);
			new InfoController(mainMenuItem5.panel);
			var balansTextFiled:InputField = new InputField(630,0,50,1,false);
			balansTextFiled.textField.text ="balance";
			this.addChild(balansTextFiled);
			balansContent = new InputField(700,0,90,1,false);
			balansContent.textField.text ="0";
			this.addChild(balansContent);
			var balanseUpdate:Timer = new Timer(5000,0);
			balanseUpdate.start();
			balanseUpdate.addEventListener(TimerEvent.TIMER,balanseTick);

		}
		private function balanseTick(ev:TimerEvent):void
		{
			var argArray:Vector.<String> = new Vector.<String>();
			argArray.push("getbalance");
			RequestSender.sendAsk(argArray,updateBalanse);
		}
		public function updateBalanse(value:String):void
		{
			balansContent.textField.text = value;
		}	
		
	}
	
}
