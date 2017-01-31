package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class KnightAnimation
{
	public static inline function SwordAnimation(s:Knight):Void
	{
		var w:Int;
		w = s.Target.muki * 11;
		if (s.swordcnt == 0)
		{
			w += Std.int((s.walkcnt & 15) / 4);
		}
		else
		{
			w += 3 + s.swordcnt;
		}
		s.sword.animation.play(Std.string(w));
		var p:Int = Std.int(s.swordcnt / 2);
		p = Reg.intclamp(p, 0, 2);
		p += s.Target.muki * 3;
		s.shield.animation.play(Std.string(p));
		var t:Int = s.Target.muki * 2;
		if (s.walkcnt % 8 > 3)
		{
			t++;
		}
		s.Target.animation.play(Std.string(t));
	}
}