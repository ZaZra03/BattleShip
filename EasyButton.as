package {
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;;
	import flash.display.DisplayObject;

	public class EasyButton extends SimpleButton {

		public function EasyButton() {
			// constructor code
			init()
		}
		private function init(): void {
			// Add event listeners for mouse click and release
			this.addEventListener(MouseEvent.CLICK, onClick);
			this.addEventListener(MouseEvent.MOUSE_UP, onRelease);
		}

		private function onClick(event: MouseEvent): void {
			// Change the border color to red when the button is clicked
			this.upState.borderColor = 0xFF0000; // Red color
		}

		private function onRelease(event: MouseEvent): void {
			// You can add additional functionality on button release if needed

		}
	}
}