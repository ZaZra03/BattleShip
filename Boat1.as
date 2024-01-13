package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;


	public class Boat1 extends MovieClip implements Boat {
		public var _boatNumber: int = 1;
		public var _boatSize: int = 1;
		public var _attackDamage: int;
		private var _isPlace: Boolean;
		private var isDrawing: Boolean;
		private var drawingContainer: Sprite; // Changed to Sprite for flexibility
		private var drawingLines: Sprite; // Separate sprite for drawn lines

		public function Boat1() {
			// constructor code
			this.addEventListener(MouseEvent.MOUSE_DOWN, startDrawing);
			this.addEventListener(MouseEvent.MOUSE_MOVE, draw);
			this.addEventListener(MouseEvent.MOUSE_UP, stopDrawing);

			drawingContainer = new Sprite();
			addChild(drawingContainer); // Add the drawing container to the display list

			drawingLines = new Sprite();
			addChild(drawingLines); // Add the drawing lines container to the display list
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
			drawingContainer.graphics.lineStyle(2, 0x000000); // Set line color and thickness
			drawingContainer.graphics.moveTo(drawingContainer.mouseX, drawingContainer.mouseY);
		}

		private function draw(event: MouseEvent): void {
			if (isDrawing) {
				drawingContainer.graphics.lineTo(drawingContainer.mouseX, drawingContainer.mouseY);
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
	}
}