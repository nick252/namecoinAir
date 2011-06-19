package communication
{
	import flash.desktop.NativeProcess;
	import flash.desktop.NativeProcessStartupInfo;
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.SharedObject;
	import flash.utils.ByteArray;
	/**
	 * @author namecoinAir
	 */
	public class Start
	{
		public function Start()
		{
			
			var so:SharedObject;
			so = SharedObject.getLocal("appNameCoin");
			try{
				var file:File = File.desktopDirectory;
				if (!so.data.AppDirectory)
				{
					file = file.resolvePath("C:\\namecoin\\namecoind.exe");
				}else
				{
					file = file.resolvePath(so.data.AppDirectory);
				}
				
				var nativeProcessStartupInfo:NativeProcessStartupInfo = new NativeProcessStartupInfo();
				nativeProcessStartupInfo.executable = file;
				var process:NativeProcess = new NativeProcess();
				process.start(nativeProcessStartupInfo);
			}catch(e:Error)
			{
				
			}
		}
	}
}