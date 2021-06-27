NAME	 	= "Resource Sharing"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "ANY"
DESCRIPTION = "Enable resource sharing between allies"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function CreateAllianceTeamsTable()
	AllianceTeams = {}
	local PartOfAlliance = function(player)
		for i=1,getn(AllianceTeams),1 do
			for j=1,getn(AllianceTeams[i]),1 do
				if Relation[player][AllianceTeams[i][j]] == RELATION_TYPE["Friend"] then
					return i
				end
			end	
		end
		return false
	end
	for i=1,getn(Players),1 do
		if not PartOfAlliance(Players[i]) then
			tinsert(AllianceTeams, {})
			tinsert(AllianceTeams[getn(AllianceTeams)], Players[i])
		else
			tinsert(AllianceTeams[PartOfAlliance(Players[i])], Players[i])
		end
	end
	return AllianceTeams
end

function GetMoney(player)
	ExecuteAction("SET_PLAYER_MONEY_TO_COUNTER", player, player .. "money")
	--ExecuteAction("COUNTER_MATH_COUNTER", COUNTER, MATH_OPERATOR, COUNTER)
	return GetCounterValue(player .. "money")
end

function CreditSharing()
	if not CreditSharingInit then
		CREDITS_NOW = {}
		CREDITS_LAST = {}
		for i=1,getn(AllianceTeams),1 do
			tinsert(CREDITS_NOW,0)
			tinsert(CREDITS_LAST,0)
		end
		for i=1,getn(AllianceTeams),1 do
			for j=1,getn(AllianceTeams[i]),1 do
				CREDITS_NOW[i] = CREDITS_NOW[i] + GetMoney(AllianceTeams[i][j])
				CREDITS_LAST[i] = CREDITS_NOW[i]		
			end
		end
		for i=1,getn(AllianceTeams),1 do
			for j=1,getn(AllianceTeams[i]),1 do
				ExecuteAction("PLAYER_SET_MONEY", AllianceTeams[i][j], CREDITS_NOW[i])
				--ExecuteAction("PLAYER_GIVE_MONEY", AllianceTeams[i][j], CREDITS_NOW[i]-CREDITS_LAST[i])			
			end	
		end
		CreditSharingInit = true
		return
	end
	for i=1,getn(AllianceTeams),1 do
		for j=1,getn(AllianceTeams[i]),1 do
			CREDITS_LAST[i] = CREDITS_NOW[i]
			CREDITS_NOW[i] = GetMoney(AllianceTeams[i][j])
		end
	end
	for i=1,getn(AllianceTeams),1 do
		for j=1,getn(AllianceTeams[i]),1 do
			--ExecuteAction("PLAYER_SET_MONEY", AllianceTeams[i][j], CREDITS_NOW[i])
			ExecuteAction("PLAYER_GIVE_MONEY", AllianceTeams[i][j], CREDITS_NOW[i]-CREDITS_LAST[i])
		end	
	end
end

function Init()
	CreateAllianceTeamsTable()
	if SAGE_GAME == CNCZH or SAGE_GAME == CNCGEN then
		SetScriptTimer(1,CreditSharing,-1)
	elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then
		SetScriptTimer(1,CreditSharing,-1)
	elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
		SetScriptTimer(1,CreditSharing,-1)
	elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
		ExecuteAction("PLAYER_TOGGLE_RESOURCE_SHARING", "<All Players>", 1)
	end		
end

Init()