NAME	 	= "Deathmatch"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Survival of the fittest with fixed income for all players + all Tiberium fields and crystals permanently removed"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

KindOfTable={
	["OBSTACLE"]=0,["SELECTABLE"]=1,["TARGETABLE"]=2,["ALLY_TARGETABLE"]=3,["IMMOBILE"]=4,["CAN_ATTACK"]=5,["STICK_TO_TERRAIN_SLOPE"]=6,["CAN_CAST_REFLECTIONS"]=7,["SHRUBBERY"]=8,["STRUCTURE"]=9,["INFANTRY"]=10,["CAVALRY"]=11,["MONSTER"]=12,["MACHINE"]=13,["AIRCRAFT"]=14,["HUGE_VEHICLE"]=15,["DOZER"]=16,["SWARM_DOZER"]=17,["HARVESTER"]=18,["COMMANDCENTER"]=19,["CASTLE_CENTER"]=20,["SALVAGER"]=21,["WEAPON_SALVAGER"]=22,["TRANSPORT"]=23,["BRIDGE"]=24,["CANT_TOGGLE_POWER"]=25,["SIEGE_WEAPON"]=26,
	["PROJECTILE"]=27,["PRELOAD"]=28,["NO_GARRISON"]=29,["CASTLE_KEEP"]=30,["SHADOW_ULTRA_HIGH_ONLY"]=31,["NO_COLLIDE"]=32,["REPAIR_PAD"]=33,["HEAL_PAD"]=34,["STEALTH_GARRISON"]=35,["SUPPLY_GATHERING_CENTER"]=36,["AIRFIELD"]=37,["DRAWABLE_ONLY"]=38,["MP_COUNT_FOR_VICTORY"]=39,["REBUILD_HOLE"]=40,["SCORE"]=41,["SCORE_CREATE"]=42,["SCORE_DESTROY"]=43,["NO_HEAL_ICON"]=44,["CAN_RAPPEL"]=45,["PARACHUTABLE"]=46,["CAN_BE_REPULSED"]=47,["MOB_NEXUS"]=48,["IGNORED_IN_GUI"]=49,["CRATE"]=50,["CAPTURABLE"]=51,
	["LINKED_TO_FLAG"]=52,["CLEARED_BY_BUILD"]=53,["SMALL_MISSILE"]=54,["ALWAYS_VISIBLE"]=55,["UNATTACKABLE"]=56,["MINE"]=57,["CAN_PLACE_CHARGE"]=58,["PORTABLE_STRUCTURE"]=59,["ALWAYS_SELECTABLE"]=60,["ATTACK_NEEDS_LINE_OF_SIGHT"]=61,["WALK_ON_TOP_OF_WALL"]=62,["DEFENSIVE_WALL"]=63,["FS_POWER"]=64,["FS_FACTORY"]=65,["FS_BASE_DEFENSE"]=66,["FS_TECHNOLOGY"]=67,["AIRCRAFT_PATH_AROUND"]=68,["LOW_OVERLAPPABLE"]=69,["FORCEATTACKABLE"]=70,["AUTO_RALLYPOINT"]=71,["CAN_CAPTURE"]=72,["POWERED"]=73,
	["PRODUCED_AT_HELIPAD"]=74,["DRONE"]=75,["CAN_SEE_THROUGH_STRUCTURE"]=76,["BALLISTIC_MISSILE"]=77,["CLICK_THROUGH"]=78,["SUPPLY_SOURCE_ON_PREVIEW"]=79,["PARACHUTE"]=80,["GARRISONABLE_UNTIL_DESTROYED"]=81,["BOAT"]=82,["IMMUNE_TO_CAPTURE"]=83,["HULK"]=84,["CAN_PLACE_MANIPULATOR"]=85,["SPAWNS_ARE_THE_WEAPONS"]=86,["CANNOT_BUILD_NEAR_SUPPLIES"]=87,["SUPPLY_SOURCE"]=88,["REVEAL_TO_ALL"]=89,["DISGUISER"]=90,["INERT"]=91,["HERO"]=92,["IGNORES_SELECT_ALL"]=93,["DONT_AUTO_CRUSH_INFANTRY"]=94,["SIEGE_TOWER"]=95,
	["TREE"]=96,["SHRUB"]=97,["CLUB"]=98,["ROCK"]=99,["THROWN_OBJECT"]=100,["GRAB_AND_KILL"]=101,["OPTIMIZED_PROP"]=102,["ENVIRONMENT"]=103,["DEFLECT_BY_SPECIAL_POWER"]=104,["WORKING_PASSENGER"]=105,["BASE_FOUNDATION"]=106,["NEED_BASE_FOUNDATION"]=107,["REACT_WHEN_SELECTED"]=108,["CAN_BE_CAPTURED"]=109,["IGNORED_IN_FINDPOSITIONAROUND"]=110,["HORDE"]=111,["COMBO_HORDE"]=112,["NONOCCLUDING"]=113,["NO_FREEWILL_ENTER"]=114,["TIBERIUM_FIELD"]=115,["BEAM_TARGET"]=116,["BEAM_TARGET_REFLECTOR"]=117,
	["TACTICAL_MARKER"]=118,["PATH_THROUGH_EACH_OTHER"]=119,["NOTIFY_OF_PREATTACK"]=120,["GARRISON"]=121,["MELEE_HORDE"]=122,["BASE_SITE"]=123,["INERT_SHROUD_REVEALER"]=124,["OCL_BIT"]=125,["SPELL_BOOK"]=126,["DEPRECATED"]=127,["PATH_THROUGH_INFANTRY"]=128,["NO_FORMATION_MOVEMENT"]=129,["NO_BASE_CAPTURE"]=130,["ARMY_SUMMARY"]=131,["CIVILIAN_UNIT"]=132,["NOT_AUTOACQUIRABLE"]=133,["KEEP_CLASSIFIED_WHEN_DEAD"]=134,["CHUNK_VENDOR"]=135,["ARCHER"]=136,["MOVE_ONLY"]=137,["FS_CASH_PRODUCER"]=138,
	["ROCK_VENDOR"]=139,["BLOCKING_GATE"]=140,["CRANE"]=141,["SIEGE_LADDER"]=142,["MINE_TRIGGER"]=143,["BUFF"]=144,["GRAB_AND_DROP"]=145,["PORTER"]=146,["SCARY"]=147,["CRITTER_EMITTER"]=148,["BROADCASTS_INVISIBILITY"]=149,["CAN_ATTACK_WALLS"]=150,["IGNORE_FOR_VICTORY"]=151,["DO_NOT_CLASSIFY"]=152,["WALL_UPGRADE"]=153,["ARMY_OF_DEAD"]=154,["TAINT"]=155,["BASE_DEFENSE_FOUNDATION"]=156,["NOT_SELLABLE"]=157,["WEBBED"]=158,["WALL_HUB"]=159,["BUILD_FOR_FREE"]=160,["IGNORE_FOR_EVA_SPEECH_POSITION"]=161,
	["MADE_OF_WOOD"]=162,["MADE_OF_METAL"]=163,["MADE_OF_STONE"]=164,["MADE_OF_DIRT"]=165,["FACE_AWAY_FROM_CASTLE_KEEP"]=166,["BANNER"]=167,["META_HORDE"]=168,["CAN_REVERSE_MOVE"]=169,["PASS_EXPERIENCE_TO_SLAVER"]=170,["HAS_HEALTH_BAR"]=171,["BIG_MONSTER"]=172,["DEPLOYED_MINE"]=173,["CANNOT_RETALIATE"]=174,["CREEP"]=175,["TAINTEFFECT"]=176,["POWERED_POWERS_ONLY"]=177,["VITAL_FOR_BASE_SURVIVAL"]=178,["DO_NOT_PICK_ME_WHEN_BUILDING"]=179,["SUMMONED"]=180,["HIDE_IF_FOGGED"]=181,["ALWAYS_SHOW_HOUSE_COLOR"]=182,
	["MOVE_FOR_NOONE"]=183,["WB_DISPLAY_SCRIPT_NAME"]=184,["CAN_CLIMB_WALLS"]=185,["NO_SHADOW"]=186,["LARGE_RECTANGLE_PATHFIND"]=187,["SUBMARINE"]=188,["PORT"]=189,["WALL_SEGMENT"]=190,["SIMPLE_OBJECT_PROP"]=191,["SHIP"]=192,["OPTIMIZED_SOUND"]=193,["PASS_EXPERIENCE_TO_CONTAINED"]=194,["DOZER_FACTORY"]=195,["THREAT_FINDER"]=196,["ECONOMY_STRUCTURE"]=197,["LIVING_WORLD_BUILDING_MIRROR"]=198,["CAN_TOPPLE"]=199,["NONCOM"]=200,["CAN_SKIP_SHADOW"]=201,["SCALEABLE_WALL"]=202,["SKYBOX"]=203,["WALL_GATE"]=204,
	["CAPTUREFLAG"]=205,["NEUTRALGOLLUM"]=206,["PASS_EXPERIENCE_TO_CONTAINER"]=207,["RESIST_EMP"]=208,["ORIENTS_TO_CAMERA"]=209,["NEVER_CULL_FOR_MP"]=210,["DONT_USE_CANCEL_BUILD_BUTTON"]=211,["CIVILIAN_BUILDING"]=212,["HEAVY_MELEE_HITTER"]=213,["DONT_HIDE_IF_FOGGED"]=214,["VEHICLE"]=215,["HARVESTABLE"]=216,["GRABBABLE"]=217,["CONSTRUCTION_YARD"]=218,["CAN_SHOOT_OVER_WALLS"]=219,["PASS_EXPERIENCE_TO_PRODUCER"]=220,["EXPANSION_PAD"]=221,["AMPHIBIOUS"]=222,["SHOW_BEHIND_OCCLUDERS"]=223,["FS_MONEY_STORAGE"]=224,
	["VALID_TARGET_FOR_C4"]=225,["UNIQUE_UNIT"]=226,["SURPRISE_ATTACKER"]=227,["COVER"]=228,["INFILTRATOR"]=229,["BRIDGE_SEGMENT"]=230,["FS_WAR_FACTORY"]=231,["FS_BARRACKS"]=232,["FS_RADAR"]=233,["FS_AIR_FIELD"]=234,["FS_TECH_CENTER"]=235,["TIBERIUM_BASED"]=236,["TIBERIUM"]=237,["CAN_ATTACK_STEALTHED"]=238,["IMMUNE_TO_CYCLONIC_SHOCKWAVE"]=239,["CANNOT_BE_DETECTED"]=240,["AUTO_ACQUIRABLE_BY_AI"]=241,["CRUSHABLE_OBSTACLE"]=242,["NEUTRAL_TECH"]=243,["SUPER_WEAPON"]=244,["HEALED_BY_TIBERIUM"]=245,
	["IGNORE_CAN_NOT_BUILD"]=246,["SKIRMISH_AI_DONT_GARRISON"]=247,["ASSAULT_AIRCRAFT"]=248,["BOMBER_AIRCRAFT"]=249,["ANTI_GARRISON"]=250,["ENGINEER"]=251,["EXPANSION_UNIT"]=252,["OUTPOST"]=253,["BEACON"]=254,["HUSK"]=255,["IGNORE_FORCE_MOVE"]=256,["LINE_OF_SIGHT_IGNORES_BUILDINGS"]=257,["MOTHERSHIP"]=258,["SNIPER"]=259,["ATTACK_FROM_STRUCTURE_ONLY_WHEN_GARRISONED"]=260,["SKIP_DEFECT_IF_UNCOMBINED"]=261,["SKIP_IDLE_WHEN_CAPTURED"]=262,["BRIDGE_ENDCAP"]=263,["BRIDGE_GATEHOUSE"]=264,["CAN_BE_FAVORITE_UNIT"]=265,
	["SLAVE_OWNER"]=266,["MCV"]=267,["CAN_HEAL_ALLIES"]=268,["METAUNIT"]=269,["META_BASE"]=270,["META_CITY"]=271,["META_STRIKEFORCE"]=272,["META_TIBERIUM_NODE"]=273,["META_ICMUMO"]=274,["META_ALIEN_TOWER"]=275,["PROJECT_BUILDABILITY_FOR_ALLIES"]=276,["AA_STRUCT"]=277,["NOD_SUPER_STRUCTURE"]=278,["RELOAD_AIRCRAFT"]=279,["USE_STRICT_PATHING"]=280,["CAN_FIRE_EVEN_IF_CONTAINED_ARE_NOT_IN_RANGE"]=281,["AI_BUZZERS_CANT_ATTACH_TO_ME"]=282
}

