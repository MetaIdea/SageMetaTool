NAME	 	= "AI Adaptive Boost"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION	= "Adaptive AI Boost when AI is about to loose"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

AI_TO_HUMAN_UNITCOUNT_RATIO_TRIGGER = 0.5 --= human has 2x units than AI
CASH_BOOST_AMMOUNT = 1000
TIME_BETWEEN_BOOST_CHECK = 20

function AdaptiveAIBoost()
	for i=1,getn(Teams),1 do
		if Relation[LocalTeam][Teams[i]] == RELATION_TYPE["Enemy"] then
			local AI_TO_HUMAN_UNITCOUNT_RATIO = (CountTeamsKindOf(Teams[i],"VEHICLE") + CountTeamsKindOf(Teams[i],"AIRCRAFT"))/(CountTeamsKindOf(HumanTeams[1],"VEHICLE") + CountTeamsKindOf(HumanTeams[1],"AIRCRAFT"))
			if AI_TO_HUMAN_UNITCOUNT_RATIO < AI_TO_HUMAN_UNITCOUNT_RATIO_TRIGGER then
				ExecuteAction("PLAYER_GIVE_MONEY", GetPlayerByTeam(Teams[i]), CASH_BOOST_AMMOUNT * (1/AI_TO_HUMAN_UNITCOUNT_RATIO))
			end		 
		end
	end
end

SetScriptTimer(TIME_BETWEEN_BOOST_CHECK,AdaptiveAIBoost,-1)
