NAME	 	= "Diplomacy System"
VERSION		= "1.0"
TYPE		= "DISABLED"--"MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Dynamic alliances/teams"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

---------------------------------------------------------------------------
-------------------DIPLOMACY SYSTEM----------------------------------------
---------------------------------------------------------------------------

function NextPlayer(self)
	local TeamName = GetTeamName(self)
	if GPOT[TeamName]["DiplomacyTeamSelection"] == getn(GlobalTeamTable) then GPOT[TeamName]["DiplomacyTeamSelection"] = 1
	else GPOT[TeamName]["DiplomacyTeamSelection"] = GPOT[TeamName]["DiplomacyTeamSelection"] + 1 end
	if TeamName == GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]] then GPOT[TeamName]["DiplomacyTeamSelection"] = GPOT[TeamName]["DiplomacyTeamSelection"] + 1 end
	if GPOT[TeamName]["DiplomacyTeamSelection"] > getn(GlobalTeamTable) then GPOT[TeamName]["DiplomacyTeamSelection"] = 1 end
	if IsObjectFromLocalClient(self) then 
		print("" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\nselected") 
		--flash(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]])
		ExecuteAction("TEAM_FLASH_WHITE",GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 3)  
	end
end

function PrevPlayer(self)
	local TeamName = GetTeamName(self)
	if GPOT[TeamName]["DiplomacyTeamSelection"] == 1 then GPOT[TeamName]["DiplomacyTeamSelection"] = getn(GlobalTeamTable)
		else GPOT[TeamName]["DiplomacyTeamSelection"] = GPOT[TeamName]["DiplomacyTeamSelection"] - 1 end
	if TeamName == GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]] then GPOT[TeamName]["DiplomacyTeamSelection"] = GPOT[TeamName]["DiplomacyTeamSelection"] - 1 end
	if GPOT[TeamName]["DiplomacyTeamSelection"] < 1 then GPOT[TeamName]["DiplomacyTeamSelection"] = getn(GlobalTeamTable) end
	if IsObjectFromLocalClient(self) then 
		print("" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\nselected") 
		--flash(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]])
		ExecuteAction("TEAM_FLASH_WHITE",GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 3)  
	end
end

function GiveAcceptDenyOptions(team,acceptaction,denyaction,preaction)
	if acceptaction==nil then local NOOP = function() end denyaction=NOOP end
	tinsert(GPOT[team]["AcceptAction"],acceptaction)
	if denyaction==nil then local NOOP = function() end denyaction=NOOP end
	tinsert(GPOT[team]["DenyAction"],denyaction)
	if not EvaluateCondition("NAMED_NOT_DESTROYED", GPOT[team]["AcceptDenyObjRef"]) then 
		GPOT[team]["AcceptDenyObjRef"]=RandomString(5)
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GPOT[team]["AcceptDenyObjRef"], "Diplomacy_Choose_AcceptDeny", team, "((0.00,0.00,0.00))", 0)
	end
	if preaction~=nil then
		if type(preaction) == "string" then dostring(preaction)
		else preaction() end
	end
end

function Diplomacy_Choose_Accept(self)
	local TeamName=GetTeamName(self)
	if type(GPOT[TeamName]["AcceptAction"][1]) == "string" then dostring(GPOT[TeamName]["AcceptAction"][1])
	elseif type(GPOT[TeamName]["AcceptAction"][1]) == "function" then GPOT[TeamName]["AcceptAction"][1]() end
	tremove(GPOT[TeamName]["AcceptAction"],1)
	tremove(GPOT[TeamName]["DenyAction"],1)
	if getn(GPOT[TeamName]["AcceptAction"])==0 then
		local del = function() delete(GPOT[%TeamName]["AcceptDenyObjRef"]) end
		SetScriptTimer(1,del)
	end
end

function Diplomacy_Choose_Deny(self)
	local TeamName=GetTeamName(self)
	if type(GPOT[TeamName]["DenyAction"][1]) == "string" then dostring(GPOT[TeamName]["DenyAction"][1])
	elseif type(GPOT[TeamName]["DenyAction"][1]) == "function" then GPOT[TeamName]["DenyAction"][1]() end
	tremove(GPOT[TeamName]["AcceptAction"],1)
	tremove(GPOT[TeamName]["DenyAction"],1)
	if getn(GPOT[TeamName]["DenyAction"])==0 then
		local del = function() delete(GPOT[%TeamName]["AcceptDenyObjRef"]) end
		SetScriptTimer(1,del)
	end
end

function BreakAlliance(self)
	local TeamName = GetTeamName(self)
	SetRelation(TeamName, GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 0)
end

