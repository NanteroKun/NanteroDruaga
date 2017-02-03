package enemy.magician;
import enums.CharacterSyu;
import flixel.FlxG;
import flixel.math.FlxPoint;

/**
 * ...
 * @author 
 */
class Magician extends CharacterMovePattern
{
	private var waitcnt:Int;
	public function new(s:Character) 
	{
		super(s);
		waitcnt = FlxG.random.int((0, 7) * 16) + 48;
		Target.speed = 0;
		Target.setPosition(-10000,-10000);
	}
	override public function GraphicSet() 
	{
		for (i in 0...3)
		{
			Target.animation.add("Int4A" + Std.string(i), [i, 4, 4, 4, i, 4, 4, 4, i, 4, 4, 4, i, 4, 4, 4], 60, false);
			Target.animation.add("Int2A" + Std.string(i), [i, 4, i, 4, i, 4, i, 4, i, 4, i, 4, i, 4, i, 4], 60, false);
			Target.animation.add("Deta " + Std.string(i), [i, i, i, i], 15, false);
			Target.animation.add("Int2K" + Std.string(i), [i, 4, i, 4, i, 4, i, 4, i, 4, i, 4, i, 4, i, 4], 60, false);
			Target.animation.add("Int4K" + Std.string(i), [i, 4, 4, 4, i, 4, 4, 4, i, 4, 4, 4, i, 4, 4, 4], 60, false);
		}
	}
	override public function Move(e:Float) 
	{
		if (waitcnt > 0)
		{
			waitcnt--;
			Target.setPosition(-10000,-10000);
		}
		if (waitcnt == 0 /*&& gilpositionapparok*/)
		{
			var px:Float = (Static.PS.gil.x - 20) % 24;
			var py:Float = (Static.PS.gil.y - 36) % 24;
			var denai:Bool = false;
			if ((px >= 7 && px <= 17) || (py >= 7 && py <= 17))
			{
				denai = true;
			}
			if (!denai)
			{
				var p:FlxPoint = MagePositionSet();
				Target.setPosition(p.x, p.y);
			}
		}
	}
	public function SpellDasu():Void
	{
		//各種スライム.hx.SpellDasu()に実際のスペル出す処理、ありまぁ～す
	}
	private function MagePositionSet():FlxPoint
	{
		var retpos:FlxPoint = FlxPoint.get(0, 0);
		var tx:Float = Reg.GilPos.x;
		var ty:Float = Reg.GilPos.y;
		var gx:Int = Std.int((tx - 20) / 24);
		var gy:Int = Std.int((ty - 36) / 24);
		if ((tx - 20) % 24 > 16) { gx++; }
		if ((ty - 36) % 24 > 16) { gy++; }
		var ex:Int = -1;
		var ey:Int = -1;
		var emuki:Int = -1;
		while (true)
		{
			var syutsugen:Int = FlxG.random.int(0, 15);
			switch (syutsugen)
			{
				case 0: ex = gx; ey = gy - 3; emuki = 2; 
				case 1: ex = gx - 1; ey = gy - 2; emuki = 2; 
				case 2: ex = gx; ey = gy - 2; emuki = 2; 
				case 3: ex = gx + 1; ey = gy - 2; emuki = 2; 

				case 4: ex = gx - 3; ey = gy; emuki = 1; 
				case 5: ex = gx - 2; ey = gy - 1; emuki = 1; 
				case 6: ex = gx - 2; ey = gy; emuki = 1; 
				case 7: ex = gx - 2; ey = gy + 1; emuki = 1; 

				case 8: ex = gx; ey = gy + 3; emuki = 0; 
				case 9: ex = gx - 1; ey = gy + 2; emuki = 0; 
				case 10: ex = gx; ey = gy + 2; emuki = 0; 
				case 11: ex = gx + 1; ey = gy + 2; emuki = 0; 

				case 12: ex = gx + 3; ey = gy; emuki = 3; 
				case 13: ex = gx + 2; ey = gy - 1; emuki = 3; 
				case 14: ex = gx + 2; ey = gy; emuki = 3; 
				case 15: ex = gx + 2; ey = gy + 1; emuki = 3; 
			}
			if (ex < 0 || ex > 17 || ey < 0 || ey > 8) { continue; }
			retpos.x = ex * 24 + 20;
			retpos.y = ey * 24 + 36;
			Target.muki = emuki;
			if (Type.enumEq(Target.syu,CharacterSyu.EnemySyu(Mage)) || Type.enumEq(Target.syu,CharacterSyu.EnemySyu(Sorcerer)))
			{
				var ok:Bool = false;
				switch (emuki)
				{
					case 0: if (uemovechk()) { ok = true; }
					case 1: if (migimovechk()) { ok = true; }
					case 2: if (shitamovechk()) { ok = true; }
					case 3: if (hidarimovechk()){ ok = true; }
					default: 
				}
				if (ok == false) {continue;}
			}
			break;
		}
	}
}