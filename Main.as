package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;


	public class Main extends Sprite {

		private var myMenu = new Menu();
		private var myDeployment = new Deployment();
		private var myBattle = new Battle(myDeployment.gameField);
		private var myField = new Field();
		private var myDifficulty = new Difficulty();
		private var myDrawing = new Drawing();

		private var gameField: Array;

		public function Main(): void {
			addChild(myMenu);

			// Add event listener to the Menu class
			myDeployment.deploymentReady.addEventListener(MouseEvent.CLICK, onPlayClick);
			myMenu.menuPlay.addEventListener(MouseEvent.CLICK, onPlayClick);
			myDifficulty.difficultyStart.addEventListener(MouseEvent.CLICK, onPlayClick);
			myDrawing.next.addEventListener(MouseEvent.CLICK, onPlayClick);

			addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		private function onPlayClick(event: MouseEvent): void {

			// This function is called when menuPlay is clicked in the Menu class
			if (event.currentTarget.parent && event.currentTarget.parent is Menu) {
				var menu: Menu = event.currentTarget.parent as Menu;
				if (menu && menu.parent) {
					menu.parent.removeChild(menu);
					addChild(myDrawing); // Add the Game instance to the stage
					myMenu.menuPlay.removeEventListener(MouseEvent.CLICK, onPlayClick);
				}

			} else if (event.currentTarget.parent && event.currentTarget.parent is Drawing) {
				var drawing: Drawing = event.currentTarget.parent as Drawing;
				if (drawing && drawing.parent) {
					drawing.parent.removeChild(drawing);

					myDeployment.addChild(myDrawing.drawing1);
					myDrawing.drawing1.disableDrawing();
					myDrawing.drawing1.buttonMode = true;
					myDrawing.drawing1.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing1.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
					myDrawing.drawing1.width = 93;
					myDrawing.drawing1.height = 107;
					myDrawing.drawing1.x = 47.65;
					myDrawing.drawing1.y = 134.7;

					myDeployment.addChild(myDrawing.drawing2);
					myDrawing.drawing2.disableDrawing();
					myDrawing.drawing2.buttonMode = true;
					myDrawing.drawing2.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing2.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
					myDrawing.drawing2.width = 93;
					myDrawing.drawing2.height = 107;
					myDrawing.drawing2.x = 47.65;
					myDrawing.drawing2.y = 241.7;

					myDeployment.addChild(myDrawing.drawing3);
					myDrawing.drawing3.disableDrawing();
					myDrawing.drawing3.buttonMode = true;
					myDrawing.drawing3.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing3.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
					myDrawing.drawing3.width = 186;
					myDrawing.drawing3.height = 107;
					myDrawing.drawing3.x = 47.65;
					myDrawing.drawing3.y = 348.7;

					myDeployment.addChild(myDrawing.drawing4);
					myDrawing.drawing4.disableDrawing();
					myDrawing.drawing4.buttonMode = true;
					myDrawing.drawing4.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing4.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
					myDrawing.drawing4.width = 186;
					myDrawing.drawing4.height = 107;
					myDrawing.drawing4.x = 47.65;
					myDrawing.drawing4.y = 455.7;

					myDeployment.addChild(myDrawing.drawing5);
					myDrawing.drawing5.disableDrawing();
					myDrawing.drawing5.buttonMode = true;
					myDrawing.drawing5.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing5.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
					myDrawing.drawing5.width = 279;
					myDrawing.drawing5.height = 107;
					myDrawing.drawing5.x = 47.65;
					myDrawing.drawing5.y = 562.7;


					//myDrawing.drawing1.height = 500;
					//myDrawing.drawing1.width = 500;
					addChild(myDeployment); // Add the Game instance to the stage

					myDrawing.next.removeEventListener(MouseEvent.CLICK, onPlayClick);
				}
			} else if (event.currentTarget.parent && event.currentTarget.parent is Deployment) {
				var deployment: Deployment = event.currentTarget.parent as Deployment;
				if (deployment && deployment.parent) {
					deployment.parent.removeChild(deployment);
					addChild(myDifficulty); // Add the Game instance to the stage

					myDrawing.drawing1.buttonMode = false;
					myDrawing.drawing1.removeEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing1.removeEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

					myDrawing.drawing2.buttonMode = false;
					myDrawing.drawing2.removeEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing2.removeEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

					myDrawing.drawing3.buttonMode = false;
					myDrawing.drawing3.removeEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing3.removeEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

					myDrawing.drawing4.buttonMode = false;
					myDrawing.drawing4.removeEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing4.removeEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

					myDrawing.drawing5.buttonMode = false;
					myDrawing.drawing5.removeEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
					myDrawing.drawing5.removeEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
					//myBattle.addChild(myDeployment.boat1);
					//myBattle.addChild(myDeployment.boat2);
					//myBattle.addChild(myDeployment.boat3);
					//myBattle.addChild(myDeployment.boat4);
					//myBattle.addChild(myDeployment.boat5);
					//this.gameField = myDeployment.gameField;
					myDeployment.deploymentReady.removeEventListener(MouseEvent.CLICK, onPlayClick); // Remove the event listener
				}
			} else if (event.currentTarget.parent && event.currentTarget.parent is Difficulty) {
				var difficulty: Difficulty = event.currentTarget.parent as Difficulty;
				if (difficulty && difficulty.parent) {
					difficulty.parent.removeChild(difficulty);

					myBattle.addChild(myDrawing.drawing1);
					myDrawing.drawing1.x = myDrawing.drawing1.x - 376.5;
					myDrawing.drawing1.y = myDrawing.drawing1.y - 43.8;

					myBattle.addChild(myDrawing.drawing2);
					myDrawing.drawing2.x = myDrawing.drawing2.x - 376.5;
					myDrawing.drawing2.y = myDrawing.drawing2.y - 43.8;

					myBattle.addChild(myDrawing.drawing3);
					myDrawing.drawing3.x = myDrawing.drawing3.x - 376.5;
					myDrawing.drawing3.y = myDrawing.drawing3.y - 43.8;

					myBattle.addChild(myDrawing.drawing4);
					myDrawing.drawing4.x = myDrawing.drawing4.x - 376.5;
					myDrawing.drawing4.y = myDrawing.drawing4.y - 43.8;

					myBattle.addChild(myDrawing.drawing5);
					myDrawing.drawing5.x = myDrawing.drawing5.x - 376.5;
					myDrawing.drawing5.y = myDrawing.drawing5.y - 43.8;

					addChild(myBattle); // Add the Game instance to the stage
					//myBattle.addChild(myDeployment.field);
					//myBattle.addChild(myDeployment.boat1);
					//myBattle.addChild(myDeployment.boat2);
					//myBattle.addChild(myDeployment.boat3);
					//myBattle.addChild(myDeployment.boat4);
					//myBattle.addChild(myDeployment.boat5);
					//this.gameField = myDeployment.gameField;
					myDifficulty.difficultyStart.removeEventListener(MouseEvent.CLICK, onPlayClick);

				}
			}
		}

		private function gameLoop(e: Event): void {
			// Your game loop code here
		}

		private var originalPosX: Number;
		private var originalPosY: Number;

		var plantRow: int;
		var plantCol: int;


		private function onBoatClicked(e: MouseEvent): void {
			if (e.currentTarget is Boat) {
				var clickedBoat: Boat = e.currentTarget as Boat;
				if (e.type == MouseEvent.MOUSE_DOWN) {
					originalPosX = e.currentTarget.x;
					originalPosY = e.currentTarget.y;

					if (clickedBoat.isPlace) {
						// Use the stored values from the previous MOUSE_UP event
						for (var i: uint = 0; i < clickedBoat.boatSize; i++) {
							myDeployment.gameField[plantRow][plantCol + i] = 0;
						}
					}
					e.currentTarget.startDrag();
				} else if (e.type == MouseEvent.MOUSE_UP) {
					plantRow = Math.floor((e.currentTarget.y - 134.7) / 107.75);
					plantCol = Math.floor((e.currentTarget.x - 406.5) / 93.4);

					if ((plantRow >= 0 && plantRow < 5) && (plantCol >= 0 && plantCol < 5)) {
						e.currentTarget.x = (93.4 * plantCol) + 406.5;
						e.currentTarget.y = (107.75 * plantRow) + 134.7;


						// Loop for the object size
						for (var j: uint = 0; j < clickedBoat.boatSize; j++) {
							myDeployment.gameField[plantRow][plantCol + j] = clickedBoat.boatNumber;
						}

						clickedBoat.isPlace = true;

					} else {
						if (!clickedBoat.isPlace) {
							e.currentTarget.x = originalPosX;
							e.currentTarget.y = originalPosY;
						}

					}
					traceGameFieldValues();
					e.currentTarget.stopDrag();
				}
			}
		}

		private function traceGameFieldValues(): void {
			for (var i: uint = 0; i < 5; i++) {
				var rowOutput: String = "";
				for (var j: uint = 0; j < 5; j++) {
					rowOutput += myDeployment.gameField[i][j];
					if (j < 4) {
						rowOutput += ", ";
					}
				}
				trace(rowOutput);

			}
			trace("");
		}
	}
}