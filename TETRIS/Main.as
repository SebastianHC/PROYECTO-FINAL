package {
	//LIBRERIAS QUE SE USARAN
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	//CLASE 
	public class Main extends Sprite{
		//DECLARACION DE LAS VARIABLES
		const TS:uint = 24;
		var fieldArray:Array;//MATRIZ QUE REPRESENTA NUMERICAMENTE EL ESCENARIO DEL JUEGO
		var fieldSprite:Sprite;//REPRESENTA GRAFICAMENTE EL ESCENARI DEL JUEGO
		var tetrominoes:Array = new Array();//ARRAY PARA LAS FIGURAS
		var colors:Array = new Array();//ARRAY PARA LA MATRIZ CON VALOR HEXADECIMAL DE CADA COLOR DE LA FIGURA
		var tetromino:Sprite;//ES LO QUE REPRESENTA EN SI LA FIGURA (TETRONOMIO) POR MEDIO DEL DISPLAY OBJECT.
		var currentTetromino:int;//ES EL NUMERO DEL TETRONOMIO ACTUALMENTE DE EL JUEGO Y ESTARA EN UN RANGO DE 0 A 6
		var siguiente:int;//VARIABLE PARA EL SIGUIENTE TETROMINO DIBUJADO POR FUERA.
		var rotacion:int;//ES LA ROTACION DEL TETRONOMIO QUE VA DE 0 A 3, YA QUE UN TETRONOMIO PUEDE TENER 4 ROTACIONES DISTINTAS
		var vertical:int;//VARIABALE PARA LA POSICION VERTICAL
		var horizon:int;//VARIABLE PARA LA POSICION HORIZONTAL
		var time:Timer = new Timer(500);//VARIABLE QUE QUE ACTIVAR EL DETECTOR DE EVENTOS EN 500 MILI SEG.
		var gameOver:Boolean = false;//VARIABLE QUE NOS INDICARA SI EL JUEGO HA TERMINADO.
		/*
		//Varaiables contadoras del tiempo de cada jugador
		var tmp1:int = 0;
		var tmp2:int = 0;
		var tmp3:int = 0;
		var tmp4:int = 0;
		var timer:Timer = new Timer(1000, cont1++);
		var segundos:int = 0;
		var segundos2:int = 0;
		var minutos:int = 0;
		var minutos2:int = 0;
		var cont1:int = 0;*/


		//FUNCION PARA
		public function Main(){
			generateField();
			initTetrominoes();
			siguiente = Math.floor(Math.random() * 8);
			generateTetromino();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKDown);
			
		}
		
		/*function inicio ():void{
			juego_btn.addEventListener(MouseEvent.CLICK,juego);
				
				function juego(event:MouseEvent):void{
				/*gotoAndStop(2);
				}
				juego_btn.addEventListener(MouseEvent.CLICK,juego);
				
				var poli_mcc:Tween  = new Tween(poli_mc,"x",Bounce.easeOut,-100,15.95,4,true);
				var nombre_mcc:Tween = new Tween(nombre_mc,"x",None.easeOut,-300,16.95,3,true);
				var pra_mcc:Tween = new Tween(pra_mc,"x",None.easeOut,550,16.95,3,true);
				var hm_mcc:Tween = new Tween(hm_mc,"x",None.easeOut,-300,16.95,3,true);
				var logo_mcc:Tween  = new Tween(logo_mc,"x",Bounce.easeInOut,500,425,3,true);
				var inicio_btn:Tween  = new Tween(inicio_btn,"x",Bounce.easeInOut,500,227.30,3,true);
		}*/
		
		//ESTA FUNCION REPRESENTA EL FONDO DEL ESCENARIO TIPO AJEDREZ.
		function generateField():void{
			//VARIABLE QUE DEFINE LOS COLRES DEL TABLERO.
			var colors:Array = new Array("0x4444444","0x5555555");
			fieldArray = new Array;
			var fieldSprite:Sprite = new Sprite;
			addChild(fieldSprite);
			fieldSprite.graphics.lineStyle(0, 0x000000);
			for (var i:uint = 0; i < 20; i++){
				fieldArray[i] = new Array;
				for (var j:uint = 0; j < 10; j++){
					fieldArray[i][j] = 0;
					fieldSprite.graphics.beginFill(colors[(j% 2 + i % 2) % 2]);
					fieldSprite.graphics.drawRect(TS * j, TS * i, TS, TS);
					fieldSprite.graphics.endFill();
				}
			}
		}
		//ESTA FUNCION INICIALIZARA LOS ARRAYS DE LAS FIGUARAS(TETRONOMIOS)
		function initTetrominoes():void{
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[0] =  [
			// FIGURA EN I
			[
				[0,0,0,0],
				[1,1,1,1],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,0,0],
				[0,1,0,0],
				[0,1,0,0],
				[0,1,0,0]
			],
			[
				[0,0,0,0],
				[1,1,1,1],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,0,0],
				[0,1,0,0],
				[0,1,0,0],
				[0,1,0,0]
			]
			];
			colors[0] = 0x00FFFF;
			//FIGURA EN J
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[1] = [
			[
				[0,0,1,0],
				[0,0,1,0],
				[0,1,1,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[0,1,0,0],
				[0,1,1,1],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[0,1,1,0],
				[0,1,0,0],
				[0,1,0,0]
			],
			[
				[0,0,0,0],
				[0,1,1,1],
				[0,0,0,1],
				[0,0,0,0]
			]
			];
			colors[1] = 0xAA00FF;
			//FIGURA EN L
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[2] = [
			[
				[0,0,0,0],
				[1,1,1,0],
				[1,0,0,0],
				[0,0,0,0]
			],
			[
				[1,1,0,0],
				[0,1,0,0],
				[0,1,0,0],
				[0,0,0,0]
			],
			[
				[0,0,1,0],
				[1,1,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,0,0],
				[0,1,0,0],
				[0,1,1,0],
				[0,0,0,0]
			]
			];
			colors[2] = 0xFFA500;
			//FIGURA EN T
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[3] = [
			[
				[0,1,0,0],
				[1,1,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,0,0],
				[1,1,0,0],
				[0,1,0,0],
				[0,0,0,0]
			],
			[
				[0,0,1,0],
				[0,0,1,1],
				[0,0,1,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[1,1,1,0],
				[0,1,0,0],
				[0,0,0,0]
			]
			];
			colors[3] = 0x0000FF;
			//FIGURA EN Z
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[4] = [
			[
				[0,0,0,0],
				[1,1,0,0],
				[0,1,1,0],
				[0,0,0,0]
			],
			[
				[0,0,1,0],
				[0,1,1,0],
				[0,1,0,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[1,1,0,0],
				[0,1,1,0],
				[0,0,0,0]
			],
			[
				[0,0,1,0],
				[0,1,1,0],
				[0,1,0,0],
				[0,0,0,0]
			]
			];
			colors[4] = 0xFF0000;
			//FIGURA EN S
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[5] = [
			[
				[0,0,0,0],
				[0,1,1,0],
				[1,1,0,0],
				[0,0,0,0]
			],
			[
				[0,1,0,0],
				[0,1,1,0],
				[0,0,1,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[0,1,1,0],
				[1,1,0,0],
				[0,0,0,0]
			],
			[
				[0,1,0,0],
				[0,1,1,0],
				[0,0,1,0],
				[0,0,0,0]
			]
			];
			colors[5] = 0x00FF00;
			//FIGURA EN O
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[6] = [
			[
				[0,1,1,0],
				[0,1,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,1,0],
				[0,1,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,1,0],
				[0,1,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,1,1,0],
				[0,1,1,0],
				[0,0,0,0],
				[0,0,0,0]
			]
			];
			colors[6] = 0xFFFF00;
			//FIGURA DE UN SOLO CUADRO
			//MATRIZ DE 4 DIMENSIONES 4*4
			tetrominoes[7] = [
			[
				[0,0,0,0],
				[0,0,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[0,0,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[0,0,1,0],
				[0,0,0,0],
				[0,0,0,0]
			],
			[
				[0,0,0,0],
				[0,0,1,0],
				[0,0,0,0],
				[0,0,0,0]
			]
			];
			colors[7] = 0xFFAA00;
		}
		//ESTA FUNCION GENERA UN AFIGURA ALEATORIA PARA QUE SEA COLOCADO EN EL CAMPO DEL JUEGO
		function generateTetromino():void{
			if (!gameOver){
				currentTetromino = siguiente;
				//GENERA LA FIGURA DE MANERA ALEATORIA CON LOS NUMEROS ENTEROS DE LAS POSIBLES FIGURAS
				siguiente = Math.floor(Math.random() * 8);
				drawNext();
				//	ROTACION DE LA FIGURA
				rotacion = 0;
				//SE PONE EN 0 PARA COLOCAR EL TETRONOMIO EN LA PARTE DE ARRIBA DEL ESCENARIO
				vertical = 0;
				if (tetrominoes[currentTetromino][0][0].indexOf(1) == -1){
					vertical= -1;
				}
				//SIEMPRE SE PONE EN 3 YA QUE LAS FIGURA ESTAN EN UNA MATRIZ DE 4 ELEMENTOS Y AL CENTRARLO EN EL CAMPO
				//DE LAS 10 COLUMNAS SU ORIGEN DEBE ESTAR EN 10-4/2=3 PARA LA POSICION CENTRADA EN DICHO ESCENARIO
				horizon = 3;
				drawTetromino();
				if (canFit(vertical,horizon,rotacion)){
					time.addEventListener(TimerEvent.TIMER,onTime);
					time.start();
				}else{
					gameOver = true;
				}
			}
		}
		
		function drawTetromino():void{
			var ct:uint = currentTetromino;
			tetromino = new Sprite;
			addChild(tetromino);
			//SE CONSTRUYE LA FIGURA
			//LLAMA AL METODO PARA CREAR DICHA FIGURA
			tetromino.graphics.lineStyle(0, 0x000000);
			//ESTOS CICLOS FOR BUSCAN ELEMENTOS EN LA MATRIZ EN RELACION CON EL TETRONOMIO ACTUAL EN LA ROTACION ACTUAL.
			for (var i:int=0; i < tetrominoes[ct][rotacion].length; i++){
				for (var j:int=0; j < tetrominoes[ct][rotacion][i].length; j++){
					if (tetrominoes[ct][rotacion][i][j] == 1){
						//SE DIBUJA UN CUADRO SIMILARMENTE COMO SE HACIA EN EL FONDO DEL ESCENARIO.
						tetromino.graphics.beginFill(colors[ct]);
						tetromino.graphics.drawRect(TS * j, TS * i, TS, TS);
						tetromino.graphics.endFill();
					}
				}
			}
			placeTetromino();
		}
		//AQUI SIMPLEMETE CENTRA EL TETRONOMIO DE ACUERDO A LAS POSICIONES DE LAS VARIABLES DE HORIZONTAL Y VERTICALMENTE
		function placeTetromino():void{
			tetromino.x = horizon * TS;
			tetromino.y = vertical * TS;
		}
		//FUNCION PARA MANEJAR LAS TECLAS Y MOVER LAS FIGURAS
		function onKDown(event:KeyboardEvent):void{
			if (! gameOver){
				switch (event.keyCode){
					case 37 :
					//SE INDICA SI UNA FIGURA PUEDE CABER EN LA POSICION
						if (canFit(vertical,horizon - 1,rotacion)){
							horizon--;
							placeTetromino();
						}
						break;
					case 38 :
						var rot:uint = rotacion + 1 % tetrominoes[currentTetromino].length;
						if (rot == 4){
							rot = 0;
						}
						if (canFit(vertical,horizon,rot)){
							rotacion = rot;
							removeChild(tetromino);
							drawTetromino();
							placeTetromino();
						}
						break;
					case 39 :
						if (canFit(vertical,horizon + 1,rotacion)){
							horizon++;
							placeTetromino();
						}
						break;
					case 40 :
						if (canFit(vertical + 1,horizon, rotacion)){
							vertical++;
							placeTetromino();
						}else{
							//SIRVE PARA GESTIONAR LA COLISION
							landTetromino();
							//GENERA UN NUEVO TETRONOMIO
							generateTetromino();
						}
						break;
				}
			}
		}
		//FUNCION QUE DA DOS ARGUMENTOS ENTEROS PARA LA FILA Y LA COLUMNA CANDIDATA Y REGRESA UN TRUE SI LA FIGURA ENCAJA EN LAS COORDENADAS
		//DE LO CONTRARIO FALSE SI NO ENCAJA.
		function canFit(row:int,col:int,side:uint):Boolean{
			var ct:uint = currentTetromino;
			//CICLOS QUE VERIFICAN LAS PIEZAS ACTUALES
			for (var i:int = 0; i < tetrominoes[ct][side].length; i++){
				for (var j:int = 0; j < tetrominoes[ct][side][i].length; j++){
					if (tetrominoes[ct][side][i][j] == 1){
						//Out of left Boundary
						if (col + j < 0){
							//REGRESA UN FALSE SI NO ENCAJA
							return false;
						}
						//
						if (col + j > 9){
							//REGRESA UN FALSE SI NO ENCAJA
							return false;
						}
						//
						if (row + i > 19){
							//REGRESA UN FALSE SI NO ENCAJA
							return false;
						}
						//
						if (fieldArray[row + i][col + j] == 1){
							//REGRESA UN FALSE SI NO ENCAJA
							return false;
						}
					}
				}
			}
			//REGRESA UN TRUE SI ENCAJA
			return true;
		}
		//FUNCION 
		function landTetromino():void{
			var ct:uint = currentTetromino;
			//REPRESENTA CADA PIEZA DEL TETRONOMIO
			var landed:Sprite;
			//CICLOS QUE VERIFICAN LAS PIEZAS ACTUALES
			for (var i:int = 0; i < tetrominoes[ct][rotacion].length; i++){
				for (var j:int = 0; j < tetrominoes[ct][rotacion][i].length; j++){
					if (tetrominoes[ct][rotacion][i][j] == 1){
						landed = new Sprite  ;
						addChild(landed);
						//DIBUJA UN CUADRO DONDE DEBE DE ESTAR LA PIEZA
						landed.graphics.lineStyle(0, 0x000000);
						landed.graphics.beginFill(colors[rotacion]);
						landed.graphics.drawRect(TS * (horizon + j), TS * (vertical + i), TS, TS);
						landed.graphics.endFill();
						landed.name = "r" + (vertical + i) + "c" + (horizon + j);
						//ACTUALIZACION DE LA MATRIZ MARCANDO QUE ESTA EN 1 (OCUPADO)
						fieldArray[vertical + i][horizon + j] = 1;
					}
				}
			}
			//SE QUITA LA FIGURA Y LLEGA OTRA POR LA PARTE SUPERIOR DEL ESCENARIO.
			removeChild(tetromino);
			time.removeEventListener(TimerEvent.TIMER, onTime);
			time.stop();
			//FUNCIN QUE VERIFICA LAS LINEAS COMPLETADAS.
			checkForLines();
		}
		//FUNCION PARA CHECAR LAS LINEAS
		function checkForLines():void{
			//SE VERIFICAN LAS 20 LINEAS DEL ESCENARIO
			for (var i:int = 0; i<20; i ++){
				if (fieldArray[i].indexOf(0) == -1){
					for (var j :int =0; j<10; j++){
						fieldArray[i][j] = 0;
						removeChild(getChildByName("r" + i + "c" + j));
						//SI SE COMPLETAN LAS FIGURAS EN UNA LINEA SE LEIMINAN
					}
					//SE ESCANEAN TODAS LAS FILAS SOBRE LAS FILAS QUE SE ACABAN DE ELIMNAR
					for (j = i; j>= 0; j--){
						for (var k:int = 0; k<10; k++){
							if (fieldArray[j][k] == 1){
								fieldArray[j][k] = 0;
								fieldArray[j + 1][k] = 1;
								getChildByName("r" + j + "c" + k ).y +=TS;
								getChildByName("r" + j + "c" + k ).name = "r"+ (j+1)+"c"+k;
							}
						}
					}
				}
			}
		}
		function onTime(e: TimerEvent):void{
			if (canFit(vertical + 1, horizon, rotacion)){
				vertical++;
				placeTetromino();
			}else{
				landTetromino();
				generateTetromino();
			}
		}
		//FUNCION PARA DIBUJAR LA FIGURA EN OTRO SITIO.
		function drawNext():void{
			if (getChildByName("next") != null){
				removeChild(getChildByName("next"));
				}
				//VARIABLE PARA LA FIGURA.
			var next_t:Sprite = new Sprite  ;
			next_t.x = 300;
			next_t.name = "next";
			addChild(next_t);
			next_t.graphics.lineStyle(0, 0x000000);
			for (var i : int = 0; i<tetrominoes[siguiente][0].length; i++){
				for (var j:int = 0; j<tetrominoes[siguiente][0][i].length; j++){
					if (tetrominoes[siguiente][0][i][j] == 1){
						next_t.graphics.beginFill(colors[siguiente]);
						next_t.graphics.drawRect(TS * j,TS * i,TS,TS);
						next_t.graphics.endFill();
					}
/*					//Inicio del timer
					timer.start();
					timer.addEventListener(TimerEvent.TIMER, Tiempo);

					//Tiempo del juego
					function Tiempo(event:TimerEvent):void{
						//Segundos
						segundos++;
						if(segundos > 9){
							segundos2++;
							segundos = 0;
	}
					if(segundos2 == 6){
						minutos++;
						segundos2 = 0;
	}
					//Minutos
					if(minutos > 9){
						minutos2++;
						minutos = 0;
	}
					if(minutos2 == 6){
						segundos = 0;
						segundos2 = 0;
						minutos = 0;
						minutos2 = 0;
	}
					//Imprimir tiempo de juego
					tiempo_Out.text = "" + minutos2 + minutos + ":" + segundos2 + segundos;
}*/
				}
			}
		}
	}
}