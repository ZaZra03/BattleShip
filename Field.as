﻿package {

	import flash.display.MovieClip;


	public class Field extends MovieClip {
		private var gameField: Array;

		public function Field() {
			// constructor code
			setupField();
		}

		private function setupField(): void {
			gameField = new Array();
			for (var i: uint = 0; i < 5; i++) {
				gameField[i] = new Array();
				for (var j: uint = 0; j < 5; j++) {
					gameField[i][j] = 0;
				}
			}
		}
	}

}