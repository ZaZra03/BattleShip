package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Boat2 extends MovieClip implements Boat {
		public var _boatNumber: int = 2;
		public var _boatSize: int = 1;
		public var _attackDamage: int;
		private var _isPlace: Boolean;
		private var isDrawing: Boolean;

		public function Boat2() {
			// constructor code
			this.addEventListener(MouseEvent.MOUSE_DOWN, startDrawing);
			this.addEventListener(MouseEvent.MOUSE_MOVE, draw);
			this.addEventListener(MouseEvent.MOUSE_UP, stopDrawing);
		}

		public function get boatNumber(): int {
			return _boatNumber;
		}

		public function get boatSize(): int {
			return _boatSize;
		}

		public function get attackDamage(): int {
			return _attackDamage;
		}

		public function get isPlace(): Boolean {
			return _isPlace;
		}

		public function set isPlace(value: Boolean): void {
			_isPlace = value;
		}

		private function startDrawing(event: MouseEvent): void {
			isDrawing = true;
			this.graphics.lineStyle(2, 0x000000); // Set line color and thickness
			this.graphics.moveTo(this.mouseX, this.mouseY);
		}

		private function draw(event: MouseEvent): void {
			if (isDrawing) {
				this.graphics.lineTo(this.mouseX, this.mouseY);
			}
		}

		private function stopDrawing(event: MouseEvent): void {
			isDrawing = false;
		}

		public function disableDrawing(): void {
			this.removeEventListener(MouseEvent.MOUSE_DOWN, startDrawing);
			this.removeEventListener(MouseEvent.MOUSE_MOVE, draw);
			this.removeEventListener(MouseEvent.MOUSE_UP, stopDrawing);
		}

		public function clearDrawing(): void {
			this.graphics.clear(); // Clear the drawing lines
		}
	}
}