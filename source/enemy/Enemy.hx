package enemy;

import enemy.knight.BlueKnight;
import enemy.slime.*;
import enemy.spell.*;
import enemy.wisp.*;
import flixel.FlxBasic;
import flixel.FlxG;
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
		if (FlxG.random.bool(1))
		{
			//syu = CharacterSyu.Sonota(FakeDoor);
		}
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
			case CharacterSyu.SpellSyu(WhiteSpell):movepattern = new WhiteSpell(this); 
			case CharacterSyu.SpellSyu(BlueSpell):movepattern = new BlueSpell(this);
			case CharacterSyu.SpellSyu(RedSpell):movepattern = new RedSpell(this);
			case CharacterSyu.SpellSyu(GreenSpell):movepattern = new GreenSpell(this);
			case CharacterSyu.SpellSyu(FireElement):movepattern = new FireElement(this);
			case CharacterSyu.EnemySyu(BlueKnight):movepattern = new BlueKnight(this);
		//	case CharacterSyu.Sonota(sonota):  trace("sonota");この書き方でsonotaを全部纏められる。素敵やん
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
		super.draw();
	}
}