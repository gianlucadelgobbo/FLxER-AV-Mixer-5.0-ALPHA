package {
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.net.SharedObject;

	public class Preferences {
		public static var pref;
		var myPrefSO:SharedObject;
		var c;
		var loader;
		public function Preferences() {
		}
		public static function customizePref(p) {
			pref = p
		}
		public static function createPref(ww,hh) {
			pref = new Object();
			pref.w = ww;
			pref.h = hh;

			pref.colWhite = new Object();
			pref.colWhite.col = "0x000000";
			pref.colWhite.bkgCol = "0xFFFFFF";
			pref.colWhite.bkgColOver = "0xFF0000";
			pref.colWhite.brdCol = "0x999999";
			pref.colWhite.pltCol = "0x909090";
			pref.colWhite.monCol = "0xFFFFFF";
			//
			pref.colBlack = new Object();
			pref.colBlack.col = "0x999999";
			pref.colBlack.bkgCol = "0x000000";
			pref.colBlack.bkgColOver = "0x990000";
			pref.colBlack.brdCol = "0x333333";
			pref.colBlack.pltCol = "0x909090";
			pref.colBlack.monCol = "0x000000";
			//
			pref.myCol = new Object();
			pref.myCol.altCol 		= "0x000000";
			pref.myCol.altBkg 		= "0xFFFF00";
			pref.myCol.altBrd 		= "0x000000";
			
			var embeddedFontsArray:Array = Font.enumerateFonts(false);
			/*
			for (var a in embeddedFontsArray) {
				trace(a + " " + embeddedFontsArray[a].fontName);
			}
			*/
			pref.ts = new TextFormat();
			with (pref.ts) {
				font = embeddedFontsArray[1].fontName;
				size = 8;
				color = 0x000000;
				leading = -2;
				leftMargin = 1;
				rightMargin = 0;
			}
			pref.th = new TextFormat();
			with (pref.th) {
				font = embeddedFontsArray[0].fontName;
				size = 8;
				color = 0x000000;
				leading = -2;
				leftMargin = 1;
				rightMargin = 0;
			}
			var lista_font:Array = Font.enumerateFonts(true);
			pref.myFonts = new XMLDocument("<lib><lib></lib></lib>");
			for (var a = 0; a < lista_font.length; a++) {
				var lib = pref.myFonts.createElement("lib");
				pref.myFonts.childNodes[0].childNodes[0].appendChild(lib);
				pref.myFonts.childNodes[0].childNodes[0].childNodes[a].attributes.m = lista_font[a].fontName;
			}
			/////////////////////////           
		}
		public function updateColObj(obj) {
			pref.myCol.col 			= pref.flxerPref.childNodes[0].attributes.col 			= obj.col;
			pref.ts.color 			= obj.col;
			pref.th.color 			= obj.col;
			pref.myCol.bkgCol 		= pref.flxerPref.childNodes[0].attributes.bkgCol 		= obj.bkgCol;
			pref.myCol.bkgColOver 	= pref.flxerPref.childNodes[0].attributes.bkgColOver 	= obj.bkgColOver;
			pref.myCol.brdCol 		= pref.flxerPref.childNodes[0].attributes.brdCol 		= obj.brdCol;
			pref.myCol.pltCol 		= pref.flxerPref.childNodes[0].attributes.pltCol 		= obj.pltCol;
			pref.myCol.monCol 		= pref.flxerPref.childNodes[0].attributes.monCol 		= obj.monCol;
		}
		public static function updateCol() {
			trace(pref.flxerPref)
			pref.myCol.col 			= pref.flxerPref.childNodes[0].attributes.col;
			pref.ts.color 			= pref.myCol.col;
			pref.th.color 			= pref.myCol.col;
			pref.myCol.bkgCol 		= pref.flxerPref.childNodes[0].attributes.bkgCol;
			pref.myCol.bkgColOver 	= pref.flxerPref.childNodes[0].attributes.bkgColOver;
			pref.myCol.brdCol 		= pref.flxerPref.childNodes[0].attributes.brdCol;
			pref.myCol.pltCol 		= pref.flxerPref.childNodes[0].attributes.pltCol;
			pref.myCol.monCol 		= pref.flxerPref.childNodes[0].attributes.monCol;
		}
		public static function myReplace(str, search, replace) {
			var temparray = str.split(search);
			str = temparray.join(replace);
			return str;
		}
	}
}