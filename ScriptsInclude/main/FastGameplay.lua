NAME	 	= "Fast Gameplay"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Speed up unit and production speeds"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

ModifierList SpeedUpAttributeModifier
	Modifier = PRODUCTION 500%
	Modifier = RECHARGE_TIME 500%
	Modifier = SPEED 500%
	Duration = 0
End

Weapon SpeedUpAttributeModifiernWeapon
	RadiusDamageAffects   = ENEMIES NEUTRALS ALLIES
	AttackRange           = 500000.0
	WeaponSpeed           = 799999.2
	DelayBetweenShots     = 0
	AttributeModifierNugget
		SpecialObjectFilter = ALL
		Radius = 500000.0	
		AttributeModifier = SpeedUpAttributeModifier
	End
End

Object WaterSparkleTest
	AddModule
		Behavior = FireWeaponUpdate FireWeaponUpdateModuleTag1
			FireWeaponNugget
				WeaponName = SpeedUpAttributeModifiernWeapon
				FireDelay = 0
				OneShot = No
			End
		End
	End
	RemoveModule ModuleTag_01
End

Object EvilSpellBook
	KindOf = SPELL_BOOK IMMOBILE IGNORES_SELECT_ALL
	AddModule
		Behavior = FireWeaponUpdate FireWeaponUpdateModuleTag1
			FireWeaponNugget
				WeaponName = SpeedUpAttributeModifiernWeapon
				FireDelay = 0
				OneShot = No
			End
		End
	End
	AddModule 
		Behavior = AIUpdateInterface ModuleTag_88
			AutoAcquireEnemiesWhenIdle = Yes
		End
	End
End

Object GoodSpellBook
	KindOf = SPELL_BOOK IMMOBILE IGNORES_SELECT_ALL
	AddModule 
		Behavior = FireWeaponUpdate FireWeaponUpdateModuleTag1
			FireWeaponNugget
				WeaponName = SpeedUpAttributeModifiernWeapon
				FireDelay = 0
				OneShot = No
			End
		End
	End
	AddModule 
		Behavior = AIUpdateInterface ModuleTag_88
			AutoAcquireEnemiesWhenIdle = Yes
		End
	End
End

PlayerTemplate FactionMen
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionElves
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionDwarves
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionIsengard
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionMordor
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionWild
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionAngmar
	StartingUnit2 = WaterSparkleTest
End

PlayerTemplate FactionArnor
	StartingUnit2 = WaterSparkleTest
End