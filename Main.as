package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Main extends Sprite {

		private var myMenu = new Menu();
		private var myDeployment = new Deployment();
		private var myBattle = new Battle();
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
					myDrawing.drawing1.x = 47.65;
					myDrawing.drawing1.y = 137.95;
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
					addChild(myBattle); // Add the Game instance to the stage
					//myBattle.addChild(myDeployment.field);
					//myBattle.addChild(myDeployment.boat1);
					//myBattle.addChild(myDeployment.boat2);
					//myBattle.addChild(myDeployment.boat3);
					//myBattle.addChild(myDeployment.boat4);
					//myBattle.addChild(myDeployment.boat5);
					//this.gameField = myDeployment.gameField;
					myDifficulty.start.removeEventListener(MouseEvent.CLICK, onPlayClick); // Remove the event listener
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