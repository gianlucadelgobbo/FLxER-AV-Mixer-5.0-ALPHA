package {
	import flash.display.Sprite;
	public class Plugin {
		public function Plugin():void {
		}
		public static function getChannelsNum():uint {
			return 6;
		}
		public static function getMonWidth():uint {
			return 800;
		}
		public static function getMonHeight():uint {
			return 600;
		}
		public static function getChannel(ch) {
			return new Sprite();
		}
		public static function getMonitor() {
			return new Sprite();
		}
		public static function getMovie(ch):Sprite {
			return new Sprite();
		}
		public static function getMovieCnt(ch):Sprite {
			return new Sprite();
		}
		public static function getMask(ch):Sprite {
			return new Sprite();
		}
		public static function clearMask(ch):void {
			trace("clearMaskclearMask"+ch)
			Preferences.pref.monitorTrgt.levels["ch_"+ch].clearMask()
		}
		public static function restoreMask(ch):void {
			Preferences.pref.monitorTrgt.levels["ch_"+ch].restoreMask()
		}

	}
}