KindOfIndexTable={   --use index-1 for actions not the string
	"OBSTACLE","SELECTABLE","TARGETABLE","ALLY_TARGETABLE","IMMOBILE","CAN_ATTACK","STICK_TO_TERRAIN_SLOPE","CAN_CAST_REFLECTIONS","SHRUBBERY","STRUCTURE","INFANTRY","CAVALRY","MONSTER","MACHINE","AIRCRAFT","HUGE_VEHICLE","DOZER","SWARM_DOZER","HARVESTER","COMMANDCENTER","CASTLE_CENTER","SALVAGER","WEAPON_SALVAGER","TRANSPORT","BRIDGE","CANT_TOGGLE_POWER","SIEGE_WEAPON","PROJECTILE","PRELOAD","NO_GARRISON","CASTLE_KEEP",
	"SHADOW_ULTRA_HIGH_ONLY","NO_COLLIDE","REPAIR_PAD","HEAL_PAD","STEALTH_GARRISON","SUPPLY_GATHERING_CENTER","AIRFIELD","DRAWABLE_ONLY","MP_COUNT_FOR_VICTORY","REBUILD_HOLE","SCORE","SCORE_CREATE","SCORE_DESTROY","NO_HEAL_ICON","CAN_RAPPEL","PARACHUTABLE","CAN_BE_REPULSED","MOB_NEXUS","IGNORED_IN_GUI","CRATE","CAPTURABLE","LINKED_TO_FLAG","CLEARED_BY_BUILD","SMALL_MISSILE","ALWAYS_VISIBLE","UNATTACKABLE","MINE","CAN_PLACE_CHARGE",
	"PORTABLE_STRUCTURE","ALWAYS_SELECTABLE","ATTACK_NEEDS_LINE_OF_SIGHT","WALK_ON_TOP_OF_WALL","DEFENSIVE_WALL","FS_POWER","FS_FACTORY","FS_BASE_DEFENSE","FS_TECHNOLOGY","AIRCRAFT_PATH_AROUND","LOW_OVERLAPPABLE","FORCEATTACKABLE","AUTO_RALLYPOINT","CAN_CAPTURE","POWERED","PRODUCED_AT_HELIPAD","DRONE","CAN_SEE_THROUGH_STRUCTURE","BALLISTIC_MISSILE","CLICK_THROUGH","SUPPLY_SOURCE_ON_PREVIEW","PARACHUTE","GARRISONABLE_UNTIL_DESTROYED",
	"BOAT","IMMUNE_TO_CAPTURE","HULK","CAN_PLACE_MANIPULATOR","SPAWNS_ARE_THE_WEAPONS","CANNOT_BUILD_NEAR_SUPPLIES","SUPPLY_SOURCE","REVEAL_TO_ALL","DISGUISER","INERT","HERO","IGNORES_SELECT_ALL","DONT_AUTO_CRUSH_INFANTRY","SIEGE_TOWER","TREE","SHRUB","CLUB","ROCK","THROWN_OBJECT","GRAB_AND_KILL","OPTIMIZED_PROP","ENVIRONMENT","DEFLECT_BY_SPECIAL_POWER","WORKING_PASSENGER","BASE_FOUNDATION","NEED_BASE_FOUNDATION","REACT_WHEN_SELECTED",
	"CAN_BE_CAPTURED","IGNORED_IN_FINDPOSITIONAROUND","HORDE","COMBO_HORDE","NONOCCLUDING","NO_FREEWILL_ENTER","TIBERIUM_FIELD","BEAM_TARGET","BEAM_TARGET_REFLECTOR","TACTICAL_MARKER","PATH_THROUGH_EACH_OTHER","NOTIFY_OF_PREATTACK","GARRISON","MELEE_HORDE","BASE_SITE","INERT_SHROUD_REVEALER","OCL_BIT","SPELL_BOOK","DEPRECATED","PATH_THROUGH_INFANTRY","NO_FORMATION_MOVEMENT","NO_BASE_CAPTURE","ARMY_SUMMARY","CIVILIAN_UNIT","NOT_AUTOACQUIRABLE",
	"KEEP_CLASSIFIED_WHEN_DEAD","CHUNK_VENDOR","ARCHER","MOVE_ONLY","FS_CASH_PRODUCER","ROCK_VENDOR","BLOCKING_GATE","CRANE","SIEGE_LADDER","MINE_TRIGGER","BUFF","GRAB_AND_DROP","PORTER","SCARY","CRITTER_EMITTER","BROADCASTS_INVISIBILITY","CAN_ATTACK_WALLS","IGNORE_FOR_VICTORY","DO_NOT_CLASSIFY","WALL_UPGRADE","ARMY_OF_DEAD","TAINT","BASE_DEFENSE_FOUNDATION","NOT_SELLABLE","WEBBED","WALL_HUB","BUILD_FOR_FREE","IGNORE_FOR_EVA_SPEECH_POSITION",
	"MADE_OF_WOOD","MADE_OF_METAL","MADE_OF_STONE","MADE_OF_DIRT","FACE_AWAY_FROM_CASTLE_KEEP","BANNER","META_HORDE","CAN_REVERSE_MOVE","PASS_EXPERIENCE_TO_SLAVER","HAS_HEALTH_BAR","BIG_MONSTER","DEPLOYED_MINE","CANNOT_RETALIATE","CREEP","TAINTEFFECT","POWERED_POWERS_ONLY","VITAL_FOR_BASE_SURVIVAL","DO_NOT_PICK_ME_WHEN_BUILDING","SUMMONED","HIDE_IF_FOGGED","ALWAYS_SHOW_HOUSE_COLOR","MOVE_FOR_NOONE","WB_DISPLAY_SCRIPT_NAME","CAN_CLIMB_WALLS",
	"NO_SHADOW","LARGE_RECTANGLE_PATHFIND","SUBMARINE","PORT","WALL_SEGMENT","SIMPLE_OBJECT_PROP","SHIP","OPTIMIZED_SOUND","PASS_EXPERIENCE_TO_CONTAINED","DOZER_FACTORY","THREAT_FINDER","ECONOMY_STRUCTURE","LIVING_WORLD_BUILDING_MIRROR","CAN_TOPPLE","NONCOM","CAN_SKIP_SHADOW","SCALEABLE_WALL","SKYBOX","WALL_GATE","CAPTUREFLAG","NEUTRALGOLLUM","PASS_EXPERIENCE_TO_CONTAINER","RESIST_EMP","ORIENTS_TO_CAMERA","NEVER_CULL_FOR_MP",
	"DONT_USE_CANCEL_BUILD_BUTTON","CIVILIAN_BUILDING","HEAVY_MELEE_HITTER","DONT_HIDE_IF_FOGGED","VEHICLE","HARVESTABLE","GRABBABLE","CONSTRUCTION_YARD","CAN_SHOOT_OVER_WALLS","PASS_EXPERIENCE_TO_PRODUCER","EXPANSION_PAD","AMPHIBIOUS","SHOW_BEHIND_OCCLUDERS","FS_MONEY_STORAGE","VALID_TARGET_FOR_C4","UNIQUE_UNIT","SURPRISE_ATTACKER","COVER","INFILTRATOR","BRIDGE_SEGMENT","FS_WAR_FACTORY","FS_BARRACKS","FS_RADAR","FS_AIR_FIELD","FS_TECH_CENTER",
	"TIBERIUM_BASED","TIBERIUM","CAN_ATTACK_STEALTHED","IMMUNE_TO_CYCLONIC_SHOCKWAVE","CANNOT_BE_DETECTED","AUTO_ACQUIRABLE_BY_AI","CRUSHABLE_OBSTACLE","NEUTRAL_TECH","SUPER_WEAPON","HEALED_BY_TIBERIUM","IGNORE_CAN_NOT_BUILD","SKIRMISH_AI_DONT_GARRISON","ASSAULT_AIRCRAFT","BOMBER_AIRCRAFT","ANTI_GARRISON","ENGINEER","EXPANSION_UNIT","OUTPOST","BEACON","HUSK","IGNORE_FORCE_MOVE","LINE_OF_SIGHT_IGNORES_BUILDINGS","MOTHERSHIP","SNIPER",
	"ATTACK_FROM_STRUCTURE_ONLY_WHEN_GARRISONED","SKIP_DEFECT_IF_UNCOMBINED","SKIP_IDLE_WHEN_CAPTURED","BRIDGE_ENDCAP","BRIDGE_GATEHOUSE","CAN_BE_FAVORITE_UNIT","SLAVE_OWNER","MCV","CAN_HEAL_ALLIES","METAUNIT","META_BASE","META_CITY","META_STRIKEFORCE","META_TIBERIUM_NODE","META_ICMUMO","META_ALIEN_TOWER","PROJECT_BUILDABILITY_FOR_ALLIES","AA_STRUCT","NOD_SUPER_STRUCTURE","RELOAD_AIRCRAFT","USE_STRICT_PATHING","CAN_FIRE_EVEN_IF_CONTAINED_ARE_NOT_IN_RANGE","AI_BUZZERS_CANT_ATTACH_TO_ME"
} 

