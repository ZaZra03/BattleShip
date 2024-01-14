package {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class Battle extends MovieClip {
		private var selectTimer: Timer = new Timer(1000);
		public var gameField: Array;
		private var _start: Boolean;

		public function Battle(gameField: Array) {
			this.gameField = gameField;
			_start = false; // By default, don't start the timer
		}

		public function set start(value: Boolean): void {
			_start = value;

			if (_start) {
				selectTimer.addEventListener(TimerEvent.TIMER, enemySelect);
				selectTimer.start(); // Start the timer
			} else {
				selectTimer.removeEventListener(TimerEvent.TIMER, enemySelect);
				selectTimer.stop(); // Stop the timer
			}
		}

		public function get start(): Boolean {
			return _start;
		}

		private function enemySelect(event: TimerEvent): void {
			var row: uint = Math.floor(Math.random() * 5);
			var col: uint = Math.floor(Math.random() * 5);
			var oneD: uint = row * 5 + col + 1;
			var tileName: String = "tile" + oneD;

			// Access the "field" MovieClip and then access its "tile" MovieClip
			var tile: MovieClip = field.getChildByName(tileName) as MovieClip;

			// Make sure "tile" is not null before trying to update its frame
			if (gameField[row][col] != 0 && tile.isSelected != true) {
				tile.gotoAndStop(2);
				tile.isSelected = true;
				text2.gotoAndStop(2);
				trace("Enemy selected at: " + row + ", " + col);
				trace(tile);
			} else if (tile.isSelected != true) {
				tile.gotoAndStop(2);
				tile.isSelected = true;
				text2.gotoAndStop(3);
			}
		}
	}
}