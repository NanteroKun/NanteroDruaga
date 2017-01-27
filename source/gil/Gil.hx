package gil;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author 
 */
class Gil extends Character
{
	private var direct:FlxPoint = FlxPoint.get(0, 0);
	public function new() 
	{
		super();
		loadGraphic("assets/images/gil/Gil.png",true,16,16);
		animation.add("idle0", [0], 30, false);
		animation.add("idle1", [2], 30, false);
		animation.add("idle2", [4], 30, false);
		animation.add("idle3", [6], 30, false);
		setPosition(20, 36);
		speed = 2;
		muki = 2;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		direct.set();
		if(FlxG.keys.pressed.LEFT) {
            direct.x=-1;
        }
        if(FlxG.keys.pressed.UP) {
            direct.y =-1;
        }
        if(FlxG.keys.pressed.RIGHT) {
            direct.x = 1;
        }
        if(FlxG.keys.pressed.DOWN) {
            direct.y = 1;
        }
		x += direct.x * speed; 
		y += direct.y * speed;
		Reg.GilPos.x = x; 
		Reg.GilPos.y = y;
	}
	private function MoveCheck(d:FlxPoint):FlxPoint
	{
		var d:FlxPoint = FlxPoint.get(0, 0);
		return d;
	}
}