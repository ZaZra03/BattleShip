package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Tile2 extends MovieClip {
		private var isClicked: Boolean = false;
		private var _isSelected: Boolean;

		public function Tile2() {
			// constructor code
			stop(); // Use stop() instead of gotoAndStop(1) to avoid issues

			this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
			this.addEventListener(MouseEvent.CLICK, onClick);
		}

		public function set isSelected(value: Boolean): void {
			_isSelected = value;
		}

		public function get isSelected(): Boolean {
			return _isSelected;
		}

		private function onRollOver(event: MouseEvent): void {
			if (!isClicked) {
				this.buttonMode = true;
				gotoAndStop(2);
			}
		}

		private function onRollOut(event: MouseEvent): void {
			if (!isClicked) {
				this.buttonMode = true;
				gotoAndStop(1);
			}
		}

		private function onClick(event: MouseEvent): void {
			if (isClicked) {
				gotoAndStop(1);
				this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			} else {
				gotoAndStop(2);
				this.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
			}

			isClicked = !isClicked; // Toggle the state
		}
	}
}