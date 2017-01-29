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
	public var syu:CharacterSyu;//
	private var Seizon:Bool;
	public var movepattern:CharacterMovePattern;
	public function new() 
	{
		super();
	}
	override public function update(elapsed:Float):Void 
	{
		if (Seizon)
		{
			movepattern.Move();
			super.update(elapsed);
		}
	}
	override public function draw():Void 
	{
		if (Seizon)
		{
			super.draw();
		}
	}
}