NAME	 	= "Versus TurtleBase"
VERSION		= "1.0"
TYPE		= "DISABLED" --"GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Destroy a super turtle fortress base\nThis gamemode is inspired by the LodR Battle for Middle Earth Xbox exclusive gamemode"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

GAMEMODE = "SIEGE"

ExecuteAction("SHOW_MILITARY_CAPTION", "NAME:AttackMove", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

