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
import enums.CharacterSyu;

/**
 * ...
 * @author 敵キャラが死んだ場合スプライトをKillせずにSeizonにFalse（後で生成されるキャラの表示順や宝箱判定のためっす）
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
		syu = enums.CharacterSyu.No;
	}
	public function Set(s:CharacterSyu)
	{
		syu = s;
		switch(syu)
		{
			case CharacterSyu.BlueWispSlow:movepattern = new BlueWispSlow(this);
			case CharacterSyu.BlueWispFast:movepattern = new BlueWispFast(this);
			case CharacterSyu.RedWispFast:movepattern = new RedWispFast(this);
			case CharacterSyu.RedWispSlow:movepattern = new RedWispSlow(this);
			case CharacterSyu.GreenSlime:movepattern = new GreenSlime(this);
			case CharacterSyu.RedSlime:movepattern = new RedSlime(this);
			case CharacterSyu.BlackSlime:movepattern = new BlackSlime(this);
			case CharacterSyu.BlueSlime:movepattern = new BlueSlime(this);
			case CharacterSyu.DarkGreenSlime:movepattern = new DarkGreenSlime(this);
			case CharacterSyu.DarkYellowSlime:movepattern = new DarkYellowSlime(this);
			case CharacterSyu.WhiteSpell:movepattern = new WhiteSpell(this);
			case CharacterSyu.BlueSpell:movepattern = new BlueSpell(this);
			case CharacterSyu.RedSpell:movepattern = new RedSpell(this);
			case CharacterSyu.GreenSpell:movepattern = new GreenSpell(this);
			case CharacterSyu.FireElement:movepattern = new FireElement(this);
			case CharacterSyu.BlueKnight:movepattern = new BlueKnight(this);
			default:trace("ENEMY ja Nai yatsu Dasicha DAMEEEEEEE!!!!");
		}
		Seizon = true;
		movepattern.GraphicSet();
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	override public function draw():Void 
	{
		if (Seizon)
		{
			super.draw();
		}
	}
}