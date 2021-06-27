NAME	 	= "Example Gamemode"
VERSION		= "1.2"
TYPE		= "DISABLED" 		--"GAMEMODE","CONFIG","MOD","DISABLED"
GAME		= "CNC4"   			--POSSIBLE GAME: "ANY" or "" or "ALL", "CNCGEN", "CNCZH", "CNC3TW", "CNC3KW", "CNCRA3", "CNCRA3U", "CNC4", "BFME2", BFME2ROTWK", "BFME1"
DESCRIPTION	= "This is an example gamemode template"
AUTHOR 		= "Mjstral"
PASTEBIN	= "https://pastebin.com/raw/RiAcuwts"

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "APT:GameMode", 300)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")