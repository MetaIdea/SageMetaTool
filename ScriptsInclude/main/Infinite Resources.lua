NAME	 	= "Infinite Resources"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "ANY"
DESCRIPTION = "Infinite Resources for all players"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

PLAYER = "<All Players>"
ExecuteAction("PLAYER_SET_MONEY", PLAYER, 7777777)
ExecuteAction("SET_BASE_CONSTRUCTION_SPEED", PLAYER, 5)
ExecuteAction("PLAYER_SET_BASE_POWER", PLAYER, 10000)
