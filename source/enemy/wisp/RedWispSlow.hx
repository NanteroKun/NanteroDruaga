package enemy.wisp;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class RedWispSlow extends RedWisp
{
	public function new(s:Character) 
	{
		super(s);
		Target.speed = 0.5;
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
}