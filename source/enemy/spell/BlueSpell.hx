package enemy.spell;
import floor.Maze;

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
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.color = 0x2197ff;
	}
	override public function Move(s:Enemy) 
	{
		if ((s.x - 20) % 24 == 0 && (s.y - 36) % 24 == 0 )
		{
			if (!IdousakiChk(s.muki, s.x, s.y))
			{
				var px:Int = Std.int((s.x - 20) / 24);
				var py:Int = Std.int((s.y - 36) / 24);
				Maze.WallDel(px, py, s.muki);
				s.kill();
			}
		}
		super.Move(s);
	}
}