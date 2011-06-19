package communication
{
	import flash.net.SharedObject;
	
	import ourGui.SimpleAlert;
	/**
	 * @author namecoinAir
	 */
	public class RequestSender
	{
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
		
		import vk.gui.InputField;
		import vk.gui.MainMenu;
		import vk.gui.MenuItem;
		public static var simpleAlert:SimpleAlert = new SimpleAlert("Set namecoind.exe dir in settings");
		public static var simpleFail:SimpleAlert = new SimpleAlert("Fail to start namecoind.exe automatically. Please launch namecoind.exe, and let it be open");
		public static function sendAsk(requestVector:Vector.<String>,textData:Function):void
		{
			var so:SharedObject;
			so = SharedObject.getLocal("appNameCoin");
			try
			{	
				var file:File = File.desktopDirectory;
				
				if (!so.data.AppDirectory)
				{
					file = file.resolvePath("C:\\namecoin\\namecoind.exe");
				}else
				{
					file = file.resolvePath(so.data.AppDirectory);
				}	
				var testFile:File;
				if (!so.data.AppDirectory)
				{
					testFile = new File("C:\\namecoin\\namecoind.exe");
				}else
				{
					testFile = new File(so.data.AppDirectory);
				}
				if(!testFile.exists)
				{	
					MainClass.thisInstance.addChild(simpleAlert);
					simpleAlert.visible = true;
					return;
				}else
				{
					simpleAlert.visible = false;
				}
				var timerFlag:Boolean = false;
				var testTimer:Timer = new Timer(12000,1);
				testTimer.start();
				testTimer.addEventListener(TimerEvent.TIMER_COMPLETE,testTimerComplete)
				function testTimerComplete(ev:TimerEvent):void
				{
					testTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,testTimerComplete);
					MainClass.thisInstance.addChild(simpleFail);
					simpleFail.visible = !timerFlag;
				}
				var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
				nativeProcessStartupInfo.executable = file;
				nativeProcessStartupInfo.arguments = requestVector;
				var process:NativeProcess = new NativeProcess();
				process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData); 
				process.start(nativeProcessStartupInfo);
			}catch(e:Error)
			{
				//inp.textField.text = e.getStackTrace();
			}
			function onOutputData(event:ProgressEvent):void 
			{ 
				process.removeEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutputData); 
				timerFlag = true;
				var stdOut:Number = process.standardOutput.bytesAvailable; 
				textData(process.standardOutput.readUTFBytes(stdOut)); 
				
			}
		}
		
	}
}