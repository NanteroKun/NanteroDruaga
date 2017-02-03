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
	public function new(s:Character) 
	{
		super(s);
		waitcnt = FlxG.random.int(0, 255);
		Target.muki = Reg.RandomMuki();
		walkcnt = 0;
		Target.speed = 8;
		Target.setPosition(Reg.XposSet(), Reg.YposSet());
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.animation.add("idle", [0], 30, false);
		Target.animation.add("purupuru", [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1], 30, false);
		Target.animation.add("walk", [0, 1, 2, 0, 1, 0, 1, 0, 2, 1, 0, 1, 0, 2, 1, 0, 1], 30, false);
	}
	override public function Move(e:Float) 
	{
		//super.Move();スライムは自動では移動しないんですよ
		if (waitcnt > 0)
		{
			waitcnt--;
			if (waitcnt == 0)
			{
				Target.muki = Reg.RandomMuki();
				if (IdousakiChk(Target.muki, Target.x, Target.y))
				{
					Target.animation.play("walk");
					walkcnt = 0;
				}
				else
				{
					Target.muki = Reg.RandomMuki();
					if (!IdousakiChk(Target.muki, Target.x, Target.y))
					{
						waitcnt = FlxG.random.int(0, waitbase) + 16;
						if (waitcnt > 255)
						{
							waitcnt -= 255;
						}
					}
					else
					{
						Target.animation.play("walk");
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
				case 4, 16, 28:super.Move(e);
				case 34:
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
				SpellDasu();
			}
		}
	}
	public function SpellDasu():Void
	{
		//各種スライム.hx.SpellDasu()に実際のスペル出す処理、ありまぁ～す
	}
}
	