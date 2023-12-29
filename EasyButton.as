package {

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class EasyButton extends SimpleButton {

		private var originalOverState: Object;

		public function EasyButton() {
			// constructor code
			this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);

		}

		private function onRollOver(event: MouseEvent): void {
			var button = new EasyButtonH();
			button.x = event.currentTarget.x;
			button.y = event.currentTarget.y;
			parent.addChild(button);
			parent.removeChild(this);
		}
	}
}