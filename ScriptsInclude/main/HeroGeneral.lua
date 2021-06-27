NAME	 	= "Hero General"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Each player receives a superpowered hero general unit, it must survive"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "This is an empty example gamemode", 300)

function HeroGeneralGamemode()
	if HeroGeneralGamemode_Initialized == 0 then
		HeroGeneralGamemode_Initialized = 1
		--CustomGameFinishConditionCheck = 1
		--ExecuteAction("SET_IGNORE_SKIRMISH_VICTORY_CONDITIONS", 1)
		for i=1,getn(GlobalTeamTable),1 do  
			local HeroGeneralRef = "HeroGeneral_" .. GetPlayerNameByTeam(GlobalTeamTable[i]) .. ""   
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", HeroGeneralRef, Hero_General_Selection, GlobalTeamTable[i], GetPlayerStartWaypointByTeam(GlobalTeamTable[i]))
			--TempGlobal=i
			--SetScriptTimer(1,'ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "EMPField", NeutralTeam, GetPlayerStartWaypointByTeam(GlobalTeamTable[i]))')	
			ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "EMPField", NeutralTeam, GetPlayerStartWaypointByTeam(GlobalTeamTable[i]))
			--ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION",RandomString(2),"EMPField",NeutralTeam,HeroGeneralRef,0)	  
			--ExecuteAction("UNIT_SET_MAX_LEVEL", HeroGeneralRef, 7)
			ExecuteAction("UNIT_SET_EXPERIENCE_POINTS", HeroGeneralRef, 100000)
			ExecuteAction("NAMED_CUSTOM_COLOR", HeroGeneralRef, UnitColorTable.white)
			ExecuteAction("UNIT_SET_HEALTH", HeroGeneralRef, 1000)
			ExecuteAction("NAMED_FLASH_WHITE", HeroGeneralRef, 5)
			ExecuteAction("NAMED_SET_STEALTH_ENABLED",HeroGeneralRef,1)
			if Hero_General_Overpowered == 1 then 
				ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "HeroGeneralBooster", GlobalTeamTable[i], GetPlayerStartWaypointByTeam(GlobalTeamTable[i]))	  
			end
			if GPOT[GlobalTeamTable[i]]["ai"] == 1 then
				ExecuteAction("UNIT_SET_STANCE", HeroGeneralRef, "HOLD_FIRE")
				ExecuteAction("NAMED_GUARD", HeroGeneralRef)		
				--ExecuteAction("UNIT_IDLE_FOR_SECONDS", HeroGeneralRef, 120)
				--ExecuteAction("UNIT_GUARD_FOR_SECONDS",HeroGeneralRef,120)		
				ExecuteAction("NAMED_SET_ATTITUDE",HeroGeneralRef,Behaviour["Normal"])
				ExecuteAction("UNIT_GUARD_POSITION",HeroGeneralRef,GetPlayerStartWaypointByTeam(GlobalTeamTable[i]))
			end	  
		end	
		ExecuteAction("SHOW_MILITARY_CAPTION", "HERO_GENERAL_GAMEMODE_ACTIVE", 5)
		if Human_Players_Count<2 then
			--ExecuteAction("OBJECT_FORCE_SELECT", HumanPlayerTable[1], "HeroGeneral_" .. GetPlayerNameByTeam(HumanPlayerTable[1]) .. "", "1", "placeholder")   
			ExecuteAction("MOVE_CAMERA_TO_NAMED","HeroGeneral_" .. GetPlayerNameByTeam(HumanPlayerTable[1]) .. "",0.2,0,0.3,0.3)  
			SetScriptTimer(1,'ExecuteAction("CAMERA_TETHER_NAMED", "HeroGeneral_" .. GetPlayerNameByTeam(HumanPlayerTable[1]) .. "", 1, "20.00")')
			SetScriptTimer(1,'ExecuteAction("HIDE_UI")')  
			SetScriptTimer(1,'ExecuteAction("DISABLE_INPUT")')
			SetScriptTimer(1,'ExecuteAction("ROTATE_CAMERA",1,3,0.5,0.1)')  
			SetScriptTimer(2,'ExecuteAction("PLAY_SOUND_EFFECT", "Aeva_UnitReady")')    
			SetScriptTimer(4,'ExecuteAction("CAMERA_STOP_TETHER_NAMED")')     
			SetScriptTimer(4,'ExecuteAction("SHOW_UI")')
			SetScriptTimer(4,'ExecuteAction("MOVIE_PLAY_RADAR","HEROGENERALGAMEMODE")')
			SetScriptTimer(4,'ExecuteAction("ENABLE_INPUT")')
			--ExecuteAction("CAMERA_LOOK_TOWARD_OBJECT","HeroGeneral_" .. GetPlayerNameByTeam(HumanPlayerTable[1]) .. "",5,2,2,2,50)
		end
	end
	for i=1,getn(GlobalTeamTable),1 do      
		if not EvaluateCondition("NAMED_NOT_DESTROYED", "HeroGeneral_" .. GetPlayerNameByTeam(GlobalTeamTable[i]) .. "") then ExecuteAction("TEAM_KILL", GlobalTeamTable[i]) end   
	end
    SetCounter("HEALTHCOUNTER", GetHealth("HeroGeneral_" .. GetPlayerNameByTeam(HumanPlayerTable[1]) .. ""), "Counter:HEALTH")
end