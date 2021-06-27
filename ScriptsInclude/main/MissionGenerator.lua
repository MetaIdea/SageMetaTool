NAME	 	= "Mission Generator"
VERSION		= "1.0"
TYPE		= "DISABLED"--"GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Procedural mission generator"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

MISSION_OBJECTIVES = {"MOVE TO POSITION", "BUILD BASE AT POSITION", "BUILD OBJECT", "USE ABILITY ON DESTINATION", "DESTROY OBJECT", "DESTROY ENEMY", "FIND OBJECT ON MAP", "GAIN RESSOURCES", "DEFEND OBJECT", "DEFEND PASSTHROUGH"}

local MissionObj = { "Aeva_NewObjectReci","Aeva_NewMissObjRec"}
ExecuteAction("PLAY_SOUND_EFFECT", MissionObj[random(1,2)])