package enemy.knight;
import enemy.roper.Roper;
import enums.CharacterSyu;
import enums.CharacterSyu.EnemySyu;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class Knight extends Roper
{
	public var sword:Sword;
	public var shield:FlxSprite;
	public var walkcnt:Int;
	public function new(s:Character) 
	{
		super(s);
		Target.muki = 2;
		Target.setPosition(Reg.XposSet(), Reg.YposSet());
		walkcnt = 0;
	}
	override function GraphicSet():Void
	{
		super.GraphicSet();
		Target.animation.play(Std.string(Target.muki));
	}
	override public function Move(e:Float):Void
	{
		sword.Move(GiltonoKyori());
		walkcnt++;
		super.Move(e);
	}
	override public function nisedraw() 
	{
		sword.x = Std.int(Target.x) - 8; sword.y = Std.int(Target.y) - 8;
		shield.x = Target.x; shield.y = Target.y;
		if (Type.enumEq(Target.syu,CharacterSyu.EnemySyu(LizardMan)))
		{
			switch (Target.muki)
			{
				case 0:shield.draw(); sword.draw(); super.nisedraw();
				case 3:shield.draw(); super.nisedraw(); sword.draw();
				case 2:super.nisedraw(); sword.draw(); shield.draw();
				case 1:sword.draw(); super.nisedraw(); shield.draw();
			}
		}
		else
		{
			switch (Target.muki)
			{
				case 0:shield.draw(); sword.draw(); super.nisedraw();
				case 1:shield.draw(); super.nisedraw(); sword.draw();
				case 2:super.nisedraw(); sword.draw(); shield.draw();
				case 3:sword.draw(); super.nisedraw(); shield.draw();
			}
		}
		SwordAnimation();
	}
	private function GiltonoKyori():Bool
	{
		var sx:Float = Target.x + 8; var sy:Float = Target.y + 8;
		var gx:Float = Reg.GilPos.x + 8; var gy:Float = Reg.GilPos.y + 8;
		if (Math.abs(gx - sx) < 72 && Math.abs(gy - sy) < 72)
		{
			return true;
		}
		return false;
	}
	private function SwordAnimation():Void
	{
		var w:Int;
		w = Target.muki * 11;
		if (sword.swordcnt == 0)
		{
			w += Std.int((walkcnt & 15) / 4);
		}
		else
		{
			w += 3 + sword.swordcnt;
		}
		sword.animation.play(Std.string(w));
		var p:Int = Std.int(sword.swordcnt / 2);
		p = Reg.intclamp(p, 0, 2);
		p += Target.muki * 3;
		shield.animation.play(Std.string(p));
		var t:Int = Target.muki * 2;
		if (walkcnt % 8 > 3)
		{
			t++;
		}
		Target.animation.play(Std.string(t));
	}
}