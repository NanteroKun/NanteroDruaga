package enemy.wisp;

import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class BlueWispFast extends BlueWisp
{
	public function new(s:Character) 
	{
		super(s);
		Target.speed = 2;
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
		
	}
}