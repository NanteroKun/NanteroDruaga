package enemy.wisp;

import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class BlueWispSlow extends BlueWisp
{ 
	public function new(s:Enemy) 
	{
		super(s);
		s.speed = 0.5;
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
}