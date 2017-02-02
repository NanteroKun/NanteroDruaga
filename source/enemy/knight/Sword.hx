package enemy.knight;
import flixel.FlxSprite;

/**
 * ...	ナイト系のやつらが持ってる剣
 * @author 
 */
class Sword extends FlxSprite
{
	public var swordcnt:Int;
	public var swordmuki:Int;
	private var kenfuricnt:Int;
	public var kenfurispeed:Int;
	public function new() 
	{
		swordcnt = 0;
		swordmuki = 1;
		kenfuricnt = 0;
		kenfurispeed = 7;
		super();
	}
	public function Move(SwordDasu:Bool):Void 
	{
		if (swordcnt == 0)
		{
			if (SwordDasu)
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
				if (swordcnt == 1 && SwordDasu && swordmuki == -1)
				{
					swordmuki = 1;//剣を収める間際に再び剣を出す時はすばやい
				}
				if (swordcnt == 6 && swordmuki == 1)
				{
					if (SwordDasu)
					{
						swordcnt = 7;
					}
					else
					{
						swordmuki =-1;
					}
				}
			}
			if (swordcnt == 7 && !SwordDasu)
			{
				swordcnt = 5; 
				swordmuki =-1; 
				kenfuricnt = 0;
			}
		}
		swordcnt = Reg.intclamp(swordcnt, 0, 7);
	}
}