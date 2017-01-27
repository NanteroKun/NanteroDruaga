package;

import enums.EnemySyu;
import flash.utils.ByteArray;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 実際に動かすスプライトはこいつやねん
 */
class Character extends FlxSprite
{
	public var speed:Float;
	public var muki:Int;
	public var syu:enums.EnemySyu;
	public var movepattern:CharacterMovePattern;
	public function new() 
	{
		super();
	}
}