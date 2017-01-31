package enemy.spell;
import floorfolder.Maze;

/**
 * ...
 * @author 
 */
class BlueSpell extends Spell
{
	public function new(s:Enemy) 
	{
		super(s);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.color = 0x2197ff;
	}
	override public function Move(e:Float) 
	{
		if ((Target.x - 20) % 24 == 0 && (Target.y - 36) % 24 == 0 )
		{
			if (!IdousakiChk(Target.muki, Target.x, Target.y))
			{
				var px:Int = Std.int((Target.x - 20) / 24);
				var py:Int = Std.int((Target.y - 36) / 24);
				Maze.WallDel(px, py, Target.muki);
				Target.kill();
			}
		}
		super.Move(e);
	}
}