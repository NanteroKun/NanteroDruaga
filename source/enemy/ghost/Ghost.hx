package enemy.ghost;
import enums.CharacterSyu;
import flixel.FlxG;
import flixel.math.FlxPoint;
import typedefs.TsuikaEnemyTable;

/**
 * ...
 * @author 
 */
class Ghost extends CharacterMovePattern
{
	private var dasuspell:CharacterSyu;
	private var warpcnt:Int;
	public function new(s:Character) 
	{
		super(s);
		Target.muki = Muki.ue;
		Target.hitpoint = 24;
		Target.setPosition(Reg.XposSet(), Reg.YposSet());
		Target.speed = 1;
		warpcnt = 0;
	}
	override public function GraphicSet() 
	{
		Target.animation.add(Std.string(Muki.ue), [0]);
		Target.animation.add(Std.string(Muki.migi), [1]);
		Target.animation.add(Std.string(Muki.shita), [2]);
		Target.animation.add(Std.string(Muki.hidari), [3]);
		Target.animation.add("NO", [4]);
	}
	override public function Move(e:Float) 
	{
		Target.animation.play(Std.string(Target.muki));
		if (warpcnt > 0)
		{
			var warpposition:FlxPoint = FlxPoint.get(0, 0);
			switch (Target.muki)
			{
				case Muki.ue:warpposition.y = -24;
				case Muki.migi:warpposition.x = 24;
				case Muki.shita:warpposition.y = 24;
				case Muki.hidari:warpposition.x =-24;
			}
			if (warpcnt % 2 == 1)
			{
				warpposition.x = warpposition.x *-1;
				warpposition.y = warpposition.y *-1;
			}
			warpcnt--;
			if (warpcnt > 0)
			{
				Target.x += warpposition.x;
				Target.y += warpposition.y;
			}
			return;
		}
		if (IsBlockCenter())
		{
			if (FlxG.random.bool(50))
			{
				var s:TsuikaEnemyTable={syu:dasuspell, x:Target.x, y:Target.y, m:Target.muki, wait:0};
				TsuikaEnemy.TsuikaEnemyTableSet(s);
			}
			if (!IdousakiChk(Target.muki, Target.x, Target.y))//進行先に壁あるわー
			{
				if (Math.abs(Target.x - Reg.GilPos.x) > Math.abs(Target.y - Reg.GilPos.y))//x軸の方が遠い
				{
					if (Target.x >= Reg.GilPos.x)
					{
						Target.muki = Muki.hidari;
						if (Target.x <= 20)
						{
							Target.muki = Muki.migi;
						}
					}
					else
					{
						Target.muki = Muki.migi;
						if (Target.x >=428)
						{
							Target.muki = Muki.hidari;
						}
					}
				}
				else
				{
					if (Target.y >= Reg.GilPos.y)
					{
						Target.muki = Muki.ue;
						if (Target.y <= 36)
						{
							Target.muki = Muki.shita;
						}
					}
					else
					{
						Target.muki = Muki.shita;
						if (Target.y >= 228)
						{
							Target.muki = Muki.ue;
						}
					}
				}
				if (!IdousakiChk(Target.muki, Target.x, Target.y))//向きを変えた先にも壁があるわー
				{
					warpcnt = 32;
					return;
				}
			}
		}
		super.Move(e);
	}
}