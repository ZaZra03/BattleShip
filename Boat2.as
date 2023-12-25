package {
	import flash.display.MovieClip;

	public class Boat2 extends MovieClip implements Boat {
		private var _boatNumber: int = 2;
		private var _boatSize: int = 1;
		private var _attackDamage: int;
		private var _isPlace: Boolean;

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

		// Other methods or properties specific to Boat1
	}
}