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
		Reg.GilPos = this;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	override public function draw():Void 
	{
		super.draw();
	}
}