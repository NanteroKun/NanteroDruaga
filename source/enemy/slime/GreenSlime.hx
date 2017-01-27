package enemy.slime;
import enemy.Enemy;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class GreenSlime extends Slime
{
	public function new(s:Enemy) 
	{
		super(s);
		waitbase = 255;
	}
	override public function GraphicSet(s:Enemy) 
	{
		s.loadGraphic("assets/images/enemy/slime/greenslime.png", true, 16, 16);
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
}