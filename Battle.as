package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;

	public class Battle extends MovieClip {
		private var selectTimer: Timer = new Timer(1000);
		private var myResult: Result;
		public var gameField: Array;
		private var row: Number;
		private var col: Number;
		private var playerLife: int = 9;
		private var enemyLife: int = 9;
		var enemyFieldArray: Array = [
			[0, 2, 0, 3, 3],
			[0, 0, 0, 0, 0],
			[0, 5, 5, 5, 0],
			[0, 4, 4, 0, 0],
			[0, 0, 0, 1, 0]
		];

		public function Battle(gameField: Array) {
			this.addEventListener(MouseEvent.CLICK, onTileClicked);
			this.gameField = gameField;
		}

		private function onTileClicked(e: MouseEvent): void {
			if (playerLife != 0 && enemyLife != 0) {
				row = Math.floor((mouseX - 783.05) / 93.4);
				col = Math.floor((mouseY - 90.9) / 107.75);
				var tile: MovieClip = enemyField.getChildByName("tile" + (col * 5 + row + 1)) as MovieClip;

				// Make sure "tile" is not null before trying to update its frame
				if (enemyFieldArray[col][row] != 0 && tile.isSelected != true) {
					tile.gotoAndStop(4);
					tile.isSelected = true;
					text2.gotoAndStop(2);
					enemyLife--;
				} else if (tile.isSelected != true) {
					tile.gotoAndStop(3);
					tile.isSelected = true;
					text2.gotoAndStop(3);
				}

				selectTimer.addEventListener(TimerEvent.TIMER, enemySelect);
				selectTimer.start();
				text1.gotoAndStop(2);

				// Check if enemyLife is zero after the tile is clicked
				if (enemyLife == 0) {
					endGame();
				}
			} else if (enemyLife == 0) {
				endGame();
			}
		}

		private function enemySelect(event: TimerEvent): void {
			if (playerLife != 0 && enemyLife != 0) {
				var randomRow: uint;
				var randomCol: uint;
				var tile: MovieClip;

				do {
					randomRow = Math.floor(Math.random() * 5);
					randomCol = Math.floor(Math.random() * 5);
					tile = field.getChildByName("tile" + (randomRow * 5 + randomCol + 1)) as MovieClip;
				} while (tile.isSelected);

				trace(randomRow + " " + randomCol);

				if (gameField[randomRow][randomCol] != 0) {
					tile.gotoAndStop(2);
					tile.isSelected = true;
					text2.gotoAndStop(2);
					text1.gotoAndStop(1);
					playerLife--;
				} else {
					tile.gotoAndStop(2);
					tile.isSelected = true;
					text2.gotoAndStop(3);
					text1.gotoAndStop(1);
				}
				selectTimer.stop();

				// Check if playerLife is zero after the enemy selects a tile
				if (playerLife == 0) {
					endGame();
				}
			} else if (playerLife == 0) {
				endGame();
			}
		}

		private function endGame(): void {
			myResult = new Result();
			if (playerLife == 0) {
				myResult.text.gotoAndStop(2);
			}

			addChild(myResult);
			this.removeEventListener(MouseEvent.CLICK, onTileClicked);
			selectTimer.stop();
		}
	}
}