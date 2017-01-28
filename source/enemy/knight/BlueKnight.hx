package enemy.knight;
import enemy.Enemy;

/**
 * ...
 * @author 
 */
class BlueKnight extends Knight
{
	public function new(s:Character) 
	{
		super(s);
		s.speed = 0.5;
	}
	override function GraphicSet() 
	{
		super.GraphicSet();
		Target.loadGraphic("assets/images/enemy/knight/blueknight/BlueKnight.png", true, 16, 16);
		Target.animation.add("0", [0, 1], 30, true);
		Target.animation.add("1", [2, 3], 30, true);
		Target.animation.add("2", [4, 5], 30, true);
		Target.animation.add("3", [6, 7], 30, true);
	}
	override public function Move() 
	{
		super.Move();
	}
}