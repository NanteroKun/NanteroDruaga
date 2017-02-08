package enemy;

import enemy.ghost.*;
import enemy.knight.*;
import enemy.magician.*;
import enemy.slime.*;
import enemy.spell.*;
import enemy.wisp.*;
import enemy.ghost.DruidGhost;
import enemy.ghost.WizardGhost;
import enums.CharacterSyu;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

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
			case CharacterSyu.EnemySyu(BlackKnight):movepattern = new BlackKnight(this);
			case CharacterSyu.EnemySyu(MirrorKnight):movepattern = new MirrorKnight(this);
			case CharacterSyu.EnemySyu(RedKnight):movepattern = new RedKnight(this);
			case CharacterSyu.EnemySyu(HyperKnight):movepattern = new HyperKnight(this);
			case CharacterSyu.EnemySyu(LizardMan):movepattern = new LizardMan(this);
			case CharacterSyu.EnemySyu(HyperKnightSuper):movepattern = new HyperKnightSuper(this);
			case CharacterSyu.EnemySyu(Mage):movepattern = new Mage(this);
			case CharacterSyu.EnemySyu(Druid):movepattern = new Druid(this);
			case CharacterSyu.EnemySyu(Sorcerer):movepattern = new Sorcerer(this);
			case CharacterSyu.EnemySyu(Wizard):movepattern = new Wizard(this);
			case CharacterSyu.EnemySyu(MageGhost):movepattern = new MageGhost(this);
			case CharacterSyu.EnemySyu(SorcererGhost):movepattern = new SourcerGhost(this);
			case CharacterSyu.EnemySyu(WizardGhost):movepattern = new WizardGhost(this);
			case CharacterSyu.EnemySyu(DruidGhost):movepattern = new DruidGhost(this);
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