NAME	 	= "AI Versus Defeat Safety Protection"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "ANY"
DESCRIPTION	= "Slows down the enemy AI if you're about to lose"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

AI_TO_HUMAN_UNITCOUNT_RATIO_TRIGGER = 3.5 --enemy has x times local player units ammount
STRUCTURE_LOST_COUNT_TRIGGER = 2
INITIAL_DELAY_FOR_CHECK = 180
TIME_TO_REENABLE_AI = 180
TIME_BETWEEN_CHECK = 20
AI_DISABLED = {}

LOCALPLAYER_LAST_STRUCTURE_COUNT = 1
LOCALPLAYER_CURRENT_STRUCTURE_COUNT = 1
AI_TO_HUMAN_UNITCOUNT_RATIO = 1

function AIDefeatSafetyProtectionCheck()
	LOCALPLAYER_CURRENT_STRUCTURE_COUNT = CountTeamsKindOf(LocalTeam, "STRUCTURE")
	for i=1,getn(Teams),1 do
		if Relation[LocalTeam][Teams[i]] == RELATION_TYPE["Enemy"] then
			AI_TO_HUMAN_UNITCOUNT_RATIO = max(1,(CountTeamsKindOf(Teams[i],"VEHICLE") + CountTeamsKindOf(Teams[i],"AIRCRAFT") + CountTeamsKindOf(Teams[i],"INFANTRY"))) / max(1,(CountTeamsKindOf(HumanTeams[1],"VEHICLE") + CountTeamsKindOf(HumanTeams[1],"AIRCRAFT") + CountTeamsKindOf(HumanTeams[1],"INFANTRY")))
			if AI_TO_HUMAN_UNITCOUNT_RATIO < AI_TO_HUMAN_UNITCOUNT_RATIO_TRIGGER and (LOCALPLAYER_LAST_STRUCTURE_COUNT - LOCALPLAYER_CURRENT_STRUCTURE_COUNT) >= STRUCTURE_LOST_COUNT_TRIGGER then
				ExecuteAction("SKIRMISH_AI_TRANSFER_ALL", GetPlayerByTeam(Teams[i]), 0)
				ExecuteAction("MOVE_TEAM_HOME", Teams[i])
				ExecuteAction("MOVE_TEAM_TO", Teams[i], GetPlayerStartWaypointByTeam(Teams[i]))
				tinsert(AI_DISABLED, Teams[i])
				local ReenableAI = function()
					ExecuteAction("SKIRMISH_AI_TRANSFER_ALL", GetPlayerByTeam(Teams[%i]), 1)
				end
				SetScriptTimer(TIME_TO_REENABLE_AI,ReenableAI,1)
			end	
			SetCounter("RATIO", abs(max(0,floor(AI_TO_HUMAN_UNITCOUNT_RATIO+0.5))), "GUI:Status")
			SetCounter("BUILDINGSLOST", abs(max(0,LOCALPLAYER_LAST_STRUCTURE_COUNT - LOCALPLAYER_CURRENT_STRUCTURE_COUNT)), "GUI:Buildings")
		end
	end
	LOCALPLAYER_LAST_STRUCTURE_COUNT = LOCALPLAYER_CURRENT_STRUCTURE_COUNT
	--SetScriptTimer(TIME_BETWEEN_CHECK,AIDefeatSafetyProtectionCheck,1)
end

SetScriptTimer(TIME_BETWEEN_CHECK,AIDefeatSafetyProtectionCheck,-1)