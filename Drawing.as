package {
    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class Drawing extends MovieClip {

        public function Drawing() {
            // constructor code
            this.reset1.addEventListener(MouseEvent.CLICK, onClick);
            this.reset2.addEventListener(MouseEvent.CLICK, onClick);
            this.reset3.addEventListener(MouseEvent.CLICK, onClick);
            this.reset4.addEventListener(MouseEvent.CLICK, onClick);
            this.reset5.addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onClick(event: MouseEvent): void {
            switch (event.currentTarget) {
                case reset1:
                    this.drawing1.clearDrawing();
                    break;
                case reset2:
                    this.drawing2.clearDrawing();
                    break;
                case reset3:
                    this.drawing3.clearDrawing();
                    break;
                case reset4:
                    this.drawing4.clearDrawing();
                    break;
                case reset5:
                    this.drawing5.clearDrawing();
                    break;
            }
        }
    }
}
