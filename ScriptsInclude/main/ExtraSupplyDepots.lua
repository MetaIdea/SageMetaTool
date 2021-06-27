NAME	 	= "Extra Supply Depots"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Adds one more supply depot next to every existing depot"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function ExtraSupplyDepots()
	local x,y,z
	local ObjectList = {}
	local ObjectType
	local DuplicateOffset = 85
	for objectIndex,object in globals() do
		if strfind(objectIndex, "ObjID") then
			ObjectType = GetObjectType(object)
			if ObjectType == "SupplyDock" or ObjectType == "SupplyPile" or ObjectType == "SupplyWarehouse" then
				tinsert(ObjectList, {object,ObjectType})
			end
		end
	end
	for i=1,getn(ObjectList),1 do
		x,y,z = ObjectGetPosition(ObjectList[i][1])
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), ObjectList[i][2], NeutralTeam, {x+DuplicateOffset,y+DuplicateOffset,GetGroundHeight(x+DuplicateOffset,y+DuplicateOffset)}, ObjectGetRotation(ObjectList[i][1]))
	end
end

ExtraSupplyDepots()