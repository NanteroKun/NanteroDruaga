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
import typedefs.TsuikaEnemyTable;

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
		FloorStartEnemySet(Reg.floor);
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
		for (e in TsuikaEnemy.EnemyBorn)
		{
			if (e.syu != CharacterSyu.No)
			{
				if (e.wait > 0)
				{
					e.wait--;
				}
				if (e.wait == 0)
				{
					EnemyUmu(e.syu, e.x, e.y, e.m);
					e.syu = CharacterSyu.No;
				}
			}
		}
		TsuikaEnemy.EnemyBorn= TsuikaEnemy.EnemyBorn.filter(function (s:TsuikaEnemyTable):Bool
		{
			return s.syu != CharacterSyu.No;
		});
		trace(TsuikaEnemy.EnemyBorn.length);
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
	private function FloorStartEnemySet(floor:Int):Void
	{
		for (i in 0...25)
		{
				var s = CharacterSyu.EnemySyu(RedSlime);
				var k:Int = FlxG.random.int(0, 10);
				k = 0;
				var s:TsuikaEnemyTable={syu:CharacterSyu.No, x:0, y:0, m:0, wait:0};
				switch(k)
				{
					case 0:s = {syu:CharacterSyu.EnemySyu(RedSlime), x:0, y:0, m:0, wait:90};
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
				if (s.syu != CharacterSyu.No)
				{
					TsuikaEnemy.TsuikaEnemyTableSet(s);
				}
		}
	}
}
