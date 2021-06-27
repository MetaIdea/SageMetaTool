NAME	 	= "RA3 Essential Tweaks"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNCRA3,CNCRA3U"
DESCRIPTION = "Unlimited Ore Nodes (uprising), No Superweapons, Coop Mode enabled"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function ChangeAllOreNodeMaxGatherValue(OreNodeMaxGatherValue)
	if not OreNodeMaxGatherValue then
		OreNodeMaxGatherValue = 10000000  --Original 30000
	end
	local OreNodeRef = ""
	local OreNodeRefList = {}
	local OreNodeType = { "OreNode", "OreNode2a", "OreNode2b", "OreNode4a", "OreNode4b", "OreNode4c", "OreNode4d" }
	--for i=1,getn(OreNodeType),1 do
		--ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TypeListOre", OreNodeType[i])
	--end
	for i=1,getn(OreNodeType),1 do
		repeat
			OreNodeRef = "object_" .. floor(GetRandomNumber()*99999999)
			ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", OreNodeType[i], "/team", OreNodeRef)
			ExecuteAction("NAMED_FLASH", OreNodeRef, 7)
			if EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef) then
				tinsert(OreNodeRefList, OreNodeRef)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef, OreNodeMaxGatherValue)
				ExecuteAction("UNIT_SET_TEAM", OreNodeRef, "PlyrCivilian/teamPlyrCivilian")
			else break end
		until(not EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef))
	end
	for i=1,getn(OreNodeRefList),1 do
		ExecuteAction("UNIT_SET_TEAM", OreNodeRefList[i], "/team")
	end
end

function DisableSuperweapons()
    local BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}
    local Superweapon_Buildings = 
    { 
		"JapanSuperWeaponAdvanced", "JapanSuperWeapon", 
		"JapanSuperWeaponAdvancedEgg", "JapanSuperWeaponEgg", 
		"AlliedSuperWeaponAdvanced", "AlliedSuperWeapon", 
		"SovietSuperWeaponAdvanced", "SovietSuperWeapon"
    }
    for i=1,getn(Superweapon_Buildings),1 do
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<1st Human Player's Enemies>", Superweapon_Buildings[i], false);
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<1st Human Player's Allies>", Superweapon_Buildings[i], false);
        --ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", Superweapon_Buildings[i], BUILDABILITY_TYPE["NO"])
		--ExecuteAction("DISABLE_UI_BUILD_BUTTON", "Command_Construct" .. Superweapon_Buildings[i], 1)	
    end
end

function EnableCoOp()
	ExecuteAction("PLAYER_ALLOWED_TOBE_COOPAI", "<1st Human Player's Allies>", true)
	ExecuteAction("SET_COOP_AI_COMMAND_UI_ENABLED", true)
	ExecuteAction("PLAYER_SET_ALLY_BUILDABILITY", "<1st Human Player>", "<1st Human Player's Allies>", true)
	--ExecuteAction("PLAYER_TOGGLE_RESOURCE_SHARING", "<All Players>", true)
end

DisableSuperweapons()
EnableCoOp()
ChangeAllOreNodeMaxGatherValue()

























function ChangeAllOreNodeMaxGatherValueAndSpawnExtraOre(OreNodeMaxGatherValue)
	if not OreNodeMaxGatherValue then OreNodeMaxGatherValue = 10000000 end
	local OreNodeRef = ""
	local OreNodeRef2 = ""
	local OreNodeRefList = {}
	local ObjectStatusIndex = { ["NO_COLLISIONS"] = 4 }	
	local OreNodeType = { "OreNode", "OreNode2a", "OreNode2b", "OreNode4a", "OreNode4b", "OreNode4c", "OreNode4d" }
	for i=1,getn(OreNodeType),1 do
		repeat
			OreNodeRef = "object_" .. floor(GetRandomNumber()*99999999)
			ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", OreNodeType[i], "/team", OreNodeRef)
			if EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef) then
				ExecuteAction("NAMED_FLASH", OreNodeRef, 7)
				OreNodeRef2 = "object_" .. floor(GetRandomNumber()*99999999)
				ExecuteAction("UNIT_SPAWN_NAMED_OBJECT_ON_TEAM_AT_NAMED_OBJECT_LOCATION", OreNodeRef2, OreNodeType[i], "PlyrCivilian/teamPlyrCivilian", OreNodeRef)		
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef, OreNodeMaxGatherValue)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef2, OreNodeMaxGatherValue)
				ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", OreNodeRef, ObjectStatusIndex["NO_COLLISIONS"], 1)
				ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", OreNodeRef2, ObjectStatusIndex["NO_COLLISIONS"], 1)
				tinsert(OreNodeRefList, OreNodeRef)
				tinsert(OreNodeRefList, OreNodeRef2)
				ExecuteAction("UNIT_SET_TEAM", OreNodeRef, "PlyrCivilian/teamPlyrCivilian")
			else break end
		until(not EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef))
	end
	for i=1,getn(OreNodeRefList),1 do
		ExecuteAction("UNIT_SET_TEAM", OreNodeRefList[i], "/team")
	end
