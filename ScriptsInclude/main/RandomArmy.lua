NAME	 	= "Random Army 1"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Each player receives a random army - no base building"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "\n\nRANDOM ARMY GAMEMODE", 10)

InitialUnitsCount = {}

function RandomArmyGamemode()
	if RandomArmy_Initialized == 0 then
		RandomArmy_Initialized = 1
		--CustomGameFinishConditionCheck = 1
		--ExecuteAction("SET_IGNORE_SKIRMISH_VICTORY_CONDITIONS", 1)
		for k,v in globals() do
			if strfind(tostring(k), "ObjID") and strfind(tostring(ObjectDescription(v)), "BASE_FLAG") then
				ExecuteAction("NAMED_DELETE", v) 		  
			end
		end
		for i=1,random(1,2),1 do  
			spawnForAllTeams(NAOD.UnitTable.Infantry1[random(getn(NAOD.UnitTable.Infantry1))], min(random(3,7),random(0,7))) 
			spawnForAllTeams(NAOD.UnitTable.Infantry2[random(getn(NAOD.UnitTable.Infantry2))], max(random(0,4),random(0,3))) 
			spawnForAllTeams(NAOD.UnitTable.Infantry3[random(getn(NAOD.UnitTable.Infantry3))], min(random(0,1),random(0,1))) 
			spawnForAllTeams(NAOD.UnitTable.Vehicle1[random(getn(NAOD.UnitTable.Vehicle1))], max(random(0,7),random(0,7))) 
			spawnForAllTeams(NAOD.UnitTable.Vehicle2[random(getn(NAOD.UnitTable.Vehicle2))], max(random(0,3),random(0,7))) 
			spawnForAllTeams(NAOD.UnitTable.Air1[random(getn(NAOD.UnitTable.Air1))], min(random(0,7),random(0,7))) 
			spawnForAllTeams(NAOD.UnitTable.Air2[random(getn(NAOD.UnitTable.Air2))], min(random(0,4),random(0,4))) 
			spawnForAllTeams(NAOD.UnitTable.Vehicle3[random(getn(NAOD.UnitTable.Vehicle3))], max(random(0,4),random(0,4)))
			spawnForAllTeams(NAOD.UnitTable.Vehicle3[random(getn(NAOD.UnitTable.Vehicle3))], max(random(0,3),random(0,3)))		
			spawnForAllTeams(NAOD.UnitTable.Vehicle4[random(getn(NAOD.UnitTable.Vehicle4))], random(0,1)) 		
		end
		InitialUnitsCount[GlobalTeamTable[1]]=CountAllObjectsOfTeam(GlobalTeamTable[1])
		ExecuteAction("SHOW_MILITARY_CAPTION", "RANDOM_ARMY_GAMEMODE_ACTIVE", 5)
		SetScriptTimer(5,'ExecuteAction("PLAY_SOUND_EFFECT", "Aeva_ReinforcReady")')
		ExecuteAction("MOVIE_PLAY_RADAR", "RANDOMARMYGAMEMODE")
	end
	for i=1,getn(GlobalTeamTable),1 do     
		if not EvaluateCondition("TEAM_HAS_UNITS", GlobalTeamTable[i]) then 
			--ExecuteAction("TEAM_KILL", GlobalTeamTable[i]) 
			ExecuteAction("NAMED_DELETE", GetObj.TableByType(VictoryConditionHelper,GlobalTeamTable[i]))
		end   
	end
    SetCounter("HEALTHCOUNTER", floor(100*CountAllObjectsOfTeam(GlobalTeamTable[1])/InitialUnitsCount[GlobalTeamTable[1]]), "Counter:HEALTH")
end