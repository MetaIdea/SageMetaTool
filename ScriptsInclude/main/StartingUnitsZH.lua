NAME	 	= "Extra Starting Unit"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Get an extra (epic) unit on game start"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

Object AmericaInfantryColonelBurton
	Scale = 5
End

Object ChinaInfantryBlackLotus
	Scale = 5
End

Object GLAInfantryJarmenKell
	Scale = 5
End

PlayerTemplate FactionAmerica
	StartingUnit1 = AmericaInfantryColonelBurton
End

PlayerTemplate FactionAmericaSuperWeaponGeneral
	StartingUnit1 = AmericaInfantryColonelBurton
End

PlayerTemplate FactionAmericaLaserGeneral
	StartingUnit1 = AmericaInfantryColonelBurton
End

PlayerTemplate FactionAmericaAirForceGeneral
	StartingUnit1 = AmericaInfantryColonelBurton
End

PlayerTemplate FactionChina
	StartingUnit1 = ChinaInfantryBlackLotus
End

PlayerTemplate FactionChinaTankGeneral
	StartingUnit1 = ChinaInfantryBlackLotus
End

PlayerTemplate FactionChinaInfantryGeneral
	StartingUnit1 = ChinaInfantryBlackLotus
End

PlayerTemplate FactionChinaNukeGeneral
	StartingUnit1 = ChinaInfantryBlackLotus
End

PlayerTemplate FactionGLA
	StartingUnit1 = GLAInfantryJarmenKell
End

PlayerTemplate FactionGLAToxinGeneral
	StartingUnit1 = GLAInfantryJarmenKell
End

PlayerTemplate FactionGLADemolitionGeneral
	StartingUnit1 = GLAInfantryJarmenKell
End

PlayerTemplate FactionGLAStealthGeneral
	StartingUnit1 = GLAInfantryJarmenKell
End

PlayerTemplate FactionBossGeneral
	StartingUnit1 = AmericaInfantryColonelBurton
End