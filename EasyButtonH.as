package {

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class EasyButtonH extends SimpleButton {


		public function EasyButtonH() {
			// constructor code
			this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}

		private function onRollOut(event: MouseEvent): void {
			var button = new EasyButton();
			button.x = event.currentTarget.x;
			button.y = event.currentTarget.y;
			parent.addChild(button);
			parent.removeChild(this);
		}
	}

}