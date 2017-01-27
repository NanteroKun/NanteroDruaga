package enemy.knight;
import enemy.Enemy;

/**
 * ...
 * @author 
 */
class BlueKnight extends Knight
{
	public function new(s:Enemy) 
	{
		super(s);
		s.speed = 0.5;
	}
	override function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.loadGraphic("assets/images/enemy/knight/blueknight/BlueKnight.png", true, 16, 16);
		s.animation.add("0", [0, 1], 30, true);
		s.animation.add("1", [2, 3], 30, true);
		s.animation.add("2", [4, 5], 30, true);
		s.animation.add("3", [6, 7], 30, true);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
		
	}
}