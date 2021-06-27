NAME	 	= "God Entity"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Get a powerfull extra unit with nuke ability on game start"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

Object ParticleFXTestObject
	VisionRange         = 12000.0 
	ShroudClearingRange = 12000.0
	CommandSet          = SuperEntityCommandSet
	KindOf = PRELOAD SELECTABLE CAN_CAST_REFLECTIONS DRONE UNATTACKABLE CLICK_THROUGH IGNORED_IN_GUI STRUCTURE MP_COUNT_FOR_VICTORY PORTABLE_STRUCTURE COMMANDCENTER AIRCRAFT EMP_HARDENED	
	AddModule
		Behavior = JetAIUpdate ModuleTag_07
			MinHeight                     = 5
			NeedsRunway                   = No
			KeepsParkingSpaceWhenAirborne = No
			AutoAcquireEnemiesWhenIdle    = Yes
			Turret
				TurretTurnRate = 999999
				TurretPitchRate = 999999
				ControlledWeaponSlots = PRIMARY
			End
		End
       Behavior = PhysicsBehavior ModuleTag_08
          Mass = 50.0
       End
		Behavior = SpyVisionUpdate ModuleTag_09
		End
		Behavior           = OCLSpecialPower ModuleTag_10
			SpecialPowerTemplate = SuperweaponNeutronMissile
			OCL                  = SUPERWEAPON_NeutronMissile
			CreateLocation       = CREATE_AT_LOCATION 
		End 
	End
	Locomotor = SET_NORMAL ComancheLocomotor
	Locomotor = SET_TAXIING   BasicHelicopterTaxiLocomotor
	Scale = 1
End

CommandSet SuperEntityCommandSet
  1 = Command_NeutronMissile
  14 = Command_Stop
End

SpecialPower SuperweaponNeutronMissile
  ReloadTime              = 0
End

PlayerTemplate FactionAmerica
	StartingBuilding = ParticleFXTestObject
End