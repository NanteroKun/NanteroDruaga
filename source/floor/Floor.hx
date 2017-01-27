package floor;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Floor extends FlxObject
{
	private var back00:FlxSprite;//外壁
	private var back01:FlxSprite;//レンガ模様と柱
	private var mazepattern:Maze;
	public function new() 
	{
		super();
		back00 = new FlxSprite();
		back00.loadGraphic("assets/images/wall/floorbackgroundblack.png");
		back00.setPosition(0, 16);
		back01 = new FlxSprite();
		back01.loadGraphic("assets/images/wall/underfloor.png");
		back01.setPosition(0, 16);
		mazepattern = new Maze();
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	override public function draw():Void 
	{
		super.draw();
		back01.draw();
		back00.draw();
		mazepattern.draw();
	}
}