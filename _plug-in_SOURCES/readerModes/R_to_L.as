package {
	import flash.utils.*;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.text.TextFormatAlign;
	public class R_to_L extends Sprite {
		var n:Number;
		var myTime:Number;
		var txtInt;
		public var lab

		var startTxt:String;
		var startTxtLength:Number;
		var txtLength:Number;
		var myTxt:String;
		public function R_to_L() {
			lab = new TextField();
			//lab.width = lab.height = 100
			//lab.border = true
			//lab.text="bella";
			//startReader("bella ci", 500)
			addChild(lab)
		}
		public function startReader(txt, tt) {
			myTxt = txt;
			myTime = tt
			this.n = 0;
			this.startTxt = "                      ";
			this.startTxtLength = this.startTxt.length;
			this.txtLength = myTxt.length+this.startTxt.length;
			this.myTxt = this.startTxt+myTxt+" "+myTxt+" "+myTxt;
			myPlay()
		}
		function myPlay() {
			if (myTxt.length>0) {
				clearInterval(txtInt);
				txtInt = setInterval(leggi, myTime);
			}
		}
		function myStop(trgt) {
			clearInterval(txtInt);
		}
		function myRewind(trgt) {
			this.n = 0;
		}
		function leggi() {
			trace("IIIIIIIIIIIIIIII")
			lab.text = this.myTxt.substring(this.n, this.n+20);
			trace (this.myTxt)
			if (this.n>this.txtLength-2) {
				this.n = this.startTxtLength;
			} else {
				this.n++;
			}
		}
	}
}