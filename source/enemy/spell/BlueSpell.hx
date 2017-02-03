package enemy.spell;
import floorfolder.Maze;
import typedefs.TsuikaEnemyTable.BlockPoint;

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
		if (IsBlockCenter())
		{
			if (!IdousakiChk(Target.muki, Target.x, Target.y))
			{
				var temp:BlockPoint = ZahyoToBox();
				var px = temp.bx;
				var py = temp.by;
				Maze.WallDel(px, py, Target.muki);
				Target.kill();
			}
		}
		super.Move(e);
	}
}