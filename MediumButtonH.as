package {

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class MediumButtonH extends SimpleButton {
		private var isClicked: Boolean = false;

		public function MediumButtonH() {
			// constructor code
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
			this.addEventListener(MouseEvent.CLICK, onClick);
		}

		private function onRollOut(event: MouseEvent): void {
			var button = new MediumButton();
			button.x = event.currentTarget.x;
			button.y = event.currentTarget.y;
			parent.addChild(button);
			parent.removeChild(this);
		}

		private function onClick(event: MouseEvent): void {
			if (isClicked) {
				this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
			} else {
				isClicked = true
				this.removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
			}

		}
	}

}