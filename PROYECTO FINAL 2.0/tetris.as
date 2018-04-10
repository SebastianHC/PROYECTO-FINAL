package  {
	import flash.events.MouseEvent;
	/*import fl.controls.ColorPicker;
	import fl.events.ColorPickerEvent;
	import flash.geom.ColorTransform;*/
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import fl.transitions.*;
	import flash.events.Event;
	import flash.utils.Timer;

	/*import flash.utils.Timer;
	import flash.events.TimerEvent;*/
	
	public class tetris extends MovieClip {
		//Declaracion de varaibles
		/*var jugadores:Array = [];
		var fichas:Array = [];
		var limiteJ:int;
		var n:int = -1;
		
		
		
		var fondo:Array=[];
		var fondo2: Array=[];
		var posx:int=20;
		var posy:int=30;
		var cont:int=0;
		var randomm:int;
		var c1:int;
		var c2:int;
		var c3:int;
		var c4:int;
		var figura1:int;
		var figura2:int;
		var figura3:int;
		var figura4:int;
		var figura5:int;
		var figura6:int;
		var figura7:int;
		var tipofigura:int=0;
		var a:int;
		var m:int;
		var margen:int;
		var r:int=0;
		var t:int=19;
		var cont2:int=0;
		var score:int=50;*/
		var d:int;
		/*var Loser=new loser();
		var Winner=new winner(); 
		
		var cent_segundos:Timer = new Timer(50,0);*/
		
		public function tetris(){
			/*var poli_mcc:Tween  = new Tween(poli_mc,"x",Bounce.easeOut,-100,32.85,4,true);
			var nombre_mcc:Tween = new Tween(nombre_mc,"x",None.easeOut,-300,34.20,3,true);
			var pra_mcc:Tween = new Tween(pra_mc,"x",None.easeOut,550,19.05,3,true);
			var hm_mcc:Tween = new Tween(hm_mc,"x",None.easeOut,-300,21.20,3,true);
			var juego_btn:Tween  = new Tween(juego_btn,"y",Regular.easeInOut,410,588.25,3,true);
			var logo_mcc:Tween  = new Tween(logo_mc,"x",Bounce.easeInOut,500,574.85,3,true);*/
			
			juego_btn.addEventListener(MouseEvent.CLICK,juego);
			/*timer.addEventListener(TimerEvent.TIMER, Tiempo);*/
		}
		
			public function juego(event:MouseEvent):void{
				trace("entra");
				gotoAndStop(2);
				/*juego2_btn.addEventListener(MouseEvent.CLICK,juego2);*/
				volver1_btn.addEventListener(MouseEvent.CLICK,volver1);
				juego_btn.addEventListener(MouseEvent.CLICK,juego);
			}
			
			public function volver1(event:MouseEvent):void{
				gotoAndStop(1);
				var poli_mcc:Tween  = new Tween(poli_mc,"x",Bounce.easeOut,-100,32.85,4,true);
				var nombre_mcc:Tween = new Tween(nombre_mc,"x",None.easeOut,-300,34.20,3,true);
				var pra_mcc:Tween = new Tween(pra_mc,"x",None.easeOut,550,19.05,3,true);
				var hm_mcc:Tween = new Tween(hm_mc,"x",None.easeOut,-300,21.20,3,true);
				var juego_btn:Tween  = new Tween(juego_btn,"y",Regular.easeInOut,410,588.25,3,true);
				var logo_mcc:Tween  = new Tween(logo_mc,"x",Bounce.easeInOut,500,574.85,3,true);
			
				juego_btn.addEventListener(MouseEvent.CLICK,juego);
				
			}
			
			public function level (event:MouseEvent):void{
				gotoAndStop(4);
				d=4;
				level_txt.text="1";
				dos_btn.visible=false;
				uno_btn.visible=false;
				
				uno_btn.addEventListener(MouseEvent.CLICK,level);
				dos_btn.addEventListener(MouseEvent.CLICK,level);
			}
			
			public function level2 (event:MouseEvent):void{
				d=3;
				level_txt.text="2";
				dos_btn.visible=false;
				uno_btn.visible=false;
				
				
			}
			/*
			score_txt.text="000";
			
			
	/**********************		


			
			
			
			
			}
			// SELECCION DE JUGADORES
			/*
			//Ocultar los controles de ingreso de jugadores hasta que se seleccione un modo
			nombre_In.visible = false;
			guardar_btn.visible = false;
			juego_btn.visible = false;
			nombre_txt.visible = false;

			//Funciones de los botones de seleccion de numero de jugadores
			//Un jugador
			function UnJugador(event:MouseEvent):void{
				limiteJ = 1;
				nombre_In.visible = true;
				guardar_btn.visible = true;
				nombre_txt.visible = true;
				n = 0;
}
				unJugador_btn.addEventListener(MouseEvent.CLICK, UnJugador);

			//Dos jugadores
			function DosJugadores(event:MouseEvent):void{
				limiteJ = 2;
				nombre_In.visible = true;
				guardar_btn.visible = true;
				nombre_txt.visible = true;
				n = 0;
}
				dosJugadores_btn.addEventListener(MouseEvent.CLICK, DosJugadores);

				//Funcion para el registro de jugadores
				function RegistroJugadores(event:MouseEvent):void{
					//Valdiar que no este vacio
					if(nombre_In.length == 0){
					alerta_Out.text = "Ingrese nombre del jugador";
}
					else{
					//Guardar el nombre y el color seleccionado
					jugadores.push(nombre_In.text);
		
					if(n == 0){
					fichas.push(ficha1);
					ficha1.visible = true;
		}
					else if(n == 1){
					fichas.push(ficha2);
					ficha2.visible = true;
		}
		/*if(n == 3){
			fichas.push(ficha3);
			ficha3.visible = true;
		}*
		
					nombre_In.text = "";
		
					//Mostrar el boton para iniciar el juego hasta que todos los jugadores esten registrados
					if(jugadores.length == limiteJ){
					juego_btn.visible = true;
		}
					//Inidicar que ya se registraron todos los jugadores
					if(jugadores.length == limiteJ){
					alerta_Out.text = "Jugadores registrados";
		}
					//Indicar que no se puede ingresar mas nombres de los seleccionados y borrar el excendente
					if(jugadores.length > limiteJ){
					alerta_Out.text = "Maximo de jugadores alcanzado";
					jugadores.pop();
		}
	}
					//Cambiar a la sig ficha
					n++;
}
					guardar_btn.addEventListener(MouseEvent.CLICK, RegistroJugadores);

					//Funcion para iniciar el juego
					function IniciarJuego(event:MouseEvent):void{
					gotoAndStop(3);
}
					juego_btn.addEventListener(MouseEvent.CLICK, IniciarJuego);

					//Funcion para volver a las reglas
					function Volver2(event:MouseEvent):void{
					gotoAndStop(5);
}
					volver3_btn.addEventListener(MouseEvent.CLICK, Volver2);


					//ELEGIR COLOR CON COLOR PICKER
					var mycolor:ColorTransform = new ColorTransform();

					color.addEventListener(ColorPickerEvent.CHANGE, colorChanger);

					function colorChanger(event:ColorPickerEvent):void{
					mycolor.color = color.selectedColor;
					if(n == 0){
					ficha1.transform.colorTransform = mycolor;
		}
					else if(n == 1){
					ficha2.transform.colorTransform = mycolor;
	}
	/*else{
		if(n == 3){
			ficha3.transform.colorTransform = mycolor;
		}
	}
}
			
*/
	
	}
}