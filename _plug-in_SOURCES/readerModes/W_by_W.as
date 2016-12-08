package {
	import flash.utils.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.text.TextFormatAlign;
	public class W_by_W extends Sprite {
		var n:Number;
		var myTime:Number;
		var myTxt:Array;
		var txtInt;
		public var lab
		var ts
		public function W_by_W() {
			var embeddedFontsArray:Array = Font.enumerateFonts(false);
			lab = new TextField();
			//lab.border = true
			addChild(lab)
			//lab.text="bella";
			//startReader("bella ci", 500)
		}
		public function startReader(txt, tt) {
			n = 0;
			myTxt = txt.split(" ");
			myTime = tt
			myPlay();
		}
		public function myPlay() {
			if (myTxt.length>0) {
				clearInterval(this.txtInt);
				this.txtInt = setInterval(leggi, myTime);
			}
		}
		public function myStop(trgt) {
			clearInterval(this.txtInt);
		}
		public function myRewind(trgt) {
			this.n = 0;
		}
		public function leggi() {
			lab.text = myTxt[n];
			if (this.n>this.myTxt.length-2) {
				this.n = 0;
			} else {
				this.n++;
			}
		}
	}
}