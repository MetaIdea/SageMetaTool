NAME	 	= "AllObjectsPreview"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Places every available object on the map"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "AllObjectsPreview", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

ObjectList = {}

INDEX = 0

-- TREES = {}

-- KEY_LIST = {"tree","flower","bush","shrub","grass"}

-- function HasKey(str)
	-- for i=1,getn(KEY_LIST),1 do
		-- if strfind(strlower(str), strlower(KEY_LIST[i])) then 
			-- return true
		-- end
	-- end
	-- return false
-- end

-- for i=1,getn(BFME2ROTWK_OBJECTS),1 do
	-- if HasKey(BFME2ROTWK_OBJECTS[i]) then 
		-- tinsert(TREES, BFME2ROTWK_OBJECTS[i])
	-- end
-- end

function GetObjectType()
	INDEX = INDEX + 1
	return BFME2ROTWK_OBJECTS[INDEX]
end

function RectangularSpiralLineSpawn2(ObjectType,team,centerX,centerY,number)
	for i=1,getn(ObjectList),1 do
		ExecuteAction("NAMED_DELETE",ObjectList[i])
	end
	local mindist = 200
	local x,y
	for i=0,number-1,1 do
	    x,y=rectSpiral(centerX,centerY,mindist,i)
		if type(ObjectType) == "function" then 
			tinsert(ObjectList, SpawnAtPosition(ObjectType(),team,x,y,15.976563))
		else 
			tinsert(ObjectList, SpawnAtPosition(ObjectType,team,x,y,15.976563))
		end
	end
end

RectangularSpiralLineSpawn2(GetObjectType,NeutralTeam,MapSizeX/2,MapSizeY/2,500)
