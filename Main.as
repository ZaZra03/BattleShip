package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Main extends Sprite {
		var inGame:Boolean = false;
		private var myMenu: Menu;
		private var myDeployment: Deployment;

		public function Main(): void {
			myMenu = new Menu();
			myDeployment = new Deployment();

			addChild(myMenu);

			// Add event listener to the Menu class
			myMenu.menuPlay.addEventListener(MouseEvent.CLICK, onPlayClick);

			addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		private function onPlayClick(event: MouseEvent): void {

			// This function is called when menuPlay is clicked in the Menu class
			if (event.currentTarget.parent && event.currentTarget.parent is Menu) {
				var menu: Menu = event.currentTarget.parent as Menu;
				if (menu && menu.parent) {
					menu.parent.removeChild(menu);
					addChild(myDeployment); // Add the Game instance to the stage
					myMenu.menuPlay.removeEventListener(MouseEvent.CLICK, onPlayClick); // Remove the event listener
				}
			}
		}

		private function gameLoop(e: Event): void {
			// Your game loop code here
		}
	}
}