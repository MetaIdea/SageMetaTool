NAME	 	= "Super Avatar Start Unit"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Spawn an (invincible) super avatar"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function SpawnSuperAvatar()
    local UnitRef = spawn("NodAvatar", LocalTeam)
    local self = GetObjectLuaRef(UnitRef)
	ObjectHideSubObjectPermanently( self, "NUBEAM", false )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", false )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", false )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", false )
    ObjectGrantUpgrade(self, "Upgrade_AvatarBeamCannon")
    ObjectGrantUpgrade(self, "Upgrade_AvatarStealthDetect")
    ObjectGrantUpgrade(self, "Upgrade_AvatarFlamer")
    ObjectGrantUpgrade(self, "Upgrade_AvatarStealthDetect")
    ObjectGrantUpgrade(self, "Upgrade_AvatarInvisibility")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_VETERAN")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_ELITE")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_HEROIC")
	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS", UnitRef, 50000) 
	ColorUnit(UnitRef, 0, 150, 0)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", UnitRef, "Indestructible", 0) 
	ExecuteAction("NAMED_SET_ATTITUDE", UnitRef, Behaviour["Agressive"])
    --ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",Asset)
	return UnitRef
end

SpawnSuperAvatar()