end

function ChangeAllOreNodeMaxGatherValueAndSpawnOilDerrick(OreNodeMaxGatherValue)
	if not OreNodeMaxGatherValue then OreNodeMaxGatherValue = 10000000 end
	local OreNodeRef = ""
	local OreNodeRef2 = ""
	local OreNodeRefList = {}
	local ObjectStatusIndex = { ["NO_COLLISIONS"] = 4 }	
	local OreNodeType = { "OreNode", "OreNode2a", "OreNode2b", "OreNode4a", "OreNode4b", "OreNode4c", "OreNode4d" }
	for i=1,getn(OreNodeType),1 do
		repeat
			OreNodeRef = "object_" .. floor(GetRandomNumber()*99999999)
			ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", OreNodeType[i], "/team", OreNodeRef)
			if EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef) then
				ExecuteAction("NAMED_FLASH", OreNodeRef, 7)
				OreNodeRef2 = "object_" .. floor(GetRandomNumber()*99999999)
				ExecuteAction("UNIT_SPAWN_NAMED_OBJECT_ON_TEAM_AT_NAMED_OBJECT_LOCATION", OreNodeRef2, "OilDerrick", "PlyrCivilian/teamPlyrCivilian", OreNodeRef)		
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef, OreNodeMaxGatherValue)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef2, OreNodeMaxGatherValue)
				ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", OreNodeRef, ObjectStatusIndex["NO_COLLISIONS"], 1)
				ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", OreNodeRef2, ObjectStatusIndex["NO_COLLISIONS"], 1)
				tinsert(OreNodeRefList, OreNodeRef)
				tinsert(OreNodeRefList, OreNodeRef2)
				ExecuteAction("UNIT_SET_TEAM", OreNodeRef, "PlyrCivilian/teamPlyrCivilian")
			else break end
		until(not EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef))
	end
	for i=1,getn(OreNodeRefList),1 do
		ExecuteAction("UNIT_SET_TEAM", OreNodeRefList[i], "/team")
	end
end

function ChangeAllOreNodeMaxGatherValueAndSpawnMultiOreNode2(OreNodeMaxGatherValue)
	if not OreNodeMaxGatherValue then OreNodeMaxGatherValue = 10000000 end
	local OreNodeRef = ""
	local OreNodeRef2 = ""
	local OreNodeRef3 = ""
	local OreNodeRef4 = ""
	local BaseObjectType = "ChronoTargetMarker"
	local BaseObjectTypeRef = ""
	local OreNodeRefList = {}
	local OreNodeType = { "OreNode", "OreNode2a", "OreNode2b", "OreNode4a", "OreNode4b", "OreNode4c", "OreNode4d" }
	for i=1,getn(OreNodeType),1 do
		repeat
			OreNodeRef = "object_" .. floor(GetRandomNumber()*99999999)
			ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", OreNodeType[i], "/team", OreNodeRef)
			ExecuteAction("NAMED_FLASH", OreNodeRef, 7)
			if EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef) then
				OreNodeRef2 = "object_" .. floor(GetRandomNumber()*99999999)
				OreNodeRef3 = "object_" .. floor(GetRandomNumber()*99999999)
				OreNodeRef4 = "object_" .. floor(GetRandomNumber()*99999999)
				BaseObjectTypeRef = "object_" .. floor(GetRandomNumber()*99999999)
				ExecuteAction("UNIT_SPAWN_NAMED_OBJECT_ON_TEAM_AT_NAMED_OBJECT_LOCATION", BaseObjectTypeRef, BaseObjectType, "PlyrCivilian/teamPlyrCivilian", OreNodeRef)		
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", OreNodeRef2, OreNodeType[i], "PlyrCivilian/teamPlyrCivilian", BaseObjectType, 0)
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", OreNodeRef3, OreNodeType[i], "PlyrCivilian/teamPlyrCivilian", BaseObjectType, 120)
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", OreNodeRef4, OreNodeType[i], "PlyrCivilian/teamPlyrCivilian", BaseObjectType, 240)
				ExecuteAction("NAMED_DELETE", BaseObjectTypeRef)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef, OreNodeMaxGatherValue)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef2, OreNodeMaxGatherValue)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef3, OreNodeMaxGatherValue)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef4, OreNodeMaxGatherValue)
				tinsert(OreNodeRefList, OreNodeRef)
				tinsert(OreNodeRefList, OreNodeRef2)
				tinsert(OreNodeRefList, OreNodeRef3)
				tinsert(OreNodeRefList, OreNodeRef4)	
				ExecuteAction("UNIT_SET_TEAM", OreNodeRef, "PlyrCivilian/teamPlyrCivilian")
			else break end
		until(not EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef))
	end
	for i=1,getn(OreNodeRefList),1 do
		ExecuteAction("UNIT_SET_TEAM", OreNodeRefList[i], "/team")
	end
end