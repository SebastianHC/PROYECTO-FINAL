package  {
	import flash.events.Event;
	import flash.display.Loader;
	import flash.text.TextField;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import fl.transitions.Tween;
	import fl.transitions.*;
	import fl.transitions.easing.*;
	import flash.net.navigateToURL;
	
	public class rec  extends MovieClip{
		

		public function rec() {
			var poli_mcc:Tween  = new Tween(poli_mc,"x",Bounce.easeOut,-100,21.55,4,true);
			var nombre_mcc:Tween = new Tween(nombre_mc,"x",None.easeOut,-300,21.95,3,true);
			var pra_mcc:Tween = new Tween(pra_mc,"x",None.easeOut,550,25.60,3,true);
			var hm_mcc:Tween = new Tween(hm_mc,"x",None.easeOut,-300,24,3,true);
			var logo_mcc:Tween  = new Tween(logo_mc,"x",Bounce.easeInOut,500,636,3,true);
			var juego_mcc:Tween  = new Tween(juego_btn,"x",None.easeOut,500,98.50,3,true);
			
			juego_btn.addEventListener(MouseEvent.CLICK,juego);
		}
			
			public function juego(event:MouseEvent):void{
				trace("entra");
				gotoAndStop(2);
				volver_btn.addEventListener(MouseEvent.CLICK,volver);
				tetris_btn.addEventListener(MouseEvent.CLICK, tetris);
				}
			public function volver(event:MouseEvent):void{
				gotoAndStop(1);
				var poli_mcc:Tween  = new Tween(poli_mc,"x",Bounce.easeOut,-100,21.55,4,true);
				var nombre_mcc:Tween = new Tween(nombre_mc,"x",None.easeOut,-300,21.95,3,true);
				var pra_mcc:Tween = new Tween(pra_mc,"x",None.easeOut,550,25.60,3,true);
				var hm_mcc:Tween = new Tween(hm_mc,"x",None.easeOut,-300,24,3,true);
				var logo_mcc:Tween  = new Tween(logo_mc,"x",Bounce.easeInOut,500,636,3,true);
				var juego_mcc:Tween  = new Tween(juego_btn,"x",None.easeOut,500,98.50,3,true);
		
				juego_btn.addEventListener(MouseEvent.CLICK,juego);
		}
		public function game (event:MouseEvent):void{
				gotoAndStop(2);
				
				tetris_btn.addEventListener(MouseEvent.CLICK, tetris);
				
				volver_btn.addEventListener(MouseEvent.CLICK,volver);
		}
		
		public function tetris (event:MouseEvent):void{
				navigateToURL(new URLRequest("second.html"));
			}

	}
	
}
