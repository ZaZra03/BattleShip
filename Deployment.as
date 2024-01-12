package {

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class Deployment extends Sprite {
		public var gameField: Array;

		public function Deployment() {
			// constructor code
			setupField();
			addBoats();

			//this.addEventListener(MouseEvent.CLICK, placePlant);

		}

		private function setupField(): void {
			gameField = new Array();
			for (var i: uint = 0; i < 5; i++) {
				gameField[i] = new Array();
				for (var j: uint = 0; j < 5; j++) {
					gameField[i][j] = 0;
				}
			}
		}

		private function addBoats(): void {
			// Boat 1
			//this.boat1.buttonMode = true;
			//this.boat1.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
			//this.boat1.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

			// Boat 2
			//this.boat2.buttonMode = true;
			//this.boat2.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
			//this.boat2.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

			// Boat 3
			//this.boat3.buttonMode = true;
			//this.boat3.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
			//this.boat3.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

			// Boat 4
			//this.boat4.buttonMode = true;
			//this.boat4.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
			//this.boat4.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);

			// Boat 5
			//this.boat5.buttonMode = true;
			//this.boat5.addEventListener(MouseEvent.MOUSE_DOWN, onBoatClicked);
			//this.boat5.addEventListener(MouseEvent.MOUSE_UP, onBoatClicked);
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
							gameField[plantRow][plantCol + i] = 0;
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
							gameField[plantRow][plantCol + j] = clickedBoat.boatNumber;
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
					rowOutput += gameField[i][j];
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