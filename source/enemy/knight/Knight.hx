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
	public var sword:FlxSprite;
	private var shield:FlxSprite;
	public var walkcnt:Int;
	public var swordcnt:Int;
	private var swordmuki:Int;
	private var kenfuricnt:Int;
	private var kenfurispeed:Int;
	public function new(s:Character) 
	{
		super(s);
		Target.muki = 2;
		Target.setPosition(Reg.XposSet(), Reg.YposSet());
		swordcnt = 0;
		swordmuki = 1;
		walkcnt = 0;
	}
	override function GraphicSet():Void
	{
		super.GraphicSet();
		Target.animation.play(Std.string(Target.muki));
	}
	override public function Move(e:Float):Void
	{
		if (swordcnt == 0)
		{
			
			if (GiltonoKyori())
			{
				swordmuki = 1;
				swordcnt = 1;
				kenfuricnt = 0;
			}
		}
		if (swordcnt != 0)
		{
			kenfuricnt++;
			if (kenfuricnt >= kenfurispeed)
			{
				kenfuricnt = 0;
				swordcnt += swordmuki;
				if (swordcnt == 1 && GiltonoKyori() && swordmuki == -1)
				{
					swordmuki = 1;
				}
				if (swordcnt == 6 && swordmuki == 1)
				{
					if (GiltonoKyori())
					{
						swordcnt = 7;
					}
					else
					{
						swordmuki =-1;
					}
				}
			}
			if (swordcnt == 7 && !GiltonoKyori())
			{
				swordcnt = 5; 
				swordmuki =-1; 
				kenfuricnt = 0;
			}
		}
		swordcnt = Reg.intclamp(swordcnt, 0, 7);
		walkcnt++;
		var s:Int = Target.muki*2;
		if (walkcnt % 8 > 3)
		{
			s++;
		}
		Target.animation.play(Std.string(s));
		KnightAnimation.SwordAnimation(this);
		super.Move(e);
	}
	override public function nisedraw() 
	{
		sword.x = Std.int(Target.x) - 8; sword.y =  Std.int(Target.y) - 8;
		shield.x = Target.x; shield.y = Target.y;
		if (Type.enumEq(Target.syu,CharacterSyu.EnemySyu(LizMan)))
		{
			
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
}