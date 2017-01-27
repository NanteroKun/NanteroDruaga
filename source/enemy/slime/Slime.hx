package enemy.slime;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class Slime extends CharacterMovePattern
{
	private var waitcnt:Int;
	private var walkcnt:Int;
	private var waitbase:Int;
	public function new(s:Enemy) 
	{
		super(s);
		waitcnt = FlxG.random.int(0, 255);
		s.muki = FlxG.random.int(0, 3);
		walkcnt = 0;
		s.setPosition(Reg.XposSet(), Reg.YposSet());
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.animation.add("idle", [0], 30, false);
		s.animation.add("purupuru", [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1], 30, false);
		s.animation.add("walk", [0, 1, 2, 0, 1, 0, 1, 0, 2, 1, 0, 1, 0, 2, 1, 0, 1], 30, false);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
		if (waitcnt > 0)
		{
			waitcnt--;
			if (waitcnt == 0)
			{
				s.muki = FlxG.random.int(0, 3);
				if (IdousakiChk(s.muki, s.x, s.y))
				{
					s.animation.play("walk");
					walkcnt = 0;
				}
				else
				{
					s.muki = FlxG.random.int(0, 3);
					if (!IdousakiChk(s.muki, s.x, s.y))
					{
						waitcnt = FlxG.random.int(0, waitbase) + 16;
						if (waitcnt > 255)
						{
							waitcnt -= 255;
						}
					}
					else
					{
						s.animation.play("walk");
						walkcnt = 0;
					}
				}
			}
		}
		else
		{
			walkcnt++;
			switch (walkcnt)
			{
				case 4, 16, 28:
					switch (s.muki)
					{
						case 0:s.y -= 8;
						case 1:s.x += 8;
						case 2:s.y += 8;
						case 3:s.x -= 8;
					}
			}
			if (walkcnt == 34)
			{
				waitcnt = FlxG.random.int(0, waitbase) + 16;
				if (waitcnt > 255)
				{
					waitcnt -= 255;
				}
			}
		}
		if (Reg.gamecount % 256 == 0)
		{
			if (waitcnt > 0)
			{
				SpellDasu(s);
			}
		}
	}
	public function SpellDasu(s:Enemy):Void
	{
		
	}
}
	