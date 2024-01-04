﻿package {

	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class SymbolButton extends SimpleButton {


		public function SymbolButton() {
			// constructor code
			this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
		}

		private function onRollOver(event: MouseEvent): void {
			var button = new SymbolButtonH();
			button.x = event.currentTarget.x;
			button.y = event.currentTarget.y;
			parent.addChild(button);
			parent.removeChild(this);
		}
	}

}