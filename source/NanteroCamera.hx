package;

import flixel.FlxCamera;

/**
 * ...
 * @author 
 */
class NanteroCamera extends FlxCamera
{
	public function new() 
	{
		super(0, 0, 464, 288, 1);
	}
	public function Init():Void
	{
		
	}
	
	public function NanteroCameraMove(posx:Float):Void
	{
		x = (-posx -8)* 2 + 112 * 2;
		x = Reg.clamp(x, -480, 0);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
}