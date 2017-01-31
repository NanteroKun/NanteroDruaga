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
	}
}