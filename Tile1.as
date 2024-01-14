package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Tile1 extends MovieClip {
		private var _isSelected: Boolean;

		public function Tile1() {
			// constructor code
			stop();
			_isSelected = false;
		}

		public function set isSelected(value: Boolean): void {
			_isSelected = value;
		}

		public function get isSelected(): Boolean {
			return _isSelected;
		}
	}

}