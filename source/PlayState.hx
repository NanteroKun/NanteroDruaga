package;

import disp.*;
import enemy.Enemy;
import enemy.TsuikaEnemy;
import enemy.slime.*;
import enemy.wisp.*;
import enemy.knight.*;
import enemy.magician.*;
import enemy.ghost.*;
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
		Reg.floor = 1;
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
		TsuikaEnemy.EnemyBorn = TsuikaEnemy.EnemyBorn.filter(function (s:TsuikaEnemyTable):Bool
		{
			return s.syu != CharacterSyu.No;
		});
	}
	/**
	 * 
	 * @param	syu 生み出すキャラクターの種類
	 * @param	x 生まれる座標
	 * @param	y
	 * @param	m 生まれる時の向き
	 */
	private function EnemyUmu(syu:CharacterSyu, x:Float, y:Float, m:Muki):Void
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
	/**
	 * 
	 * @param	floor フロア開始時のキャラクタどものセット
	 */
	private function FloorStartEnemySet(floor:Int):Void
	{
		var floorstartenemy:List<EnemySyutsugenTable> = floorstartenemysettable(floor);
		var enemys:List<CharacterSyu> = new List<CharacterSyu>();
		for (e in floorstartenemy)
		{
			if (e.syu != CharacterSyu.No && e.num > 0)
			{
				for (i in 0...e.num)
				{
					enemys.add(e.syu);
				}
			}
		}
		var num:Int = 0;
		for (e in enemys)
		{
			num++;
			var s:TsuikaEnemyTable = {syu:CharacterSyu.No, x:0, y:0, m:Muki.ue, wait:0};
			s.syu = e;
			if (s.syu != CharacterSyu.No)
			{
				switch (s.syu)
				{
					case CharacterSyu.EnemySyu(BlackKnight), CharacterSyu.EnemySyu(BlueKnight),
						 CharacterSyu.EnemySyu(RedKnight), CharacterSyu.EnemySyu(LizardMan)
						 :s.wait =Std.int(((num - 1) * 32 + 16) / 2);
					case CharacterSyu.EnemySyu(HyperKnight), CharacterSyu.EnemySyu(MirrorKnight)
						:s.wait = Std.int(((num - 1) * 32 + 16) / 8);
					default:
				}
				s.wait += 120;
				TsuikaEnemy.TsuikaEnemyTableSet(s);
			}
		}
		TsuikaEnemy.TsuikaEnemyTableSet({syu:CharacterSyu.EnemySyu(BlueWispFast),x:0,y:0,m:Muki.ue,wait:600});//タイムオーバー時の追い出しウィスプ（TEST)
	}
	private function floorstartenemysettable(floor:Int):List<EnemySyutsugenTable>
	{
		var temp:List<EnemySyutsugenTable> = new List<EnemySyutsugenTable>();
		switch (floor)
		{
			case 1://temp.add({syu:CharacterSyu.EnemySyu(GreenSlime), num:8});
					//temp.add({syu:CharacterSyu.EnemySyu(BlueKnight), num:3});
					//temp.add({syu:CharacterSyu.EnemySyu(HyperKnightSuper), num:1});
					//temp.add({syu:CharacterSyu.EnemySyu(DarkYellowSlime), num:30});
					temp.add({syu:CharacterSyu.EnemySyu(Mage), num:1});
					temp.add({syu:CharacterSyu.EnemySyu(Druid), num:1});
					temp.add({syu:CharacterSyu.EnemySyu(Wizard), num:1});
					temp.add({syu:CharacterSyu.EnemySyu(Sorcerer), num:1});
				temp.add({syu:CharacterSyu.EnemySyu(DarkGreenSlime), num:2});
				temp.add({syu:CharacterSyu.EnemySyu(DruidGohst), num:2});
				temp.add({syu:CharacterSyu.EnemySyu(WizardGohst), num:2});
				temp.add({syu:CharacterSyu.EnemySyu(MageGohst), num:2});
				temp.add({syu:CharacterSyu.EnemySyu(SorcererGohst), num:2});
		}
		return temp;
	}
}
