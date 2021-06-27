NAME	 	= "BFME2 Custom Hero"
VERSION		= "1.0"
TYPE		= "DISABLED"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = ""
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

CreateAHeroParts = 
{ "SWORD","BOW","BOW_03","BOW_04","BOW_05","TRUNK01","STAFF_LIGHT","OBJECT01","SHIELD01","SHIELD_01","SPEAR",
"SHIELD_B","SHIELD_C","SHIELD_D","B_SHIELD","WEAPON_A","WEAPON_B","WEAPON_C","WEAPON_D","AXE02","AxeWeapon",
"Belthronding","Mithlondrecurve","Dwarf_Axe01","FireBrand","FireBrand_SM","FireBrand_FX01","FireBrand_FX02",
"Gurthang","Gurthang_SM","HeroOfTheWestShield","HeroOfTheWestShield_SM","MithlondBow","TrollBane","TrollBane_SM",
"TrollBane_FX01","TrollBane_FX02","TrollMace","TrollSword","WestronSword","WestronSword","WestronSword_SM",
"WizardStaff01","WizStaff01_FX01","WizStaff01_FX2","WizStaff01_FX3","WizStaff01_FX4","WizardStaff02",
"WizStaff02_FX1","WizardStaff03","WizStaff03_FX01","WizStaff03_FX02","WizardStaff04","WizStaff04_FX01",
"WizStaff04_FX02","WizStaff04_FX03","WizStaff04_FX04","WizStaff04_FX05","WizStaff04_FX06","WizStaff04_FX07",
"WizardSword","CMSword01","CMSword02","CHEST_00","CHEST_01","CHEST_02","BOOT_00","BOOT_01","BOOT_02","BOOT_03",
"BOOT_04","BOOT_05","BOOT_06","SHLD_00","SHLD_01","SHLD_02","SHLD_03","SHLD_04","SLDR_00","SLDR_01","SLDR_02",
"SLDR_03","SLDR_04","SLDR_05","SLDR_06","Shield_1OG","Shield_2OG","HAIR_00","HAIR_01","HLMT_00","HLMT_01",
"HLMT_02","HLMT_03","HLMT_04","HLMT_05","HLMT_06","HLMT_07","HLMT_07_LOD1","HLMT_08","HLMT_09","GNLT_00",
"GNLT_01","GNLT_02","GNLT_03","GNLT_04","GNLT_05","GNLT_06","GNLT_07","GNLT_08","GHLT_08","GNLT_09","GNLT_09_LOD1",
"GNLT_10","SPR_01","PAXE_01","PAXE_01_LOD1","SWRD_01","SWRD_02","SWRD_03","SWRD_04","SWRD_05","SWD_01","SWD_02",
"SWD_03","SWD_04","STFF_05","STFF_06","objSLDR_01","objSLDR_02","objSLDR_03","objHLMT_01","objHLMT_02","objHLMT_03",
"objHLMT_04","Uruk_Sword_01","Uruk_Sword_02","Uruk_Sword_03","TrollTree","TrollHammer","CLUB_01","CLUB_02","CLUB_03",
"HMR_01","HMR_02","HMR_03","HMR_04","AXE_01","AXE_02","AXE_03","BARREL","OBJECT02", "ARROW","PLANE02" }

OBJECT_TYPE_LIST_HERO = {
"AngmarHwaldar",
"AngmarKarsh",
"AngmarMorgramir",
"AngmarRogash",
"AngmarShadeWolf",
"ArnorArgeleb",
"ArnorArvedui",
"ArnorArveleg",
"ArnorCaptain",
"ArnorCaptainStealthless",
"CreateAHero",
"CreateAHeroTornado_Level1",
"CreateAHeroTornado_Level2",
"CreateAHeroTornado_Level3",
"Crebain",
"Drogoth",
"DwarvenCaptainofDale",
"DwarvenDain",
"DwarvenGloin",
"DwarvenGloin_Temp",
"ElrondWhirlwind",
"ElvenArwen",
"ElvenElrond",
"ElvenGaladriel",
"ElvenGlorfindel",
"ElvenHaldir",
"ElvenThranduil",
"EvilMenBlackRider",
"EyeOfSauron",
"GaladrielTornado",
"GondorAragorn",
"GondorBoromir",
"GondorDamrod",
"GondorEarnur",
"GondorFaramir",
"GondorGandalf",
"GondorGandalfWhite_H",
"GondorGandalfWhite_L",
"GondorGandalfWhite_M",
"GondorGwaihir",
"GondorIsildur",
"IsengardLurtz",
"IsengardMurderOfCrows",
"IsengardSaruman",
"IsengardSharku",
"IsengardWormTongue",
"Marker",
"MordorBalrog",
"MordorFellBeastInterface",
"MordorGothmog",
"MordorMouthOfSauron",
"MordorSauron",
"MordorShelob",
"MordorWitchKing",
"NeutralGollum",
"OrcChief01",
"OrcChief02",
"OrcChief03",
"OrcChief04",
"OrcChief05",
"RohanEomer",
"RohanEowyn",
"RohanFrodo",
"RohanGamling",
"RohanGimli",
"RohanHobbitHorde",
"RohanLegolas",
"RohanMerry",
"RohanPippin",
"RohanSam",
"RohanTheoden",
"RohanTreeBerd",
"SummonedDragon",
"TomBombadil",
"WildAzog",
"WildBatCloud",
"WildGoblinKing",
"WildShelob",
"Wyrm"
}