function RequestAlliance(self)
	local TeamName=GetTeamName(self)
	local OtherTeam=GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]
	local SetRelationAction = function() SetRelation(%TeamName,%OtherTeam,2) end
	local AllianceDeniedAction = function() print("alliance request denied") GiveMoney(%TeamName,3000) end
	if TeamRelations[TeamName][OtherTeam] == 0 then
		ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_RequestAllian", TeamName)      
		if GPOT[OtherTeam]["ai"]==0 then
			if not TeamName==TeamCommander then
				GiveAcceptDenyOptions(OtherTeam,SetRelationAction)   
				local RelationChangeNotification = "\n\n\n" .. strsub(OtherTeam, 1,  8) .. " / " .. GetFactionName(OtherTeam) .. " / " .. GetTeamsDescriptiveName(OtherTeam) .. "\ndo you want to create an alliance with\n\n" .. strsub(TeamName, 1,  8) .. " / " .. GetFactionName(TeamName) .. " / " .. GetTeamsDescriptiveName(TeamName) .. "\n?\n"
				print(RelationChangeNotification,5)
			else SetRelationAction() end
			else
			if random(100) < 34 then SetScriptTimer(random(4,8),SetRelationAction)
			else SetScriptTimer(random(4,8),AllianceDeniedAction) end
		end
	end
end  

function RequestAllianceAI(self) --case ai to ai (not case human to ai)
end

function RequestAlliedHelp(self,forcecommand)
	local TeamName = GetTeamName(self)
	local HelpAction = function()
		ExecuteAction("TEAM_GUARD_POSITION", GlobalTeamTable[GPOT[%TeamName]["DiplomacyTeamSelection"]], GetPlayerStartWaypointByTeam(%TeamName))
		ExecuteAction("ATTACK_MOVE_TEAM_TO", GlobalTeamTable[GPOT[%TeamName]["DiplomacyTeamSelection"]], GetPlayerStartWaypointByTeam(%TeamName))
		ExecuteAction("TEAM_GUARD_TEAM",GlobalTeamTable[GPOT[%TeamName]["DiplomacyTeamSelection"]],%TeamName)	
	end
	if TeamRelations[TeamName][GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]] == 2 then
		if GPOT[GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]]["ai"] == 1 then 
			if random(100) < 80 and forcecommand==nil then
				--SetScriptTimer(random(4,8),'ExecuteAction(" .. strchar(34) .. "TEAM_GUARD_TEAM" .. strchar(34) .. ", GlobalTeamTable[GPOT[" .. TeamName .. "]["DiplomacyTeamSelection"]], " .. TeamName .. ")')
				HelpAction()
				print("support is on it's way!")
				elseif forcecommand~=nil then HelpAction()
				else print("support currently not possible!") 
			end
			else
			if not TeamName==TeamCommander and forcecommand==nil then 
				local HelpRequestNotification = "\n\n\n" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\ndo you accept the help request from\n\n" .. strsub(TeamName, 1,  8) .. " / " .. GetFactionName(TeamName) .. " / " .. GetTeamsDescriptiveName(TeamName) .. "\n?\n"
				local HelpRequestDenied = "\n\n\n" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\nyour help request has been denied by\n\n" .. strsub(TeamName, 1,  8) .. " / " .. GetFactionName(TeamName) .. " / " .. GetTeamsDescriptiveName(TeamName) .. "\n\n"
				print(HelpRequestNotification,5)
				GiveAcceptDenyOptions(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]],HelpAction,HelpRequestDenied)
				else 
				local HelpRequestCommandIssued = "\n\n\n" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\nhas issued a unit help command to\n\n" .. strsub(TeamName, 1,  8) .. " / " .. GetFactionName(TeamName) .. " / " .. GetTeamsDescriptiveName(TeamName) .. "\n\n"
				print(HelpRequestCommandIssued,5)
				HelpAction() 
			end	 
		end
	end
end

function ShowAllRelations(self,ret)
	if not IsObjectFromLocalClient(self) then return end
	local t1 = strrep("\t ", 7)
	local AllRelationsString = ""
	AllRelationsString = "\nPlayer\t \t |"
	for i=1,getn(GlobalTeamTable),1 do AllRelationsString = AllRelationsString .. "\t \t \t " .. i .. "\t \t \t |" end
	AllRelationsString = AllRelationsString .. "\n_______|" .. strrep("_____|", getn(GlobalTeamTable))
	for k=1,getn(GlobalTeamTable),1 do
		AllRelationsString = AllRelationsString .. "\n" .. t1 .. "" .. k .. "\t \t \t |"
		for w=1,getn(GlobalTeamTable),1 do
			AllRelationsString = AllRelationsString .. "\t \t \t " .. TeamRelations[GlobalTeamTable[k]][GlobalTeamTable[w]] .. "\t \t \t |"
		end
		--AllRelationsString = AllRelationsString .. "\n_______|" .. strrep("_____|", getn(GlobalTeamTable))
	end
	AllRelationsString = AllRelationsString .. "\n0=enemy,  1=neutral,  2=friend"
	if ret ~= nil then return AllRelationsString
	else ExecuteAction("SHOW_MILITARY_CAPTION", "\n\n" .. AllRelationsString .. "\n", 15) end
