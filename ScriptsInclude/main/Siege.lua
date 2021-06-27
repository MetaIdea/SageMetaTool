NAME	 	= "Siege"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Anti rush protection for 5 minutes"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

PROTECTION_TIME_IN_MINUTES = 5

ExecuteAction("SHOW_MILITARY_CAPTION", "APT:GameMode", 7)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

function EnableSiege()
	Area = {"SiegeGameplayBarrier", "CombatZone", "InnerPerimeter1", "InnerPerimeter2", "InnerPerimeter3", "InnerPerimeter4", "InnerPerimeter5", "InnerPerimeter6", "InnerPerimeter7", "InnerPerimeter8", "OuterPerimeter1", "OuterPerimeter2", "OuterPerimeter3", "OuterPerimeter4", "OuterPerimeter5", "OuterPerimeter6", "OuterPerimeter7", "OuterPerimeter8", "[Skirmish]EnemyInnerPerimeter", "[Skirmish]EnemyOuterPerimeter", "[Skirmish]MyInnerPerimeter", "[Skirmish]MyOuterPerimeter"}
	for i=1,getn(Area),1 do
		ExecuteAction("HUMAN_IMPASSABLE_AREA", Area[i], 1)
	end
	TempRelation = {}
	for i=1,getn(Players),1 do
		if PartOf(AIPlayers, Players[i]) then
			ExecuteAction("PLAYER_AI_CHANGETACTICAL", Players[i], 0)
			ExecuteAction("PLAYER_ALLOW_AI_AUTOACQUIRE", Players[i], 0)
			ExecuteAction("TEAM_SET_AI_RECRUITABLE_FLAG", GetTeamByPlayer(Players[i]), 0)
			ExecuteAction("TEAM_SET_ATTITUDE", GetTeamByPlayer(Players[i]), Behaviour["Peaceful"])
		end
		for j=1,getn(Players),1 do
			if Players[i] ~= Players[j] then
				if Relation[Players[i]][Players[j]] == RELATION_TYPE["Enemy"] then
					ExecuteAction("PLAYER_RELATES_PLAYER", Players[i], Players[j], RELATION_TYPE["Neutral"])
					ExecuteAction("PLAYER_RELATES_PLAYER", Players[j], Players[i], RELATION_TYPE["Neutral"])
					tinsert(TempRelation, {Players[i], Players[j]})
				end
			end
		end
	end
end

function DisableSiege()
	ExecuteAction("SHOW_MILITARY_CAPTION", "GUI:Start", 7)	
	Area = {"SiegeGameplayBarrier", "CombatZone", "InnerPerimeter1", "InnerPerimeter2", "InnerPerimeter3", "InnerPerimeter4", "InnerPerimeter5", "InnerPerimeter6", "InnerPerimeter7", "InnerPerimeter8", "OuterPerimeter1", "OuterPerimeter2", "OuterPerimeter3", "OuterPerimeter4", "OuterPerimeter5", "OuterPerimeter6", "OuterPerimeter7", "OuterPerimeter8", "[Skirmish]EnemyInnerPerimeter", "[Skirmish]EnemyOuterPerimeter", "[Skirmish]MyInnerPerimeter", "[Skirmish]MyOuterPerimeter"}
	for i=1,getn(Area),1 do
		ExecuteAction("HUMAN_IMPASSABLE_AREA", Area[i], 0)
	end
	for i=1,getn(Players),1 do
		if PartOf(AIPlayers, Players[i]) then
			ExecuteAction("PLAYER_AI_CHANGETACTICAL", Players[i], 1)
			ExecuteAction("PLAYER_ALLOW_AI_AUTOACQUIRE", Players[i], 1)
			ExecuteAction("TEAM_SET_AI_RECRUITABLE_FLAG", GetTeamByPlayer(Players[i]), 1)
			ExecuteAction("TEAM_SET_ATTITUDE", GetTeamByPlayer(Players[i]), Behaviour["Normal"])
		end
	end
	for i=1,getn(TempRelation),1 do
		ExecuteAction("PLAYER_RELATES_PLAYER", TempRelation[i][1], TempRelation[i][1], RELATION_TYPE["Enemy"])
		ExecuteAction("PLAYER_RELATES_PLAYER", TempRelation[i][2], TempRelation[i][1], RELATION_TYPE["Enemy"])
	end
	TempRelation = {}
end

function Init()
	EnableSiege()
	SetScriptTimer(PROTECTION_TIME_IN_MINUTES*60, DisableSiege, 1)
	SetTimerCounter(PROTECTION_TIME_IN_MINUTES*60, "APT:Time", "StartTimer") 
end

Init()


