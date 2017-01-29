package enums;

/**
 * @author 
 */
enum CharacterSyu 
{
	No; 
	Gil;
	EnemySyu(enemy:EnemySyu);
	Sonota(sonota:Sonota);
}
enum EnemySyu
{
	WhiteSpell; BlueSpell; RedSpell; GreenSpell; FireElement;
	BlueWispSlow; BlueWispFast; RedWispSlow; RedWispFast;
	GreenSlime; BlackSlime; RedSlime; BlueSlime; DarkGreenSlime; DarkYellowSlime;
	BlueKnight; BlackKnight; MirrorKnight; HyperKnight; LizMan; RedKnight;
}
enum Sonota
{
	Key; Door; Treasure;
	FakeKey; FakeDoor; FakeTreasure;
}

