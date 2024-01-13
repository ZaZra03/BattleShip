package {

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class Deployment extends Sprite {
		public var gameField: Array;

		public function Deployment() {
			// constructor code
			setupField();
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
	
	}


}