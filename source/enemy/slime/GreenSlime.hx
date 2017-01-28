package enemy.slime;
import enemy.Enemy;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class GreenSlime extends Slime
{
	public function new(s:Character) 
	{
		super(s);
		waitbase = 255;
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/slime/greenslime.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
}