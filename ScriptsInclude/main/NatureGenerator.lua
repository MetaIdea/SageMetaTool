NAME	 	= "Nature Generator"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Map Mod: Randomly generated forests with animal placements"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "Nature Generator", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

TREE_NUM = 2000
SHRUB_NUM = 1500
ANIMAL_NUM = 200

TREES = {
	"ElvenWoodTree",
	"GenericInteractableOptimizedTree",
	"TreeLothlorien01",
	"TreeLothlorien02",
	"TreeNew01",
	"TreeShire04",
	"PTClumps01",
	"PTree23",
	"PTree24",
	"PTree25",
	"TreeBanyan",
	"TreeF01",
	"TreeF02",
	"TreeDalbergia",
	"TreeDalbergia3",
	"TreeDalbergia4",
	"TreeDalbergia5",
	"TreeF03a",
	"TreeF03b",
	"TreeF03c",
	"TreeF03d",
	"TreeForlindon01",
	"TreeForlindon02",
	"TreeForlindon03",
}
--GenericHarvestOnlyOptimizedTree
--GenericHarvestOnlyOptimizedTreeA
--GenericInteractableOptimizedTree
--GenericNONInteractableOptimizedTree

SHRUB = {
	-- "OldForestShrub01",
	-- "OldForestShrub02",
	-- "OldForestShrub03",
	-- "OldForestShrub04",
	-- "OldForestShrub05",
	-- "OldForestShrub06",
	-- "OldForestShrub07",
	-- "OldForestShrub08",
	-- "OldForestShrub09",
	"PelBush01",
	"PelBush02",
	"PelBush03",
	"ElvenWoodFlowerGrass",
	"ElvenWoodGrass",
}

ANIMALS = {
	"Crow_Perched",
	"Dove_Perched",
	"Crow",
	"Dove_white_in_game",
	"Bat",
	"GoatMale",
	"GoatFemale",
	"ElkMale",
	"ElkFemale",
	"HorseGrazing",
	"Chicken",
	--"Fish",
	"Egret",
	"Wolf",
	"Dog",
	"DeerMale",
	"Rabbit",
	"Raccoon",
	"Bear",
	"BirdEmitter",
	--"RockofDOOMEmitter",
	"AnimalWanderPoint",
	"Pig",
	"Duck",
	"Boar",
	"Cow",
	"Sheep",
	--"TropicalFish"
}

function NatureGenerator()
	for i=1,TREE_NUM,1 do
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), TREES[random(getn(TREES))], NeutralTeam, {random(ceil(MapSizeX*0.1),ceil(MapSizeX*0.9)), random(ceil(MapSizeX*0.1),ceil(MapSizeX*0.9)),15.976563}, random(360))
	end
	for i=1,SHRUB_NUM,1 do
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), SHRUB[random(getn(SHRUB))], NeutralTeam, {random(ceil(MapSizeX*0.1),ceil(MapSizeX*0.9)), random(ceil(MapSizeX*0.1),ceil(MapSizeX*0.9)), 15.976563}, random(360))
	end
	for i=1,ANIMAL_NUM,1 do
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), ANIMALS[random(getn(ANIMALS))], NeutralTeam, {random(ceil(MapSizeX*0.1),ceil(MapSizeX*0.9)), random(ceil(MapSizeX*0.1),ceil(MapSizeX*0.9)), 15.976563}, random(360))
	end
end

NatureGenerator()


-- ObjectList = {}

-- INDEX = 0

-- function GetObjectType()
	-- --INDEX = INDEX + 1
	-- return TREES_[random(getn(TREES_))] --TREES[INDEX]
-- end

-- NatureGenerator()

-- function RectangularSpiralLineSpawn2(ObjectType,team,centerX,centerY,number)
	-- for i=1,getn(ObjectList),1 do
		-- ExecuteAction("NAMED_DELETE",ObjectList[i])
	-- end
	-- local mindist = 200
	-- local x,y
	-- for i=0,number-1,1 do
	    -- x,y=rectSpiral(centerX,centerY,mindist,i)
		-- if type(ObjectType) == "function" then 
			-- tinsert(ObjectList, SpawnAtPosition(ObjectType(),team,x,y,15.976563))
		-- else 
			-- tinsert(ObjectList, SpawnAtPosition(ObjectType,team,x,y,15.976563))
		-- end
	-- end
-- end



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

-- for i=1,getn(BFMEII_ROTWK_OBJECT_LIST_ALL),1 do
	-- if HasKey(BFMEII_ROTWK_OBJECT_LIST_ALL[i]) then 
		-- tinsert(TREES, BFMEII_ROTWK_OBJECT_LIST_ALL[i])
	-- end
-- end







--RectangularSpiralLineSpawn2(GetObjectType,NeutralTeam,MapSizeX/2,MapSizeY/2,400)

-- OBJECT = ""
-- x,y = 100,100
-- function SpawnNext()
	-- ExecuteAction("NAMED_DELETE",OBJECT)
	-- OBJECT = SpawnAtPosition(GetObjectType(),NeutralTeam,x,y,15.976563)
	-- WriteToFile(TREES[INDEX], [[C:\Users\Maxi\Documents\Meta\output.txt]])
	-- x=x+50
-- end
-- SpawnNext()

NatureGenerator()