end

function TemporaryMergeTeam(team1,team2,forcemerge)    --team_receiver=team1,team_to_transmit=team2
	if TeamRelations[team1][team2]==2 or forcemerge~=nil or GPOT[team2]["ai"]==0 then
		local MergeTeamProcess = function(team1,team2)
			if not GPOT[team1][team2]["TemporaryMergedTeam"] then 
				GPOT[team2]["VictoryConditionHelperRefForMergeTeamOP"] = RandomString(5)
				ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GPOT[team2]["VictoryConditionHelperRefForMergeTeamOP"],VictoryConditionHelper,team2,"((0.00,0.00,0.00))", 0)
				GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"]=GetStringRefListOfAllObjectsForTeam(team2)
				GPOT[team1][team2]["TemporaryMergedTeam"]=true
				for i=1,getn(GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"]),1 do
					ExecuteAction("UNIT_SET_TEAM",GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,team1)	
					ExecuteAction("NAMED_FLASH_WHITE",GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,3)
				end
				else
				for i=1,getn(GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"]),1 do
					ExecuteAction("UNIT_SET_TEAM", GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,team2)	
					ExecuteAction("NAMED_FLASH_WHITE", GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,3)		
				end
				GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"] = {} 
				GPOT[team1][team2]["TemporaryMergedTeam"]=false
				ExecuteAction("NAMED_DELETE",GPOT[team2]["VictoryConditionHelperRefForMergeTeamOP"])
			end
		end	
		local MergeTeamProcess_ = function() %MergeTeamProcess(%team1,%team2) end
		if GPOT[team2]["ai"]==0 and forcemerge==nil and not GPOT[team1][team2]["TemporaryMergedTeam"] and not team1==TeamCommander then 
			GiveAcceptDenyOptions(team2,MergeTeamProcess_)
			local RelationChangeNotification = "\n\n\n" .. strsub(team2, 1,  8) .. " / " .. GetFactionName(team2) .. " / " .. GetTeamsDescriptiveName(team2) .. "\n\ndo you want to temporarily give control of your team to\n\n" .. strsub(team1, 1,  8) .. " / " .. GetFactionName(team1) .. " / " .. GetTeamsDescriptiveName(team1) .. "\n?\n"
			print(RelationChangeNotification,5)
		else MergeTeamProcess(team1,team2) end
	end    
end   --TemporaryMergeTeam(AIPlayerTable[1],HumanPlayerTable[1],nil)

function TemporaryMergeAlliedTeam(self,forcemerge)
	TemporaryMergeTeam(GetTeamName(self),GlobalTeamTable[GPOT[GetTeamName(self)]["DiplomacyTeamSelection"]],forcemerge)
end

function TemporaryMergeOwnTeam(self,forcemerge)
	TemporaryMergeTeam(GlobalTeamTable[GPOT[GetTeamName(self)]["DiplomacyTeamSelection"]],GetTeamName(self),forcemerge)
end

function ToggleSwitchTeams(team1,team2,forceswitch)
	if TeamRelations[team1][team2] == 2 or forceswitch ~= nil or GPOT[team2]["ai"]==0 then
		local SwitchTeamProcess = function(team1,team2)
			VictCondHelperRef_team1 = RandomString(5)
			VictCondHelperRef_team2 = RandomString(5)
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", VictCondHelperRef_team1, VictoryConditionHelper, team1, "((0.00,0.00,0.00))", 0)
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", VictCondHelperRef_team2, VictoryConditionHelper, team2, "((0.00,0.00,0.00))", 0)	
			if not GPOT[team1][team2]["TemporaryMergedTeam"] then 
				GPOT[team1][team2]["TemporaryMergedTeam"]=true
				GPOT[team2][team1]["TemporaryMergedTeam"]=true
				GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"]=GetStringRefListOfAllObjectsForTeam(team1)
				GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"]=GetStringRefListOfAllObjectsForTeam(team2)
				for i=1,getn(GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"]),1 do
					ExecuteAction("UNIT_SET_TEAM",GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,team2)	
					ExecuteAction("NAMED_FLASH_WHITE",GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,3)
				end
				for i=1,getn(GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"]),1 do
					ExecuteAction("UNIT_SET_TEAM",GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"][i].ref,team1)	
					ExecuteAction("NAMED_FLASH_WHITE",GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"][i].ref,3)
				end
				else
				for i=1,getn(GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"]),1 do
					ExecuteAction("UNIT_SET_TEAM", GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,team1)	
					ExecuteAction("NAMED_FLASH_WHITE", GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"][i].ref,3)		
				end
				for i=1,getn(GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"]),1 do
					ExecuteAction("UNIT_SET_TEAM", GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"][i].ref,team2)	
					ExecuteAction("NAMED_FLASH_WHITE", GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"][i].ref,3)		
				end
				GPOT[team1][team2]["TemporaryMergedTeam"]=false
				GPOT[team1][team2]["TemporaryMergedTeamUnitsTable"] = {} 
				GPOT[team2][team1]["TemporaryMergedTeam"]=false
				GPOT[team2][team1]["TemporaryMergedTeamUnitsTable"] = {} 
				ExecuteAction("NAMED_DELETE",VictCondHelperRef_team1)
				ExecuteAction("NAMED_DELETE",VictCondHelperRef_team2)
			end
		end	
		local SwitchTeamProcess_ = function() %SwitchTeamProcess(%team1,%team2) end
		if GPOT[team2]["ai"]==0 and forceswitch==nil and not GPOT[team1][team2]["TemporaryMergedTeam"] and not team1==TeamCommander then 
			GiveAcceptDenyOptions(team2,SwitchTeamProcess_)
			local RelationChangeNotification = "\n\n\n" .. strsub(team2, 1,  8) .. " / " .. GetFactionName(team2) .. " / " .. GetTeamsDescriptiveName(team2) .. "\n\ndo you want to temporarily switch teams with with\n\n" .. strsub(team1, 1,  8) .. " / " .. GetFactionName(team1) .. " / " .. GetTeamsDescriptiveName(team1) .. "\n?\n"
			print(RelationChangeNotification,5)
		else SwitchTeamProcess(team1,team2) end --we need to do it twice to work
	end
end   --ToggleSwitchTeams(AIPlayerTable[1],HumanPlayerTable[1],nil)

function SwitchTeams(self,forceswitch)
	local team1 = GetTeamName(self)
	local team2 = GlobalTeamTable[GPOT[team1]["DiplomacyTeamSelection"]]
	ToggleSwitchTeams(team1,team2,forceswitch)
end

function GenericEventOutput(self, data)
	out(tostring(data))
end

function SwitchTeamsAllUnits(team1,team2)
	local VictCondHelperRef_team1 = RandomString(5)
	local VictCondHelperRef_team2 = RandomString(5)
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", VictCondHelperRef_team1, VictoryConditionHelper, team1, "((0.00,0.00,0.00))", 0)
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", VictCondHelperRef_team2, VictoryConditionHelper, team2, "((0.00,0.00,0.00))", 0)	
	local UnitListTeam1 = GetStringRefListOfAllObjectsForTeam(team1)
	local UnitListTeam2 = GetStringRefListOfAllObjectsForTeam(team2)
	for i=1,getn(UnitListTeam1),1 do
		ExecuteAction("UNIT_SET_TEAM", UnitListTeam1[i].ref,team2)	
		ExecuteAction("NAMED_FLASH_WHITE", UnitListTeam1[i].ref,3)		
	end
	for i=1,getn(UnitListTeam2),1 do
		ExecuteAction("UNIT_SET_TEAM", UnitListTeam2[i].ref,team1)	
		ExecuteAction("NAMED_FLASH_WHITE", UnitListTeam2[i].ref,3)		
	end
	ExecuteAction("NAMED_DELETE",VictCondHelperRef_team1)
	ExecuteAction("NAMED_DELETE",VictCondHelperRef_team2)
end 

function MergeTeams(team_receiver,team_victim,forcemerge)
	local MergeTeamProcess_ = function() ExecuteAction("TEAM_MERGE_INTO_TEAM",%team_victim,%team_receiver) end
	if (TeamRelations[team_receiver][team_victim]==2) or forcemerge~=nil then
		if GPOT[team_victim]["ai"]==0 and forcemerge==nil and not TeamCommander==team_receiver then 
			GiveAcceptDenyOptions(team_victim,MergeTeamProcess_)
			local RelationChangeNotification = "\n\n\n" .. strsub(team2, 1,  8) .. " / " .. GetFactionName(team2) .. " / " .. GetTeamsDescriptiveName(team2) .. "\n\ndo you want to give your entire team to (irreversible)\n\n" .. strsub(team1, 1,  8) .. " / " .. GetFactionName(team1) .. " / " .. GetTeamsDescriptiveName(team1) .. "\n?\n"
			print(RelationChangeNotification,5)
		else MergeTeamProcess_() end
	end
end  --MergeTeams(AIPlayerTable[1],HumanPlayerTable[1],nil)

function MergeTeamWithNextAllied(team,forcemerge)
	local ownTeam = ""
	if type(team)=="table" then ownTeam = GetTeamName(team)
	else ownTeam = team end
	for i=1,getn(GlobalTeamTable),1 do
		if (TeamRelations[ownTeam][GlobalTeamTable[i]] == 2) and (( (ownTeam ~= GlobalTeamTable[i]) and EvaluateCondition("TEAM_HAS_UNITS", GlobalTeamTable[i]) ) or forcemerge~=nil) then
			MergeTeams(ownTeam,GlobalTeamTable[i])
			TeamRelations[ownTeam][GlobalTeamTable[i]] = 1  --hacky
			return
		end	
	end
end

function MergeTeamWithNextEnemy(team,forcemerge)
	local ownTeam = ""
	if type(team)=="table" then ownTeam = GetTeamName(team)
	else ownTeam = team end
	for i=1,getn(GlobalTeamTable),1 do
		if (TeamRelations[ownTeam][GlobalTeamTable[i]] == 0) and (( (ownTeam ~= GlobalTeamTable[i]) and EvaluateCondition("TEAM_HAS_UNITS", GlobalTeamTable[i]) ) or forcemerge~=nil) then
			MergeTeams(ownTeam,GlobalTeamTable[i])
			TeamRelations[ownTeam][GlobalTeamTable[i]] = 1  --hacky
			return
		end	
	end
end

function TakeControlOfAllied(self)
	local TeamName = GetTeamName(self)
	local action = function() 
		ExecuteAction("TEAM_MERGE_INTO_TEAM", GlobalTeamTable[GPOT[%TeamName]["DiplomacyTeamSelection"]],%TeamName)
		print(GetTeamsDescriptiveName(%TeamName) .. " you now have control!")
	end
	if TeamRelations[TeamName][GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]] == 2 then
		if GPOT[GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]]["ai"] == 1 then
			action()
			else
			GiveAcceptDenyOptions(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]],action)
			local MergeRequestNotification = "\n\n\n" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\ndo you want to give irreversible control of all your units and buildings to \n\n" .. strsub(TeamName, 1,  8) .. " / " .. GetFactionName(TeamName) .. " / " .. GetTeamsDescriptiveName(TeamName) .. "\n?\n"
			print(MergeRequestNotification,5)	 
		end
	end	
end

function Diplomacy_MoveAttackCommand(self,forcecommand)
	local TRef = RandomString(5)
	local TeamName = GetTeamName(self)
	local actionfinal = function() ExecuteAction("ATTACK_MOVE_TEAM_TO_NAMED_OBJECT",GlobalTeamTable[GPOT[%TeamName]["DiplomacyTeamSelection"]],GetObj.Table(GPOT[%TeamName]["ChoosenPositionObjRefDest"])) end 
	local actionfirst = function() GiveChoosePositionOption(%TeamName,%actionfinal)   end
	--ExecuteAction("TEAM_GUARD_OBJECT",...)
	if GPOT[GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]]["ai"]==0 and forcecommand==nil and not TeamName==TeamCommander then 
		if (TeamRelations[TeamName][GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]]==2) then
			GiveAcceptDenyOptions(GPOT[TeamName]["DiplomacyTeamSelection"],actionfirst)
			local MoveAttackOrderNotification = "\n\n\n" .. strsub(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]], 1,  8) .. " / " .. GetFactionName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. " / " .. GetTeamsDescriptiveName(GlobalTeamTable[GPOT[TeamName]["DiplomacyTeamSelection"]]) .. "\n\ndo you want your units to receive a move-attack order from\n\n" .. strsub(TeamName, 1,  8) .. " / " .. GetFactionName(TeamName) .. " / " .. GetTeamsDescriptiveName(TeamName) .. "\n?\n"
			print(MoveAttackOrderNotification,5)   
		end
	else actionfirst() end
end

function InitializeTeamCommanderTable()
	TeamCommander=""
	TeamCommanderTable={}
	for i=1,getn(GlobalTeamTable),1 do
		TeamCommanderTable[GlobalTeamTable[i]]={}
		for j=1,getn(GlobalTeamTable),1 do
			if GlobalTeamTable[i]==GlobalTeamTable[j] then TeamCommanderTable[GlobalTeamTable[i]][GlobalTeamTable[j]]=1
			else TeamCommanderTable[GlobalTeamTable[i]][GlobalTeamTable[j]]=0 end 	  
		end
	end
end

function Diplomacy_ApplyForTeamCommander(self)
	local TeamName=GetTeamName(self)
	for i=1,getn(HumanPlayerTable),1 do
		if TeamName ~= HumanPlayerTable[i] and (TeamRelations[TeamName][HumanPlayerTable[i]]==2) then
			local accept = function() AcceptDenyTeamCommander(%HumanPlayerTable[%i],%TeamName,1) end
			local deny = function() AcceptDenyTeamCommander(%HumanPlayerTable[%i],%TeamName,0) end
			GiveAcceptDenyOptions(HumanPlayerTable[i],accept,deny) 
		end
	end
end

function AcceptDenyTeamCommander(ownteam,requestor,AcceptOrDeny)
	if AcceptOrDeny==1 then
		TeamCommanderTable[ownteam][requestor]=1 
		for i=1,getn(HumanPlayerTable),1 do if (TeamCommanderTable[HumanPlayerTable[i]][requestor]~=1) and (TeamRelations[ownteam][requestor]==2) then return end end
		local TeamCommanderChangeNotification = "\n\n\n" .. strsub(requestor, 1,  8) .. " / " .. GetFactionName(requestor) .. " / " .. GetTeamsDescriptiveName(requestor) .. "\n\has been accepted as team commander!"
		print(TeamCommanderChangeNotification,5) 
		TeamCommander=requestor
		else 
		TeamCommanderTable[ownteam][requestor]=0
		if TeamCommander==requestor then 
			TeamCommander="" 
			local TeamCommanderChangeNotification = "\n\n\n" .. strsub(requestor, 1,  8) .. " / " .. GetFactionName(requestor) .. " / " .. GetTeamsDescriptiveName(requestor) .. "\n\nis no longer team commander"
			print(TeamCommanderChangeNotification,5) 
			else
			local TeamCommanderChangeNotification = "\n\n\n" .. strsub(requestor, 1,  8) .. " / " .. GetFactionName(requestor) .. " / " .. GetTeamsDescriptiveName(requestor) .. "\n\your team commander application has been denied"
			print(TeamCommanderChangeNotification,5) 
		end
	end
end

function Diplomacy_SendMoney(self)
	GiveMoney(GlobalTeamTable[GPOT[GetTeamName(self)]["DiplomacyTeamSelection"]],500)  
end

function InitializeTeamRelations()  
	if StoryModeStatus or MetaGameStatus then GlobalTeamTable=MergeTables(ProperPlayerTeamTable,GetTeamTable("all"))  end --tempchange
    for i=1,getn(GlobalTeamTable),1 do
		TeamRelations[GlobalTeamTable[i]] = {}
		for j=1,getn(GlobalTeamTable),1 do
			--if i ~= j then TeamRelations[GlobalTeamTable[j]] = {} 
			TeamRelations[GlobalTeamTable[i]][GlobalTeamTable[j]] = 2
			--TeamRelations[GlobalTeamTable[j]][GlobalTeamTable[i]] = 2
		end
	end
	for h=1,getn(GlobalTeamTable),1 do      
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "TeamRelationsInitializator_" .. h .. "", "MetaControlTeamRelationsInitializator", GlobalTeamTable[h], "((0.00,0.00,0.00))", 0) 
	end
	if StoryModeStatus or MetaGameStatus then GlobalTeamTable = CopyTable(ProperPlayerTeamTable) end--tempchange 
end

function PrimaryTeamRelationsInitialization(self, other)
	--if Diplomacy_System == 1 or NativeArtOfDefense == 1 then
    if TeamRelationsInitialized ~= 1 then
		TeamRelationsInitialized = 1
		RefreshTeamTable()
		InitializeTeamRelations()
		InitializeTeamCommanderTable()
	end	
	local teamname1 = GetTeamName(self)
	local teamname2 = GetTeamName(other)
	TeamRelations[teamname1][teamname2] = 0
	TeamRelations[teamname2][teamname1] = 0
	--end	
end

function SetTeamRelationsTable(team1, team2, RelationType)
    if type(RelationType) == "string" then 
		if RelationType == "Enemy" then RelationType=0
			elseif RelationType == "Friend" then RelationType=2
		elseif RelationType == "Neutral" then RelationType=1 end
	end
	if TeamRelations[team1][team2] ~= RelationType or TeamRelations[team2][team1] ~= RelationType then
		TeamRelations[team1][team2] = RelationType
		TeamRelations[team2][team1] = RelationType
		return 0
		else return 1
	end
end

function RemoveRelation(team1, team2)
	ExecuteAction("TEAM_REMOVE_OVERRIDE_RELATION_TO_TEAM", team1, team2)
	ExecuteAction("TEAM_REMOVE_OVERRIDE_RELATION_TO_TEAM", team2, team1)
end

function RemoveAllRelations(team)
	ExecuteAction("TEAM_REMOVE_ALL_OVERRIDE_RELATIONS", team)	
end

function SetRelation_(team1, team2, RelationType)
	ExecuteAction("TEAM_SET_OVERRIDE_RELATION_TO_TEAM", team1, team2, RelationType)
	ExecuteAction("TEAM_SET_OVERRIDE_RELATION_TO_TEAM", team2, team1, RelationType)
end

RelationTypeString = { "Enemy", "Friend", "Neutral"}

function SetRelation(team1, team2, RelationType)
	if SetTeamRelationsTable(team1, team2, RelationType) == 0 then	 
		ExecuteAction("TEAM_AVAILABLE_FOR_RECRUITMENT", team1, 1)
		ExecuteAction("TEAM_AVAILABLE_FOR_RECRUITMENT", team2, 1) 
		if EvaluateCondition("COUNTER_COUNTER","METAMOD_EXTENDED_DIPLOMACY",CompareTable["EQ"],CounterTable[1]) then
			if EvaluateCondition("METAMOD_MAPSCRIPT_VERSION_2",CompareTable["EQ"],CounterTable[1]) then 
				RunMapScript("METAMOD_DIPLOMACY_PLAYER_" .. GetTeamNumber(team1) .. "_" ..  strupper(RelationTypeString[RelationType]), team2) 	  
				RunMapScript("METAMOD_DIPLOMACY_PLAYER_" .. GetTeamNumber(team2) .. "_" ..  strupper(RelationTypeString[RelationType]), team1) 	
				else
				SendScriptHostCodeMessage(tonumber(tostring(GetTeamNumber(team1)) .. tostring(GetTeamNumber(team2)) .. tostring(RelationType)),"DIPLOMACY_COMMAND_COUNTER")
				--SetCounter("DIPLOMACY_COMMAND_COUNTER",tonumber(tostring(GetTeamNumber(team1)) .. tostring(GetTeamNumber(team2)) .. tostring(RelationType)),nil,1)	
			end
			else
			ExecuteAction("TEAM_SET_OVERRIDE_RELATION_TO_TEAM", team1, team2, RelationType)
			ExecuteAction("TEAM_SET_OVERRIDE_RELATION_TO_TEAM", team2, team1, RelationType)
		end
		ExecuteAction("TEAM_FLASH_WHITE", team1, 3)
		ExecuteAction("TEAM_FLASH_WHITE", team2, 3)	
		local RelationTypeString = { [0]="breaks", [2]="creates"}
		local RelationChangeNotification = "\n\n\n" .. strsub(team1, 1,  8) .. " / " .. GetFactionName(team1) .. " / " .. GetTeamsDescriptiveName(team1) .. "\n\n" .. RelationTypeString[RelationType] .. " alliance with\n\n" .. strsub(team2, 1,  8) .. " / " .. GetFactionName(team2) .. " / " .. GetTeamsDescriptiveName(team2) .. "\n\n"
		if RelationType == "Friend" or RelationType == 2 then
			ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_AllianceForme", team1)
			ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_AllianceForme", team2)
			ExecuteAction("TEAM_CREATE_RADAR_EVENT", team1, RadarEventTable["Information"])
			ExecuteAction("TEAM_CREATE_RADAR_EVENT", team2, RadarEventTable["Information"])	  
			ExecuteAction("SHOW_MILITARY_CAPTION", RelationChangeNotification, 10)
			for i=1,getn(HumanPlayerTable),1 do
				if HumanPlayerTable[i] ~= team1 and HumanPlayerTable[i] ~= team2 then
					if (TeamRelations[HumanPlayerTable[i]][team1] == 0) and (TeamRelations[HumanPlayerTable[i]][team2] == 0) then ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_EnemyAlliaFor", HumanPlayerTable[i]) end
				end
			end	  
			elseif RelationType == "Enemy" or RelationType == 0 then
			ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_AllianceBroke", team1)
			ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_AllianceBroke", team2)
			ExecuteAction("TEAM_CREATE_RADAR_EVENT", team1, RadarEventTable["Banner"])
			ExecuteAction("TEAM_CREATE_RADAR_EVENT", team2, RadarEventTable["Banner"])	
			ExecuteAction("SHOW_MILITARY_CAPTION", RelationChangeNotification, 10)
		end
	end  
end

function TeamRelationRefresher()
end

function TeamValueRefresher() ----unfinished, conecpt, idea collection
	--EvaluateCondition("TEAM_THREAT_LEVEL", GlobalTeamTable[i], CompareTable["LT"], 5, 15000)
    --EvaluateCondition("EVAL_TEAM_HEALTH", team, CompareTable["LT"], percent)
    --EvaluateCondition("TEAM_HAS_UNITS", team1)
    --EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, int, "SELECTABLE")
    --EvaluateCondition("DISTANCE_BETWEEN_TEAM", team1, team2, CompareTable["LT"], distance)
	--ObjectCountNearbyEnemies(self, 420)	
	--local Behaviour = { ["Peaceful"]=0, ["Sleep"]=1, ["Passive"]=2, ["Normal"]=3, ["Alert"]=4, ["Agressive"]=5}
    --ExecuteAction("TEAM_SET_ATTITUDE", GlobalTeamTable[i], Behaviour[random(6)])
	--ExecuteAction("TEAM_INCREASE_PRIORITY", GlobalTeamTable[i])
	--ExecuteAction("TEAM_DECREASE_PRIORITY", GlobalTeamTable[i])
	--ExecuteAction("TEAM_INCREASE_PRIORITY_BY_VALUE", GlobalTeamTable[i], amount)
	--ExecuteAction("TEAM_DECREASE_PRIORITY_BY_VALUE", GlobalTeamTable[i], amount)	
	--ExecuteAction("TEAM_APPLY_ATTACK_PRIORITY_SET", team, attackpriorityset)
end

function TeamActionChooser() --unfinished,conecpt
	local ApproachPath_ = { "Center", "Backdoor", "Flank", "Special"}
    local ActionTable = {}
	local i = random(getn(GlobalTeamTable))
	local j = random(getn(GlobalTeamTable))
    ActionTable[1] = ExecuteAction("TEAM_ATTACK_TEAM", GlobalTeamTable[i], GlobalTeamTable[j])
	ActionTable[2] = ExecuteAction("ATTACK_MOVE_TEAM_TO", GlobalTeamTable[i], GetPlayerStartWaypointFromTeamNumber(j))	
	ActionTable[3] = ExecuteAction("TEAM_GUARD_TEAM", GlobalTeamTable[i], GlobalTeamTable[j])
	ActionTable[4] = ExecuteAction("TEAM_GUARD_POSITION", GlobalTeamTable[i], GetPlayerStartWaypointFromTeamNumber(j))
	ActionTable[5] = ExecuteAction("MOVE_TEAM_TO", GlobalTeamTable[i], GetPlayerStartWaypointFromTeamNumber(j))
	ActionTable[6] = ExecuteAction("MOVE_TEAM_HOME", GlobalTeamTable[i])
	ActionTable[7] = ExecuteAction("TEAM_WANDER_IN_PLACE", GlobalTeamTable[i])
	ActionTable[8] = ExecuteAction("TEAM_HUNT", GlobalTeamTable[i])
	ActionTable[9] = ExecuteAction("SKIRMISH_MOVE_TO_APPROACH_PATH", GlobalTeamTable[i], ApproachPath_[random(4)])	
	ActionTable[10] = ExecuteAction("SKIRMISH_FOLLOW_APPROACH_PATH", GlobalTeamTable[i], ApproachPath_[random(4)], 1)
	ActionTable[11] = ExecuteAction("TEAM_SET_SLEEP_STATUS", GlobalTeamTable[i], 1)	
	--ValidSourceType{ first_valid_source = 0, all_valid_source = 1}
	--ActionTable[12] = ExecuteAction("SKIRMISH_ATTACK_NEAREST_GROUP_WITH_VALUE", GlobalTeamTable[i], CompareTable["LT"], value)		
	--ActionTable[13] = ExecuteAction("SKIRMISH_PERFORM_COMMANDBUTTON_ON_MOST_VALUABLE_OBJECT", GlobalTeamTable[i], "command_...", radius, ValidSourceType["all_valid_source"])	
	ActionTable.random(10)
end

function DiplomacyGamemodeSetup()
	if Diplomacy_Initial_Setup_State == 0 then
		Diplomacy_Initial_Setup_State = 1
		CustomGameFinishConditionCheck = 1
		--ExecuteAction("SET_IGNORE_SKIRMISH_VICTORY_CONDITIONS", 1)
		if TeamRelationsInitialized ~= 1 then
			TeamRelationsInitialized = 1
			RefreshTeamTable()
			InitializeTeamRelations()
		end
		Disable_Fog_Of_War = 1
		--spawn("MetaControlDummyPermanentMapRevealerDelayer")
		for i=1,getn(HumanPlayerTable),1 do
			spawn("MetaControlDummyDiplomacyTabMenu",HumanPlayerTable[i],1,"DiplomacyTabMenu_" .. i .. "")
			--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "DiplomacyTabMenu_" .. i .. "", "MetaControlDummyDiplomacyTabMenu", HumanPlayerTable[i], "((0.00,0.00,0.00))", 0)        
		end
	end
