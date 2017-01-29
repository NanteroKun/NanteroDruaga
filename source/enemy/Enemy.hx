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
			case CharacterSyu.EnemySyu(BlueWispSlow):movepattern = new BlueWispSlow(this);
			case CharacterSyu.EnemySyu(BlueWispFast):movepattern = new BlueWispFast(this);
			case CharacterSyu.EnemySyu(RedWispFast):movepattern = new RedWispFast(this);
			case CharacterSyu.EnemySyu(RedWispSlow):movepattern = new RedWispSlow(this);
			case CharacterSyu.EnemySyu(GreenSlime):movepattern = new GreenSlime(this);
			case CharacterSyu.EnemySyu(RedSlime):movepattern = new RedSlime(this);
			case CharacterSyu.EnemySyu(BlackSlime):movepattern = new BlackSlime(this);
			case CharacterSyu.EnemySyu(BlueSlime):movepattern = new BlueSlime(this);
			case CharacterSyu.EnemySyu(DarkGreenSlime):movepattern = new DarkGreenSlime(this);
			case CharacterSyu.EnemySyu(DarkYellowSlime):movepattern = new DarkYellowSlime(this);
			case CharacterSyu.EnemySyu(WhiteSpell):movepattern = new WhiteSpell(this); trace("shiro");
			case CharacterSyu.EnemySyu(BlueSpell):movepattern = new BlueSpell(this);
			case CharacterSyu.EnemySyu(RedSpell):movepattern = new RedSpell(this);
			case CharacterSyu.EnemySyu(GreenSpell):movepattern = new GreenSpell(this);
			case CharacterSyu.EnemySyu(FireElement):movepattern = new FireElement(this);
			case CharacterSyu.EnemySyu(BlueKnight):movepattern = new BlueKnight(this);
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