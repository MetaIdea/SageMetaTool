NAME	 	= "City Generator"
VERSION		= "1.0"
TYPE		= "DISABLED"--"GAMEMODE"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Map Mod: Randomly generated forests with animal placements"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "Nature Generator", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

TREE_NUM = 300
ANIMAL_NUM = 100

TREES = {}

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
	"Fish",
	"Egret",
	"Wolf",
	"Dog",
	"DeerMale",
	"Rabbit",
	"Raccoon",
	"Bear",
	"BirdEmitter",
	"RockofDOOMEmitter",
	"AnimalWanderPoint",
	"Pig",
	"Duck",
	"Boar",
	"Cow",
	"Sheep",
	"TropicalFish"
}

function NatureGenerator()
	for i=1,TREE_NUM,1 do
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), TREES[random(getn()TREES)], NeutralTeam, {random(MapSizeX), random(MapSizeY), 0}, random(360))
	end

	for i=1,ANIMAL_NUM,1 do
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), ANIMALS[random(getn()ANIMALS)], NeutralTeam, {random(MapSizeX), random(MapSizeY), 0}, random(360))
	end
end

NatureGenerator()