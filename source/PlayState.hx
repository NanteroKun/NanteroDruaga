package;

import disp.GamenUpDisp;
import disp.Time;
import enemy.Enemy;
import enemy.TsuikaEnemy;
import enemy.slime.*;
import enemy.wisp.RedWispFast;
import enums.CharacterSyu;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.group.FlxGroup.FlxTypedGroup;
import floorfolder.Floor;
import player.Player;

class PlayState extends FlxState
{
	private var floorcnt:Int;
	private var background:FlxObject;
	private var gil:Player;
	private var enemygroup:FlxTypedGroup<Enemy>;
	private var cam:FlxCamera;
	private var GamenUp:GamenUpDisp;
	private var ZanTime:Time;
	override public function create():Void
	{
		super.create();
		FlxG.debugger.visible = true;
		FlxG.debugger.drawDebug = true;
		Reg.font = FlxBitmapFont.fromXNA("assets/images/font/NamcoFont.png", " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.@,;?!");
		GamenUp = new GamenUpDisp();
		add(GamenUp);
		ZanTime = new Time();
		add(ZanTime);
		background = new Floor();
		add(background);
		gil = new Player();
		add(gil);
		enemygroup = new FlxTypedGroup<Enemy>();
		enemygroup = Enemy.Init(100);
		add(enemygroup);
		cam = FlxG.camera;
		cam.setPosition(0, 0);
		cam.width = 464;
		cam.height = 288;
		FlxG.worldBounds.set(0, 0, 464, 288);
		floorcnt = 0;
		Reg.zantime = 2000;
		TsuikaEnemy.Init();
		EnemySet(Reg.floor);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		floorcnt++;
		Reg.gamecount++;
		cam.x = (-gil.x -8)* Reg.GamenSize + 112 * Reg.GamenSize;
		cam.x = Reg.clamp(cam.x, -240 * Reg.GamenSize, 0);
		Reg.score+= 531;
		Reg.zantime-= 1;
		if (FlxG.keys.pressed.ESCAPE){FlxG.resetState(); }
		EnemyTsuika();
	}
	override public function draw():Void 
	{
		super.draw();
	}
	private function EnemyTsuika()
	{
		for (i in 0...100)
		{
			if (TsuikaEnemy.EnemyBorn[i].syu != CharacterSyu.No)
			{
				if (TsuikaEnemy.EnemyBorn[i].wait > 0)
				{
					TsuikaEnemy.EnemyBorn[i].wait--;
				}
				if (TsuikaEnemy.EnemyBorn[i].wait == 0)
				{
					EnemyUmu(TsuikaEnemy.EnemyBorn[i].syu, TsuikaEnemy.EnemyBorn[i].x, TsuikaEnemy.EnemyBorn[i].y, TsuikaEnemy.EnemyBorn[i].m);
				//	trace(TsuikaEnemy.EnemyBorn[i].syu);
					TsuikaEnemy.EnemyBorn[i].syu = CharacterSyu.No;
				}
			}
		}
	}
	private function EnemyUmu(syu:CharacterSyu, x:Float, y:Float, m:Int):Void
	{
		var temp:Enemy;
		temp = enemygroup.getFirstDead();
		if (temp != null)
		{
			temp.setPosition(x, y);
			temp.muki = m;
			temp.Set(syu);
			temp.revive();
		}
	}
	private function EnemySet(floor:Int):Void
	{
		for (i in 0...50)
		{
				var s = CharacterSyu.EnemySyu(RedSlime);
				var k:Int = FlxG.random.int(0, 10);
				k = 0;
				switch(k)
				{
					case 0:TsuikaEnemy.TsuikaEnemyTableSet(CharacterSyu.EnemySyu(RedSlime), 0, 0, 0, 60 + FlxG.random.int(0, 100));
					/*
					case 1:temp.Set(CharacterSyu.EnemySyu(BlackSlime));
					case 2:temp.Set(CharacterSyu.EnemySyu(GreenSlime));
					case 3:temp.Set(CharacterSyu.EnemySyu(BlueSlime));
					case 4:temp.Set(CharacterSyu.EnemySyu(DarkGreenSlime));
					case 5:temp.Set(CharacterSyu.EnemySyu(DarkYellowSlime));
					
					case 6:temp.Set(CharacterSyu.EnemySyu(BlueWispFast));
					case 7:temp.Set(CharacterSyu.EnemySyu(BlueWispSlow));
					case 8:temp.Set(CharacterSyu.EnemySyu(RedWispFast));
					case 9:temp.Set(CharacterSyu.EnemySyu(RedWispSlow));
					case 10:temp.Set(CharacterSyu.EnemySyu(BlueKnight));
					
					*/
				}
		}
	}
}
