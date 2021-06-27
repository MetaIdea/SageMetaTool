NAME	 	= "Skybox"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Enable Skybox"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

SKYBOX = {
"CAH_DomeSkyboxNight_Doom",
"CAH_Skybox",
"CINE_CloudySkybox",
"CINE_DomeSkybox",
"CINE_DomeSkyboxDusk",
"CINE_DomeSkyboxMorning",
"CINE_DomeSkyboxMT",
"CINE_DomeSkyboxMTdark",
"CINE_DomeSkyboxNight",
"CINE_DomeSkyboxNightB",
"CINE_DomeSkyboxNight_Doom",
"CINE_DomeSkyboxNoon",
"CINE_Eye_Skybox",
"CINE_SkyboxBlue",
"CINE_SkyboxBrnMntB",
"CINE_SkyboxDarkRT",
"CINE_SkyboxDoom",
"CINE_SkyboxGrnMnt",
"CINE_SkyboxGryMnt",
"CINE_SkyboxLiteRT",
"CINE_SkyboxMoat",
"CINE_SkyboxMystMnt",
"CINE_SkyboxPinkRT",
"CINE_SkyboxYIwRT",
"CINE_skybox_day",
"CINE_skybox_day2",
"CINE_skybox_FXWaterTestMap",
"CINE_skybox_morning2",
"CINE_Skybox_X1",
"CINE_SkyDome004",
"CINE_SkyDome011",
"CINE_SkyDome015",
"CINE_SkyDome019",
"CINE_SkyDome_Dark_Cloud1",
"CINE_SkyDome_Dark_Cloud1_Blue",
"CINE_SkyDome_Dark_Cloud1_HiCon",
"CINE_SkyDome_Dark_Cloud2",
"CINE_SkyDome_Lite_Cloud",
"CINE_SkyDome_Rock",
"WaterReflectionSkydome_Cave",
"WaterReflectionSkydome_Celduin",
"WaterReflectionSkydome_DarkCloud",
"WaterReflectionSkydome_DarkCloud2",
"WaterReflectionSkydome_DarkCloud3",
"WaterReflectionSkydome_DolGul",
"WaterReflectionSkydome_Ettenmoors",
"WaterReflectionSkydome_GapOfRohan",
"WaterReflectionSkydome_MinasMorgul",
"WaterReflectionSkydome_Mirkwood",
}
	
ExecuteAction("DRAW_SKYBOX_BEGIN")
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"CAH_Skybox",NeutralTeam,{MapSizeX, MapSizeY/2, 0}, 0)
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"CAH_Skybox",NeutralTeam,{0, MapSizeY/2, 0}, PI)