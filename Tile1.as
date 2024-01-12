package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Tile1 extends MovieClip {
		private var isClicked:Boolean = false;
		
        public function Tile1() {
            // constructor code
            stop(); // Use stop() instead of gotoAndStop(1) to avoid issues
            this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
        }

        private function onRollOver(event:MouseEvent):void {
            if (!isClicked) {
                gotoAndStop(2);
            }
        }

        private function onRollOut(event:MouseEvent):void {
            if (!isClicked) {
                gotoAndStop(1);
            }
        }
	}
	
}
