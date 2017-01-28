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
	public function new(s:Character) 
	{
		super(s);
		elementcnt = FlxG.random.int(128, 256);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.loadGraphic("assets/images/spell/fireelement.png", true, 16, 16);
		for (i in 0...4)
		{
			Target.animation.add(Std.string(i), [i], 15, false);
		}
		Target.animation.add("s1", [7, 6, 5, 4], 15, false);
		Target.animation.add("s2", [11, 10, 9, 8], 15, false);
		Target.animation.add("s3", [15, 14, 13, 12], 15, false);
		Target.color = 0xffffff;
	}
	override public function Move() 
	{
		//super.Move();　ファイヤーエレメントは自動では動かないんですよ
		if (elementcnt > 0)
		{
			var k:Int = Std.int((Reg.gamecount % 16) / 4);
			Target.animation.play(Std.string(k));
			elementcnt--;
			if (elementcnt == 0)
			{
				Target.animation.play("s1");
			}
		}
		if (Target.animation.finished)
		{
			switch (Target.animation.name)
			{
				case "s1":Target.animation.play("s2");
				case "s2":Target.animation.play("s3");
				case "s3":Target.kill();
			}
		}
	}
}
	