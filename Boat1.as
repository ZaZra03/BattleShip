package {
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class Boat1 extends MovieClip implements Boat {
        public var _boatNumber:int = 1;
        public var _boatSize:int = 1;
        public var _attackDamage:int;
        private var _isPlace:Boolean;
        private var isDrawing:Boolean = false;
        private var drawingContainer:Sprite; // Changed to Sprite for flexibility

        public function Boat1() {
            // constructor code
            this.addEventListener(MouseEvent.MOUSE_DOWN, startDrawing);
            this.addEventListener(MouseEvent.MOUSE_MOVE, draw);
            this.addEventListener(MouseEvent.MOUSE_UP, stopDrawing);

            drawingContainer = new Sprite();
            addChild(drawingContainer); // Add the drawing container to the display list
        }

        public function get boatNumber():int {
            return _boatNumber;
        }

        public function get boatSize():int {
            return _boatSize;
        }

        public function get attackDamage():int {
            return _attackDamage;
        }

        public function get isPlace():Boolean {
            return _isPlace;
        }

        public function set isPlace(value:Boolean):void {
            _isPlace = value;
        }

        private function startDrawing(event:MouseEvent):void {
            isDrawing = true;
            drawingContainer.graphics.lineStyle(2, 0x000000); // Set line color and thickness
            var localPos:Object = globalToLocal(new Point(mouseX, mouseY));
            drawingContainer.graphics.moveTo(localPos.x, localPos.y);
        }

        private function draw(event:MouseEvent):void {
            if (isDrawing) {
                var localPos:Object = globalToLocal(new Point(mouseX, mouseY));
                drawingContainer.graphics.lineTo(localPos.x, localPos.y);
            }
        }

        private function stopDrawing(event:MouseEvent):void {
            isDrawing = false;
        }
    }
}
