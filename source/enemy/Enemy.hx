package enemy;

import enemy.knight.BlueKnight;
import enemy.slime.BlackSlime;
import enemy.slime.BlueSlime;
import enemy.slime.DarkGreenSlime;
import enemy.slime.DarkYellowSlime;
import enemy.slime.GreenSlime;
import enemy.slime.RedSlime;
import enemy.spell.BlueSpell;
import enemy.spell.FireElement;
import enemy.spell.GreenSpell;
import enemy.spell.RedSpell;
import enemy.spell.WhiteSpell;
import enemy.wisp.BlueWispFast;
import enemy.wisp.BlueWispSlow;
import enemy.wisp.RedWispFast;
import enemy.wisp.RedWispSlow;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import enums.EnemySyu;

/**
 * ...
 * @author 
 */
class Enemy extends Character
{
	public static function Init(num:Int):FlxTypedGroup<Enemy>
	{
		var Group = new FlxTypedGroup<Enemy>();
		for (i in 0...num)
		{
			var temp:Enemy ;
			temp = new Enemy();
			temp.kill();
			Group.add(temp);
		}
		return Group;
	}
	public function new() 
	{
		super();
		syu = enums.EnemySyu.No;
	}
	public function Set(s:EnemySyu)
	{
		syu = s;
		switch(syu)
		{
			case EnemySyu.BlueWispSlow:movepattern = new BlueWispSlow(this);
			case EnemySyu.BlueWispFast:movepattern = new BlueWispFast(this);
			case EnemySyu.RedWispFast:movepattern = new RedWispFast(this);
			case EnemySyu.RedWispSlow:movepattern = new RedWispSlow(this);
			case EnemySyu.GreenSlime:movepattern = new GreenSlime(this);
			case EnemySyu.RedSlime:movepattern = new RedSlime(this);
			case EnemySyu.BlackSlime:movepattern = new BlackSlime(this);
			case EnemySyu.BlueSlime:movepattern = new BlueSlime(this);
			case EnemySyu.DarkGreenSlime:movepattern = new DarkGreenSlime(this);
			case EnemySyu.DarkYellowSlime:movepattern = new DarkYellowSlime(this);
			case EnemySyu.WhiteSpell:movepattern = new WhiteSpell(this);
			case EnemySyu.BlueSpell:movepattern = new BlueSpell(this);
			case EnemySyu.RedSpell:movepattern = new RedSpell(this);
			case EnemySyu.GreenSpell:movepattern = new GreenSpell(this);
			case EnemySyu.FireElement:movepattern = new FireElement(this);
			case EnemySyu.BlueKnight:movepattern = new BlueKnight(this);
			default:
		}
		movepattern.GraphicSet(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movepattern.Move(this);
	}
	override public function draw():Void 
	{
		super.draw();
	}
}