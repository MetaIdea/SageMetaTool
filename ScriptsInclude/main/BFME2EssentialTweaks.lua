NAME	 	= "BFME2 Essential Tweaks"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Raise Commandpoint limit, add Skybox"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function CommandPointReset()
	ExecuteAction("OVERRIDE_PLAYER_COMMAND_POINTS", "<All Players>", 10000, 20000)
end

SetScriptTimer(5,CommandPointReset,-1)

function EnableSkybox()
	ExecuteAction("DRAW_SKYBOX_BEGIN")
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"CAH_Skybox",NeutralTeam,{MapSizeX, MapSizeY/2, 0}, 0)
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"CAH_Skybox",NeutralTeam,{0, MapSizeY/2, 0}, PI)
end

-- ExecuteAction("PLAYER_SET_PLAYER_POWER_POINTS", PLAYER, INT)
-- ExecuteAction("PLAYER_SET_MAX_PLAYER_POWER_POINTS", PLAYER, INT)
-- ExecuteAction("PLAYER_SET_RANKLEVELLIMIT", 1000)
-- ExecuteAction("PLAYER_SET_MAX_SPELLPOINTS", "<All Players>", INT)
-- ExecuteAction("PLAYER_SET_RANKLEVEL", PLAYER, INT)
-- ExecuteAction("PLAYER_SET_RANKLEVELLIMIT", INT)
-- ExecuteAction("PLAYER_ADD_SKILLPOINTS", "<All Players>", INT)
-- ExecuteAction("SET_HERO_EXPERIENCE_SHARING", 1)
-- ExecuteAction("PLAYER_ADD_RANKLEVEL", "<All Players>", INT)
-- ExecuteAction("DRAW_SKYBOX_BEGIN")
-- ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "CreateAHero", LocalTeam, LocalPlayer .. "_Start")
-- ExecuteAction("SET_MAX_REDEPLOYMENT_COUNT", PLAYER, INT)
-- EvaluateCondition("ANY_HERO_REACHED_RANK", PLAYER, INT, INT)