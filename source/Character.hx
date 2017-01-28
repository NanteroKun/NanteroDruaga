package;

import enums.CharacterSyu;
import flixel.FlxSprite;

/**
 * ...
 * @author 実際に動かすスプライトはこいつやねん
 */
class Character extends FlxSprite
{
	public var speed:Float;
	public var muki:Int;
	public var syu:enums.CharacterSyu;
	public var movepattern:CharacterMovePattern;
	public function new() 
	{
		super();
	}
}