CustomHeroRefInit = false
CustomHeroRef = {}
function GetCustomHeroRef(self)
	if not CustomHeroRefInit then
		for k,v in globals() do
			if strfind(tostring(k), "ObjID") ~= nil then
				if strfind(ObjectDescription(v), "CreateAHero") and GetTeamName(v) == GetTeamName(self) then 
					CustomHeroRef = v
					CustomHeroRefInit = true
					return v 
				end
			end
		end	
		return "not found"
	else 
		return CustomHeroRef
	end
end

HeroCustomizationSave = {}

function RefreshHeroCustomizationSave(CreateAHeroPart, state)
	local EntryFound = false
	for i=1,getn(HeroCustomizationSave),1 do
		if HeroCustomizationSave[i][1] == CreateAHeroPart then 
			HeroCustomizationSave[i][2] = state 
			EntryFound = true
			return
		end
	end
	if not EntryFound then
		tinsert(HeroCustomizationSave, { CreateAHeroPart, state } )
	end
end

function ApplyHeroCustomizationSave()
	local HeroRef = GetCustomHeroRef(self)
	for i=1,getn(HeroCustomizationSave),1 do
		ObjectHideSubObjectPermanently(HeroRef, HeroCustomizationSave[i][1], HeroCustomizationSave[i][2]) 
	end
end

function SaveHeroCustomizationSave()
	local SaveData = ""
	for i=1,getn(HeroCustomizationSave),1 do
		if i==1 then SaveData = "HeroCustomizationSave = {" .. [[{"]] .. HeroCustomizationSave[i][1] .. [[{", ]] .. HeroCustomizationSave[i][2] .. "}"
		elseif i==getn(HeroCustomizationSave) then SaveData = SaveData .. [[{"]] .. HeroCustomizationSave[i][1] .. [[{", ]] .. HeroCustomizationSave[i][2] .. "}}"
		else SaveData = SaveData .. [[, {"]] .. HeroCustomizationSave[i][1] .. [[{", ]] .. HeroCustomizationSave[i][2] .. "}, "
		end	
	end
	WriteToFile(SaveData, GetFilePath() .. "HeroCustomizationSave.lua", "w")
end

function SpawnSuperAngmarShadeWolf()
	local master = spawn("AngmarShadeWolf", GetTeamName(object1))
	UnitColorTable = { ["blue"]=255,["red"]=1,["purple"]=50,["yellow"]=-256,["white"]=-1 }
	ExecuteAction("NAMED_CUSTOM_COLOR", master, UnitColorTable.red)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", master, "Indestructible", 1) 
	ExecuteAction("NAMED_SET_ATTITUDE",master,Behaviour["Agressive"])
	ExecuteAction("UNIT_SET_FLAME_STATUS", master, 1)
	--ExecuteAction("UNIT_STAND_GROUND", master, 1)
    --ExecuteAction("NAMED_SET_HELD", self, 1)
	-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", master, "Enabled", 0) 
	-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", master, "Powered", 0) 
end

function SpawnInvincibleCustomHero()
	local master = spawn("CreateAHero", GetTeamName(object1))
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", master, "Indestructible", 1) 
	ExecuteAction("NAMED_SET_ATTITUDE",master,Behaviour["Agressive"])
	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS", master, 50000)
	ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN",  master, "SpecialAbilityHeroBlink", 0)
end
	
function SpawnMyHero(self)
	ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "CreateAHero", GetTeamName(self), GetPlayerStartWaypointByTeam(GetTeamName(self)))
end
