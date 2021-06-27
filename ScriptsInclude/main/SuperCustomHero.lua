NAME	 	= "Super Custom Hero"
VERSION		= "1.0"
TYPE		= "INILUA"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Spawns the custom hero on start with max level"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------



#LUA


function SpawnSuperHero()
	local ref = spawn("CreateAHero")
    local self = GetObjectLuaRef(ref)
	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS", ref, 50000)
	ObjectGrantUpgrade(self, "Upgrade_Veterancy_VETERAN")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_ELITE")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_HEROIC")
	ExecuteAction("SET_HERO_EXPERIENCE_SHARING", 1)
    --ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",Asset)
	return ref
end

SpawnSuperHero()







#INI

SpecialPower SpecialAbilityHeroBlink
	ReloadTime								  =	0
End

SpecialPower SpecialPowerCreateAHeroSpawnTornado_Level3
	ReloadTime =	0
	ViewObjectRange = 1000
End

SpecialPower SpecialAbilityLightBlast_L3
	ReloadTime =	0
End

SpecialPower SpecialAbilityForcePush_Level3
	ReloadTime =	0
End

SpecialPower SpecialAbilityBallLightning_L3
	ReloadTime =	0
End

CommandButton Command_CreateAHero_LightBlast_L3
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_SpecialAbilityCurseEnemy_Level3
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_SpecialAbilityConvertEnemy_L2
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_SpecialAbilityForcePush_Level3
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_SpecialAbilityWordOfPower
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_SpecialAbilityTeleportLevel3
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_WordOfPoultry_Level2
	CreateAHeroUIMinimumLevel				  = 7
End

CommandButton Command_CreateAHero_SpawnTornado_Level1
	CreateAHeroUIAllowableUpgrades				=	Upgrade_CreateAHero_ClassArcher Upgrade_CreateAHero_ClassIstariWizard
End

CommandButton Command_CreateAHero_SpawnTornado_Level2
	CreateAHeroUIAllowableUpgrades				=	Upgrade_CreateAHero_ClassArcher Upgrade_CreateAHero_ClassIstariWizard
End

CommandButton Command_CreateAHero_SpawnTornado_Level3
	CreateAHeroUIAllowableUpgrades				=	Upgrade_CreateAHero_ClassArcher Upgrade_CreateAHero_ClassIstariWizard
	CreateAHeroUIMinimumLevel					=	7
End