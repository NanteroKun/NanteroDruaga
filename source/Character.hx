package;

import enemy.spell.Spell;
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
	public var firstframe:Bool;
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
	public function nisedraw():Void
	{
		if (Seizon)
		{
			super.draw();
		}
	}
	/*
	override public function draw():Void 
	{
		if (Seizon)
		{
			if (firstframe)
			{
				switch (syu)
				{
					case CharacterSyu.SpellSyu(jumon):firstframe = false;
					default:super.draw();
				}
			}
			else
			{
				super.draw();
			}
		}
	}
	*/
}