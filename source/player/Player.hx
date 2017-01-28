package player;
import enemy.knight.Gil;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class Player extends Character
{
	public function new() 
	{
		super();
		syu = CharacterSyu.Gil;
		movepattern = new Gil(this);
		Seizon = true;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Seizon)
		{
			super.update(elapsed);
			movepattern.Move();
		}
	}
	override public function draw():Void 
	{
		if (Seizon)
		{
			super.draw();
		}
	}
}