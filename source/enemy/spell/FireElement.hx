package enemy.spell;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class FireElement extends CharacterMovePattern
{
	private var elementcnt:Int;
	private var MaxFireCnt:Int;
	public function new(s:Enemy) 
	{
		super(s);
		elementcnt = FlxG.random.int(128, 256);
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.loadGraphic("assets/images/spell/fireelement.png", true, 16, 16);
		for (i in 0...4)
		{
			s.animation.add(Std.string(i), [i], 15, false);
		}
		s.animation.add("s1", [7, 6, 5, 4], 15, false);
		s.animation.add("s2", [11, 10, 9, 8], 15, false);
		s.animation.add("s3", [15, 14, 13, 12], 15, false);
		s.color = 0xffffff;
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
		if (elementcnt > 0)
		{
			var k:Int = Std.int((Reg.gamecount % 16) / 4);
			s.animation.play(Std.string(k));
			elementcnt--;
			if (elementcnt == 0)
			{
				s.animation.play("s1");
			}
		}
		if (s.animation.finished)
		{
			switch (s.animation.name)
			{
				case "s1":s.animation.play("s2");
				case "s2":s.animation.play("s3");
				case "s3":s.kill();
			}
		}
	}
}
	