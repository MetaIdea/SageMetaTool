NAME	 	= "Invincible"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "BFME2,BFME2ROTWK,CNC3TW,CNC3KW,CNCRA3,CNCRA3U"
DESCRIPTION = "Make local player invincible"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

--todo: GetTeamOfLocalPlayer()

ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", "Player_1/teamPlayer_1", "Indestructible", 1)