function GetIndexOfTableElement(table,element,if_last_give_zero)
	for i=1,getn(table),1 do
		if table[i]==element then
			if if_last_give_zero ~= nil and i==getn(table) then return 0
			else return i end
		end
	end
	return error_("Error in GetIndexOfTableElement function: no element in table found")
end

function CountTeamsKindOf(team, kindof)  --by bisection method
	local KindOf_
	if type(kindof) == "number" then KindOf_=kindof --KindOfIndexTable[kindof+1]
		elseif type(kindof) == "string" then KindOf_=KindOfTable[kindof]
		if KindOf_==nil then KindOf_=KindOfIndexTable[GetIndexOfTableElement(KindOfIndexTable,kindof)-1] end
	end
	local sc=0  --security counter to avoid infinite loops
	local lower, upper, middle
	upper=1
	while not EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, upper, KindOf_) do
		upper=upper*10
		sc=sc+1 if sc >=100000 then return 0 end
	end
	while EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, floor(upper/2), KindOf_) do
		upper=floor(upper/2)
		sc=sc+1 if sc >=100000 then return 0 end
	end
    lower=floor(upper/2)
	while (upper-lower)>1 do 
		middle=(upper+lower)/2
		if EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, ceil(middle), KindOf_) then upper=ceil(middle)
		else lower=floor(middle) end
		sc=sc+1 if sc >=100000 then return 0 end
	end   
	middle=ceil((upper+lower)/2)
	if EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, middle, KindOf_) then return lower
	else return upper end
