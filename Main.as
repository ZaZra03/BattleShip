package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Main extends Sprite {
		var inGame: Boolean = false;
		
		private var myMenu = new Menu();
		private var myDeployment = new Deployment();
		private var myBattle = new Battle();
		private var myField = new Field();
		private var myDifficulty = new Difficulty()

		private var gameField: Array;

		public function Main(): void {
			
			
			
			

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
					addChild(myDifficulty); // Add the Game instance to the stage
					//myBattle.addChild(myDeployment.field);
					//myBattle.addChild(myDeployment.boat1);
					//myBattle.addChild(myDeployment.boat2);
					//myBattle.addChild(myDeployment.boat3);
					//myBattle.addChild(myDeployment.boat4);
					//myBattle.addChild(myDeployment.boat5);
					//this.gameField = myDeployment.gameField;
					myDeployment.deploymentReady.removeEventListener(MouseEvent.CLICK, onPlayClick); // Remove the event listener
				}
			}
		}

		private function gameLoop(e: Event): void {
			// Your game loop code here
		}
	}
}