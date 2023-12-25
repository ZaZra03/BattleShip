package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public interface Boat {
		function get boatNumber(): int;
		function get boatSize(): int;
		function get attackDamage(): int;
		function get isPlace(): Boolean;
		function set isPlace(value: Boolean): void;
	}
}