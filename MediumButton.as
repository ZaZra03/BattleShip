package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class MediumButton extends MovieClip {
        private var isClicked:Boolean = false;

        public function MediumButton() {
            // constructor code
            stop(); // Use stop() instead of gotoAndStop(1) to avoid issues

            this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
            this.addEventListener(MouseEvent.ROLL_OUT, onRollOut);
            this.addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onRollOver(event:MouseEvent):void {
            if (!isClicked) {
				this.buttonMode = true;
                gotoAndStop(2);
            }
        }

        private function onRollOut(event:MouseEvent):void {
            if (!isClicked) {
				this.buttonMode = true;
                gotoAndStop(1);
            }
        }

        private function onClick(event:MouseEvent):void {
            if (isClicked) {
                gotoAndStop(1);
                this.addEventListener(MouseEvent.ROLL_OVER, onRollOver);
            } else {
                gotoAndStop(2);
                this.removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
            }

            isClicked = !isClicked; // Toggle the state
        }
    }
}
