NAME	 	= "Capture the Tower"
VERSION		= "1.0"
TYPE		= "DISABLED"--"GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "This is an example gamemode template"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

------------------------------------------------------------------
----------------------SCRIPT SECTION------------------------------
------------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "This is an empty example gamemode", 300)

function CaptureControlPointGamemode()
end

function ControlPointGamemodeSetup()
	if CCP_Initialized==0 then 
		CCP_Initialized=1
		ControlPointStringRef=RandomString(3)
		SpawnAtPosition("ControlPointX_OCL",NeutralTeam,MapSize.x/2,MapSize.y/2,0,ControlPointRef)
	end
end

function ControlPointXCreated(self)
    ControlPointTableRef=self
	ObjectHideSubObjectPermanently( self, "TB_CP_ALN", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_GDI", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_NOD", true )
	ObjectHideSubObjectPermanently( self, "LIGHTSF01", true )
	ObjectHideSubObjectPermanently( self, "100", false)
	ObjectHideSubObjectPermanently( self, "75", false)
	ObjectHideSubObjectPermanently( self, "50", false)
	ObjectHideSubObjectPermanently( self, "25", false )
end

function ControlPointEnemyNear(self)
	print("ControlPoint near")
end

function ControlPointEnemyAway(self)
	print("ControlPoint far")
end

function ControlPointCAPTURED()
	print("captured")
end

function ControlPointCAPTURE_100()
	print("captured 100")
end

function ControlPointCAPTURE_75()
	print("captured 75")
end

function ControlPointCAPTURE_50()
	print("captured 50")
end

function ControlPointCAPTURE_25()
	print("captured 25")
end

function ControlPointCAPTURE_0()
	print("captured 0")
end

function ControlPointTest()
	ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Neva_YouHaveFlag", team)	
	ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_FlagCaptured", team)	
	ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Neva_FlagHasBeenTak", team)	
end