end

function RemoveAllTiberium()
	local NeutralTeam = "/team"
	local CivilianTeam = "PlyrCivilian/teamPlyrCivilian"
	local TibCount = CountTeamsKindOf(NeutralTeam,"TIBERIUM")
	local TibFieldCount = CountTeamsKindOf(NeutralTeam,"TIBERIUM_FIELD") 
	local TRef=""
	local TRefTable={}
	ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumFieldList", "TiberiumField")
    ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumFieldList", "TiberiumFieldBlue")
	ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumCrystalTypeList", "TiberiumCrystal")
    ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TiberiumCrystalTypeList", "TiberiumCrystalBlue")
	for i=1,TibFieldCount,1 do
		TRef = "object_" .. floor(99999999*GetRandomNumber())
		ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE","TiberiumFieldList",NeutralTeam,TRef)
		if EvaluateCondition("NAMED_NOT_DESTROYED",TRef) then 
			tinsert(TRefTable,TRef)
			ExecuteAction("UNIT_SET_TEAM",TRef,CivilianTeam)
			ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", TRef, "Enabled", 0) 
		end
	end
	for i=1,TibFieldCount,1 do ExecuteAction("UNIT_SET_TEAM",TRefTable[i],NeutralTeam) end	
	for i=1,TibCount,1 do 
		TRef = "object_" .. floor(99999999*GetRandomNumber())
		ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE","TiberiumCrystalTypeList",NeutralTeam,TRef)
		if EvaluateCondition("NAMED_NOT_DESTROYED",TRef) then 
			--tinsert(TRefTable,TRef)
			ExecuteAction("UNIT_SET_TEAM",TRef,CivilianTeam)
			ExecuteAction("NAMED_DELETE",TRef)
		end
	end
end

RemoveAllTiberium()

ExecuteAction("PLAYER_SET_MONEY", "<All Players>", 10000)

function GiveMoney()
	ExecuteAction("PLAYER_GIVE_MONEY", "<All Players>", 500)
	ExecuteAction("PLAY_SOUND_EFFECT", "Aeva_FundsTransfer")
end

SetScriptTimer(30,GiveMoney,-1)