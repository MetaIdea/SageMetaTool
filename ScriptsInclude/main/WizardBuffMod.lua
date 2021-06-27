NAME	 	= "Wizard Buff"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "All Wizard LV10 abilities become LV7 + Teleport 0 recharge time + Tornado for Wizard"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

SpecialPower SpecialAbilityHeroBlink
	ReloadTime								  =	0
End

;TEMP;;;;;;;;;;


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

;;;;;;;;;

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

; CreateAHeroSystem
	; CreateAHeroClass
		; NameTag		   = CreateAHero:ClassName_IstariWizard
		; DescriptionTag = CreateAHero:ClassDesc_IstariWizard
		; PowersDescTag  = CreateAHero:ClassPowersDesc_IstariWizard
		; UpgradeName	   = Upgrade_CreateAHero_ClassIstariWizard
		; IconImage	   = Archetype_Wizard
																							
		; SubClass
			; NameTag		   = CreateAHero:SubClassName_Wanderer
			; DescriptionTag = CreateAHero:SubClassDesc_IstariWizard
			; IconImage	   = CPWanderer
			; ButtonImage	   = HICAHWanderer
			; UsableFactions              = Men Elves Dwarves Isengard Mordor Wild Angmar
			; SpendableAttributePoints        = 100
			; UpgradeName	   = Upgrade_CreateAHero_SubClass_0
			; Awards = LegendOfMiddleEarth BattleChampion BattleGrandChampion BattleHero BattleMaster BattleVeteran Demonslayer Dragonslayer Dwarfslayer
			; Awards = Goblinbane PirateKing Orcslayer Monsterslayer SiegeMaster ManKiller Icebane Urukbane Vanquisher WarHero WarMaster WarVeteran Elfbane Executioner Foehammer
			; Awards = AssassinEvil AssassinGood
			; Stats  = BALROGS_KILLED CREEPS_KILLED DRAKES_KILLED DROGOTHS_KILLED DWARF_INFANTRY_KILLED ELF_INFANTRY_KILLED ENEMIES_KILLED EVERY_WOTR_MAP_WON 
			; Stats  = FELL_BEASTS_KILLED GIANTS_KILLED GOBLIN_INFANTRY_KILLED HEROS_KILLED HERO_VICTORY_COUNT_STRATIGIC ISENGARD_INFANTRY_KILLED HERO_DEFEAT_COUNT_STRATIGIC 
			; Stats  = KILLED_ARAGORN_COUNT KILLED_ARWEN_COUNT KILLED_BARROW_WIGHTS_COUNT KILLED_BOROMIR_COUNT KILLED_DAIN_COUNT DROGOTHS_KILLED
			; Stats  = KILLED_ELROND_COUNT KILLED_EOMER_COUNT KILLED_EOWYN_COUNT KILLED_FARAMIR_COUNT KILLED_FRODO_COUNT KILLED_GANDALF_COUNT
			; Stats  = KILLED_GIMLI_COUNT KILLED_GLOIN_COUNT KILLED_GLORFINDEL_COUNT KILLED_GORKIL_THE_GOBLIN_KING_COUNT KILLED_HALDIR_COUNT KILLED_LEGOLAS_COUNT
			; Stats  = KILLED_LURTZ_COUNT KILLED_MERRY_COUNT KILLED_MOUTH_OF_SAURON_COUNT KILLED_NAZGUL_COUNT KILLED_PIPPIN_COUNT KILLED_SAM_COUNT KILLED_SARUMAN_COUNT
			; Stats  = KILLED_SHARKU_COUNT KILLED_SHELOB_COUNT KILLED_THEODEN_COUNT KILLED_THRANDUIL_COUNT KILLED_TREEBEARD_COUNT KILLED_WITCH_KING_COUNT KILLED_WORMTONGUE_COUNT
			; Stats  = MEN_OF_THE_WEST_INFANTRY_KILLED MORDOR_INFANTRY_KILLED MP_CREATE_A_HEROES_KILLED MP_KEEPS_DESTROYED MUMAKILS_KILLED SHIPS_KILLED HERO_VICTORY_COUNT_OPENPLAY_MP
			; Stats  = SPIDERLINGS_KILLED SUMMONED_DRAGONS_KILLED TROLLS_KILLED WARGS_KILLED WYRMS_KILLED HERO_DEFEAT_COUNT_STRATIGIC_MP HERO_VICTORY_COUNT_STRATIGIC_MP
			; Stats  = HERO_DEFEAT_COUNT_SKIRMISH HERO_VICTORY_COUNT_SKIRMISH HERO_DEFEAT_COUNT_OPENPLAY_MP 
			; Stats  = KILLED_MORGOMIR_COUNT KILLED_ROGASH_COUNT KILLED_KARSH_COUNT KILLED_GOTHMOG_COUNT KILLED_HWALDAR_COUNT KILLED_AZOG_COUNT KILLED_CAPTDALE_COUNT ANGMAR_INFANTRY_KILLED
			; Awards = GuardianOfMiddleEarth
			; BlingUpgrades		  =	@Upgrade_CHW07 Upgrade_CHW09	Upgrade_CHW10 Upgrade_CHW11 Upgrade_CHW40 Upgrade_CHW41
			; BlingUpgrades = Upgrade_NoHelmet Upgrade_WIZ_CHH01 Upgrade_WIZ_CHH02 @Upgrade_WIZ_CHH03 Upgrade_WIZ_CHH04 Upgrade_WIZ_CHH05 Upgrade_WIZ_CHH06 Upgrade_WIZ_CHH07 Upgrade_CorruptedMan_1_CHH08
			; BlingUpgrades = Upgrade_NoShoulderPlates Upgrade_WIZ_CHSP01 Upgrade_WIZ_CHSP02
			; BlingUpgrades = Upgrade_NoGauntlets 
			; BlingUpgrades = Upgrade_NoShield
			; BlingUpgrades = Upgrade_NoBoots
			; BlingUpgrades = @Upgrade_WIZ_CHBOD01 Upgrade_WIZ_CHBOD02 Upgrade_WIZ_CHBOD03
			; DefaultPrimaryColor	  =	R:160 G:160	B:160
			; DefaultSecondaryColor =	R:160 G:160	B:160
			; DefaultTertiaryColor  =	R:160 G:160	B:160
			; Attribute
				; GroupName			= CreateAHero_ArmorAttribute
				; MinValueUpgrade		= Upgrade_ArmorAttribute02
				; MaxValueUpgrade		= Upgrade_ArmorAttribute20
				; DefaultValueUpgrade	= Upgrade_ArmorAttribute05
			; End	
			; Attribute
				; GroupName			= CreateAHero_DamageMultAttribute
				; MinValueUpgrade		= Upgrade_DamageMultAttribute02
				; MaxValueUpgrade		= Upgrade_DamageMultAttribute20
				; DefaultValueUpgrade	= Upgrade_DamageMultAttribute05
			; End
			; Attribute
				; GroupName			= CreateAHero_HealthMultAttribute
				; MinValueUpgrade		= Upgrade_HealthMultAttribute05
				; MaxValueUpgrade		= Upgrade_HealthMultAttribute20
				; DefaultValueUpgrade	= Upgrade_HealthMultAttribute12
			; End
			; Attribute
				; GroupName			= CreateAHero_AutoHealAttribute
				; MinValueUpgrade		= Upgrade_AutoHealAttribute02
				; MaxValueUpgrade		= Upgrade_AutoHealAttribute20
				; DefaultValueUpgrade	= Upgrade_AutoHealAttribute06
			; End
			; Attribute
				; GroupName			= CreateAHero_VisionAttribute
				; MinValueUpgrade		= Upgrade_VisionAttribute04
				; MaxValueUpgrade		= Upgrade_VisionAttribute20
				; DefaultValueUpgrade	= Upgrade_VisionAttribute12
			; End
			; ViewInfo
				; FarPitch  = -0.066
				; FarZoom   = 0.210
				; FarFloor  = 15.760
				; FarDist   = 20.500
				; FarShift  = 5.900
				; NearPitch = 0.364
				; NearZoom  = 0.254
				; NearFloor = 74.260
				; NearDist  = 36.000
				; NearShift = 7.000
				; CloseUpPitch = -0.260
				; CloseUpZoom  = 0.200
				; CloseUpFloor = 50.000
				; CloseUpDist  = 35.000
				; CloseUpShift = 0.400
				; PortraitPitch = -0.080
				; PortraitZoom  = 0.200
				; PortraitFloor = 50.000
				; PortraitDist  = 57.00
				; PortraitShift = 1.10
				; MapLocation	= 6
			; End
		; End
		; SubClass
			; NameTag		   = CreateAHero:SubClassName_Avatar
			; DescriptionTag = CreateAHero:SubClassDesc_Avatar
			; UpgradeName	   = Upgrade_CreateAHero_SubClass_1
			; IconImage	   = CPAvatar
			; ButtonImage	   = HICAHAvatar
			; DefaultFaction              = Angmar 
			; UsableFactions              = Men Elves Dwarves Isengard Mordor Wild Angmar
			; SpendableAttributePoints        = 100
			; Awards = LegendOfMiddleEarth BattleChampion BattleGrandChampion BattleHero BattleMaster BattleVeteran Demonslayer Dragonslayer Dwarfslayer
			; Awards = Goblinbane PirateKing Orcslayer Monsterslayer SiegeMaster ManKiller Icebane Urukbane Vanquisher WarHero WarMaster WarVeteran Elfbane Executioner Foehammer
			; Awards = AssassinEvil AssassinGood
			; Stats  = BALROGS_KILLED CREEPS_KILLED DRAKES_KILLED DROGOTHS_KILLED DWARF_INFANTRY_KILLED ELF_INFANTRY_KILLED ENEMIES_KILLED EVERY_WOTR_MAP_WON 
			; Stats  = FELL_BEASTS_KILLED GIANTS_KILLED GOBLIN_INFANTRY_KILLED HEROS_KILLED HERO_VICTORY_COUNT_STRATIGIC ISENGARD_INFANTRY_KILLED HERO_DEFEAT_COUNT_STRATIGIC 
			; Stats  = KILLED_ARAGORN_COUNT KILLED_ARWEN_COUNT KILLED_BARROW_WIGHTS_COUNT KILLED_BOROMIR_COUNT KILLED_DAIN_COUNT DROGOTHS_KILLED
			; Stats  = KILLED_ELROND_COUNT KILLED_EOMER_COUNT KILLED_EOWYN_COUNT KILLED_FARAMIR_COUNT KILLED_FRODO_COUNT KILLED_GANDALF_COUNT
			; Stats  = KILLED_GIMLI_COUNT KILLED_GLOIN_COUNT KILLED_GLORFINDEL_COUNT KILLED_GORKIL_THE_GOBLIN_KING_COUNT KILLED_HALDIR_COUNT KILLED_LEGOLAS_COUNT
			; Stats  = KILLED_LURTZ_COUNT KILLED_MERRY_COUNT KILLED_MOUTH_OF_SAURON_COUNT KILLED_NAZGUL_COUNT KILLED_PIPPIN_COUNT KILLED_SAM_COUNT KILLED_SARUMAN_COUNT
			; Stats  = KILLED_SHARKU_COUNT KILLED_SHELOB_COUNT KILLED_THEODEN_COUNT KILLED_THRANDUIL_COUNT KILLED_TREEBEARD_COUNT KILLED_WITCH_KING_COUNT KILLED_WORMTONGUE_COUNT
			; Stats  = MEN_OF_THE_WEST_INFANTRY_KILLED MORDOR_INFANTRY_KILLED MP_CREATE_A_HEROES_KILLED MP_KEEPS_DESTROYED MUMAKILS_KILLED SHIPS_KILLED HERO_VICTORY_COUNT_OPENPLAY_MP
			; Stats  = SPIDERLINGS_KILLED SUMMONED_DRAGONS_KILLED TROLLS_KILLED WARGS_KILLED WYRMS_KILLED HERO_DEFEAT_COUNT_STRATIGIC_MP HERO_VICTORY_COUNT_STRATIGIC_MP
			; Stats  = HERO_DEFEAT_COUNT_SKIRMISH HERO_VICTORY_COUNT_SKIRMISH HERO_DEFEAT_COUNT_OPENPLAY_MP 
			; Stats  = KILLED_MORGOMIR_COUNT KILLED_ROGASH_COUNT KILLED_KARSH_COUNT KILLED_GOTHMOG_COUNT KILLED_HWALDAR_COUNT KILLED_AZOG_COUNT KILLED_CAPTDALE_COUNT ANGMAR_INFANTRY_KILLED
			; Awards = GuardianOfMiddleEarth
			; Awards = GuardianOfMiddleEarth
			; BlingUpgrades		  =	Upgrade_CHW07 Upgrade_CHW09	@Upgrade_CHW10 Upgrade_CHW11 Upgrade_CHW40 Upgrade_CHW41
			; BlingUpgrades = @Upgrade_NoHelmet Upgrade_WIZ_CHH01 Upgrade_WIZ_CHH02 Upgrade_WIZ_CHH03 Upgrade_WIZ_CHH04 Upgrade_WIZ_CHH05 Upgrade_WIZ_CHH06 Upgrade_WIZ_CHH07 Upgrade_CorruptedMan_1_CHH08
			; BlingUpgrades = Upgrade_NoShoulderPlates Upgrade_WIZ_CHSP01 Upgrade_WIZ_CHSP02
			; BlingUpgrades = Upgrade_NoGauntlets
			; BlingUpgrades = Upgrade_NoShield
			; BlingUpgrades = Upgrade_NoBoots
			; BlingUpgrades = Upgrade_WIZ_CHBOD01 Upgrade_WIZ_CHBOD02 @Upgrade_WIZ_CHBOD03
			; DefaultPrimaryColor	  =	R:160 G:160	B:160
			; DefaultSecondaryColor =	R:160 G:160	B:160
			; DefaultTertiaryColor  =	R:160 G:160	B:160
			; Attribute
				; GroupName			= CreateAHero_ArmorAttribute
				; MinValueUpgrade		= Upgrade_ArmorAttribute04
				; MaxValueUpgrade		= Upgrade_ArmorAttribute20
				; DefaultValueUpgrade	= Upgrade_ArmorAttribute10
			; End	
			; Attribute
				; GroupName			= CreateAHero_DamageMultAttribute
				; MinValueUpgrade		= Upgrade_DamageMultAttribute03
				; MaxValueUpgrade		= Upgrade_DamageMultAttribute20
				; DefaultValueUpgrade	= Upgrade_DamageMultAttribute10
			; End
			; Attribute
				; GroupName			= CreateAHero_HealthMultAttribute
				; MinValueUpgrade		= Upgrade_HealthMultAttribute02
				; MaxValueUpgrade		= Upgrade_HealthMultAttribute20
				; DefaultValueUpgrade	= Upgrade_HealthMultAttribute10
			; End
			; Attribute
				; GroupName			= CreateAHero_AutoHealAttribute
				; MinValueUpgrade		= Upgrade_AutoHealAttribute02
				; MaxValueUpgrade		= Upgrade_AutoHealAttribute20
				; DefaultValueUpgrade	= Upgrade_AutoHealAttribute02
			; End
			; Attribute
				; GroupName			= CreateAHero_VisionAttribute
				; MinValueUpgrade		= Upgrade_VisionAttribute04
				; MaxValueUpgrade		= Upgrade_VisionAttribute20
				; DefaultValueUpgrade	= Upgrade_VisionAttribute08
			; End
			; ViewInfo
				; FarPitch  = -0.066
				; FarZoom   = 0.210
				; FarFloor  = 15.760
				; FarDist   = 20.500
				; FarShift  = 5.900
				; NearPitch = 0.394
				; NearZoom  = 0.254
				; NearFloor = 74.260
				; NearDist  = 35.000
				; NearShift = 6.100
				; CloseUpPitch = -0.280
				; CloseUpZoom  = 0.200
				; CloseUpFloor = 50.000
				; CloseUpDist  = 30.000
				; CloseUpShift = 0.500
				; PortraitPitch = -0.080
				; PortraitZoom  = 0.200
				; PortraitFloor = 50.000
				; PortraitDist  = 53.00
				; PortraitShift = 0.50
				; MapLocation	= 6
			; End
		; End
		; SubClass
			; NameTag		   = CreateAHero:SubClassName_Hermit
			; DescriptionTag = CreateAHero:ClassPowersDesc_Hermit
			; UpgradeName	   = Upgrade_CreateAHero_SubClass_2
			; IconImage	   = CPHermit
			; ButtonImage	   = HICAHHermit
			; UsableFactions              = Men Elves Dwarves Isengard Mordor Wild Angmar
			; SpendableAttributePoints        = 100
			; Awards = LegendOfMiddleEarth BattleChampion BattleGrandChampion BattleHero BattleMaster BattleVeteran Demonslayer Dragonslayer Dwarfslayer
			; Awards = Goblinbane PirateKing Orcslayer Monsterslayer SiegeMaster ManKiller Icebane Urukbane Vanquisher WarHero WarMaster WarVeteran Elfbane Executioner Foehammer
			; Awards = AssassinEvil AssassinGood
			; Stats  = BALROGS_KILLED CREEPS_KILLED DRAKES_KILLED DROGOTHS_KILLED DWARF_INFANTRY_KILLED ELF_INFANTRY_KILLED ENEMIES_KILLED EVERY_WOTR_MAP_WON 
			; Stats  = FELL_BEASTS_KILLED GIANTS_KILLED GOBLIN_INFANTRY_KILLED HEROS_KILLED HERO_VICTORY_COUNT_STRATIGIC ISENGARD_INFANTRY_KILLED HERO_DEFEAT_COUNT_STRATIGIC 
			; Stats  = KILLED_ARAGORN_COUNT KILLED_ARWEN_COUNT KILLED_BARROW_WIGHTS_COUNT KILLED_BOROMIR_COUNT KILLED_DAIN_COUNT DROGOTHS_KILLED
			; Stats  = KILLED_ELROND_COUNT KILLED_EOMER_COUNT KILLED_EOWYN_COUNT KILLED_FARAMIR_COUNT KILLED_FRODO_COUNT KILLED_GANDALF_COUNT
			; Stats  = KILLED_GIMLI_COUNT KILLED_GLOIN_COUNT KILLED_GLORFINDEL_COUNT KILLED_GORKIL_THE_GOBLIN_KING_COUNT KILLED_HALDIR_COUNT KILLED_LEGOLAS_COUNT
			; Stats  = KILLED_LURTZ_COUNT KILLED_MERRY_COUNT KILLED_MOUTH_OF_SAURON_COUNT KILLED_NAZGUL_COUNT KILLED_PIPPIN_COUNT KILLED_SAM_COUNT KILLED_SARUMAN_COUNT
			; Stats  = KILLED_SHARKU_COUNT KILLED_SHELOB_COUNT KILLED_THEODEN_COUNT KILLED_THRANDUIL_COUNT KILLED_TREEBEARD_COUNT KILLED_WITCH_KING_COUNT KILLED_WORMTONGUE_COUNT
			; Stats  = MEN_OF_THE_WEST_INFANTRY_KILLED MORDOR_INFANTRY_KILLED MP_CREATE_A_HEROES_KILLED MP_KEEPS_DESTROYED MUMAKILS_KILLED SHIPS_KILLED HERO_VICTORY_COUNT_OPENPLAY_MP
			; Stats  = SPIDERLINGS_KILLED SUMMONED_DRAGONS_KILLED TROLLS_KILLED WARGS_KILLED WYRMS_KILLED HERO_DEFEAT_COUNT_STRATIGIC_MP HERO_VICTORY_COUNT_STRATIGIC_MP
			; Stats  = HERO_DEFEAT_COUNT_SKIRMISH HERO_VICTORY_COUNT_SKIRMISH HERO_DEFEAT_COUNT_OPENPLAY_MP 
			; Stats  = KILLED_MORGOMIR_COUNT KILLED_ROGASH_COUNT KILLED_KARSH_COUNT KILLED_GOTHMOG_COUNT KILLED_HWALDAR_COUNT KILLED_AZOG_COUNT KILLED_CAPTDALE_COUNT ANGMAR_INFANTRY_KILLED
			; Awards = GuardianOfMiddleEarth
			; Awards = GuardianOfMiddleEarth
			; BlingUpgrades		  =	Upgrade_CHW07 @Upgrade_CHW09	Upgrade_CHW10 Upgrade_CHW11 Upgrade_CHW40 Upgrade_CHW41
			; BlingUpgrades = Upgrade_NoHelmet Upgrade_WIZ_CHH01 @Upgrade_WIZ_CHH02 Upgrade_WIZ_CHH03 Upgrade_WIZ_CHH04 Upgrade_WIZ_CHH05 Upgrade_WIZ_CHH06 Upgrade_WIZ_CHH07 Upgrade_CorruptedMan_1_CHH08
			; BlingUpgrades = Upgrade_NoShoulderPlates Upgrade_WIZ_CHSP01 Upgrade_WIZ_CHSP02
			; BlingUpgrades = Upgrade_NoGauntlets 
			; BlingUpgrades = Upgrade_NoShield
			; BlingUpgrades = Upgrade_NoBoots
			; BlingUpgrades = Upgrade_WIZ_CHBOD01 @Upgrade_WIZ_CHBOD02 Upgrade_WIZ_CHBOD03
			; DefaultPrimaryColor	  =	R:160 G:160 B:160
			; DefaultSecondaryColor =	R:160 G:160 B:160
			; DefaultTertiaryColor  =	R:160 G:160 B:160
			; Attribute
				; GroupName			= CreateAHero_ArmorAttribute
				; MinValueUpgrade		= Upgrade_ArmorAttribute02
				; MaxValueUpgrade		= Upgrade_ArmorAttribute20
				; DefaultValueUpgrade	= Upgrade_ArmorAttribute08
			; End		
			; Attribute
				; GroupName			= CreateAHero_DamageMultAttribute
				; MinValueUpgrade		= Upgrade_DamageMultAttribute02
				; MaxValueUpgrade		= Upgrade_DamageMultAttribute20
				; DefaultValueUpgrade	= Upgrade_DamageMultAttribute04
			; End
			; Attribute
				; GroupName			= CreateAHero_HealthMultAttribute
				; MinValueUpgrade		= Upgrade_HealthMultAttribute03
				; MaxValueUpgrade		= Upgrade_HealthMultAttribute20
				; DefaultValueUpgrade	= Upgrade_HealthMultAttribute10
			; End
			; Attribute
				; GroupName			= CreateAHero_AutoHealAttribute
				; MinValueUpgrade		= Upgrade_AutoHealAttribute04
				; MaxValueUpgrade		= Upgrade_AutoHealAttribute20
				; DefaultValueUpgrade	= Upgrade_AutoHealAttribute06
			; End
			; Attribute
				; GroupName			= CreateAHero_VisionAttribute
				; MinValueUpgrade		= Upgrade_VisionAttribute04
				; MaxValueUpgrade		= Upgrade_VisionAttribute20
				; DefaultValueUpgrade	= Upgrade_VisionAttribute12
			; End
			; ViewInfo
				; FarPitch  = -0.066
				; FarZoom   = 0.210
				; FarFloor  = 15.760
				; FarDist   = 20.500
				; FarShift  = 5.900
				; NearPitch = 0.424
				; NearZoom  = 0.254
				; NearFloor = 74.260
				; NearDist  = 30.000
				; NearShift = 5.800
				; CloseUpPitch = -0.260
				; CloseUpZoom  = 0.200
				; CloseUpFloor = 50.000
				; CloseUpDist  = 33.000
				; CloseUpShift = 0.400
				; PortraitPitch = -0.120
				; PortraitZoom  = 0.200
				; PortraitFloor = 50.000
				; PortraitDist  = 50.00
				; PortraitShift = 0.80
				; MapLocation	= 6
			; End
		; End
	; End
; End