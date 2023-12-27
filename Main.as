package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Main extends Sprite {
		var inGame: Boolean = false;
		private var myMenu: Menu;
		private var myDeployment: Deployment;
		private var myBattle: Battle;

		public function Main(): void {
			myMenu = new Menu();
			myDeployment = new Deployment();
			myBattle = new Battle();

			addChild(myMenu);

			// Add event listener to the Menu class
			myDeployment.deploymentReady.addEventListener(MouseEvent.CLICK, onPlayClick);
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
			} else if (event.currentTarget.parent && event.currentTarget.parent is Deployment) {
				var deployment: Deployment = event.currentTarget.parent as Deployment;
				if (deployment && deployment.parent) {
					deployment.parent.removeChild(deployment);
					addChild(myBattle); // Add the Game instance to the stage
					myDeployment.deploymentReady.removeEventListener(MouseEvent.CLICK, onPlayClick); // Remove the event listener
				}
			}
		}

		private function gameLoop(e: Event): void {
			// Your game loop code here
		}
	}
}