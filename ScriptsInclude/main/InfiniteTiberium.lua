NAME	 	= "Infinite Tiberium"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Tiberium cannot deplete"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function RefillTiberiumFieldCoroutine()
	for i=1,getn(TiberiumCrystal),1 do 
		if EvaluateCondition("NAMED_DESTROYED", TiberiumCrystal[i]) then
			--print("Refill Tiberium " .. TiberiumCrystalPosition[i][1] .. " " .. TiberiumCrystalPosition[i][2] .. " " .. TiberiumCrystalPosition[i][3])
			TiberiumCrystal[i] = "object_" .. floor(99999999*GetRandomNumber())
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", TiberiumCrystal[i], "TiberiumCrystal", NeutralTeam, TiberiumCrystalPosition[i], 0) --{x,y,GetHeightAtPosition(x,y)}
		end
	end
end

function InitGamemode()
	local TRef = ""
	
	TiberiumCrystal = {}
	TiberiumCrystalPosition = {}
	ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumCrystalTypeList", "TiberiumCrystal")
    ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumCrystalTypeList", "TiberiumCrystalBlue")
	for i=1,CountTeamsKindOf(NeutralTeam,"TIBERIUM"),1 do 
		TRef = "object_" .. floor(99999999*GetRandomNumber())
		ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE","TiberiumCrystalTypeList",NeutralTeam,TRef)
		if EvaluateCondition("NAMED_NOT_DESTROYED",TRef) then 
			tinsert(TiberiumCrystal,TRef)
			ExecuteAction("UNIT_SET_TEAM",TRef,CivilianTeam)
		end
	end
	for i=1,getn(TiberiumCrystal),1 do 
		ExecuteAction("UNIT_SET_TEAM",TiberiumCrystal[i],NeutralTeam) 
		tinsert(TiberiumCrystalPosition, {ObjectGetPosition(GetObjectLuaRef(TiberiumCrystal[i]))})
	end
		
	TiberiumField = {}
	ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumFieldList", "TiberiumField")
    ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumFieldList", "TiberiumFieldBlue")	
	for i=1,CountTeamsKindOf(NeutralTeam,"TIBERIUM_FIELD"),1 do
		TRef = "object_" .. floor(99999999*GetRandomNumber())
		ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE","TiberiumFieldList",NeutralTeam,TRef)
		if EvaluateCondition("NAMED_NOT_DESTROYED",TRef) then 
			tinsert(TiberiumField,TRef)
			ExecuteAction("UNIT_SET_TEAM",TRef,CivilianTeam)
			ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", TRef, "Enabled", 0) 
		end
	end
	for i=1,getn(TiberiumField),1 do 
		ExecuteAction("UNIT_SET_TEAM", TiberiumField[i], NeutralTeam) 
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", TiberiumField[i], "Enabled", 0) 
	end	
	
	SetScriptTimer(1,RefillTiberiumFieldCoroutine,-1)
end

SetScriptTimer(3,InitGamemode,1)


-- x,y,z = ObjectGetPosition(GetObjectLuaRef(TiberiumCrystal[1]))
-- print(getn(TiberiumCrystal))