end

function PeriodicTeamDiplomacyAdministration()
	if Diplomacy_Initial_Setup_State == 0 then DiplomacyGamemodeSetup() return end
	if not (random(100) < 10) or Diplomacy_Auto_AllianceChange == 0 then return end
	if EvaluateCondition("COMPARE_NUM_PLAYERS_IN_GAME", CompareTable["LT"], 2) then return end
    RefreshTeamTable()
	--TeamValueRefresher()		
	local randn1 = random(getn(GlobalTeamTable))
	local randn2 = random(getn(GlobalTeamTable))
	while (randn1 == randn2) do
		randn2 = random(getn(GlobalTeamTable))
	end
	local RandomTeam1 = GlobalTeamTable[randn1]
	local RandomTeam2 = GlobalTeamTable[randn2]	
    --local RelationType = { "Enemy", "Friend", "Neutral"}	
    local RelationType = { 0, 2, 1}	
	local RandomRelationType = RelationType[random(2)]	
	if RandomRelationType == TeamRelations[RandomTeam1][RandomTeam2] then
	    if RandomRelationType == 2 then RandomRelationType = 0
		else RandomRelationType = 2 end	
	end
	SetRelation(RandomTeam1,RandomTeam2, RandomRelationType)
	--TeamActionChooser()
end