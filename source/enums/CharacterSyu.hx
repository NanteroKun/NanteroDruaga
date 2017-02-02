package enums;

/**
 * @author 
 */
enum CharacterSyu 
{
	No; 
	Gil;
	EnemySyu(enemy:EnemySyu);
	SpellSyu(jumon:SpellSyu);
	Sonota(sonota:Sonota);
}
enum EnemySyu
{
	BlueWispSlow; BlueWispFast; RedWispSlow; RedWispFast;
	GreenSlime; BlackSlime; RedSlime; BlueSlime; DarkGreenSlime; DarkYellowSlime;
	BlueKnight; BlackKnight; MirrorKnight; HyperKnight; LizardMan; RedKnight; HyperKnightSuper;
}
enum SpellSyu
{
	WhiteSpell; BlueSpell; RedSpell; GreenSpell; FireElement;
}
enum Sonota
{
	Key; Door; Treasure;
	FakeKey; FakeDoor; FakeTreasure;
}

