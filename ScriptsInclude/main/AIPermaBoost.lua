NAME	 	= "AI Perma Boost"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION	= "Permanent AI Boost"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

CASH_BOOST_AMMOUNT = 2000
TIME_BETWEEN_BOOST = 20

function PermaAIBoost()
	for i=1,getn(AITeams),1 do
		if Relation[LocalTeam][AITeams[i]] == RELATION_TYPE["Enemy"] then
			local PLAYER_TO_BOOST = GetPlayerByTeam(AITeams[i])
			ExecuteAction("PLAYER_GIVE_MONEY", PLAYER_TO_BOOST, CASH_BOOST_AMMOUNT)
			ExecuteAction("SET_BASE_CONSTRUCTION_SPEED", PLAYER_TO_BOOST, 2)
			ExecuteAction("PLAYER_SET_BASE_POWER", PLAYER_TO_BOOST, 10000)
		end
	end
end

SetScriptTimer(TIME_BETWEEN_BOOST, PermaAIBoost, -1)