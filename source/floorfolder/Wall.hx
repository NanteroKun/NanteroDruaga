package floorfolder;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Wall extends FlxSprite
{
	public var name:String;
	public function new() 
	{
		super();
	}
	public function WallKesu(s:String):Bool
	{
		if (s == name)
		{
			kill();
			return true;
		}
		return false;
	}
}