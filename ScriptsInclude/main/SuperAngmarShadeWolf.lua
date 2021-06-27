NAME	 	= "Super Shade Wolf"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Get a super fast giant angmar shade wolf on game start"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

Object AngmarShadeWolf
	LocomotorSet
		Locomotor     = ShadeofWolfLocomotor
		Condition     = SET_NORMAL
		Speed         = 1440
	End
	RemoveModule ModuleTag_LifetimeUpdate
	Scale = 5
End

PlayerTemplate FactionMen
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionElves
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionDwarves
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionIsengard
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionMordor
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionWild
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionAngmar
	StartingUnit2 = AngmarShadeWolf
End

PlayerTemplate FactionArnor
	StartingUnit2 = AngmarShadeWolf
End


