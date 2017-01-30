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
	override public function draw():Void 
	{
		//自分では描画しない
		//movepatternさんに制御任せる（点滅とか・・・）
		movepattern.nisedraw();
	}
	public function nisedraw():Void
	{
		//movepatternさんから戻ってきて描画
		super.draw();
	}
}