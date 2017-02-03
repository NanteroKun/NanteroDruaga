package typedefs;

import enums.CharacterSyu;

/**
 * @author 
 */
typedef TsuikaEnemyTable =
{
	var syu:CharacterSyu;
	var x:Float;
	var y:Float;
	var m:Muki;
	var wait:Int;
}
/**
 * フロアスタート時に何が何匹出るかで使うやつ
 */
typedef EnemySyutsugenTable =
{
	var syu:CharacterSyu;//何が
	var num:Int;		//何匹
}
typedef BlockPoint =
{
	var center:Bool;
	var bx:Int;
	var by:Int;
}