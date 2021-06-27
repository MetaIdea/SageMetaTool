NAME	 	= "SurpriseParty"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Makes everything stealthed"
AUTHOR 		= "IllMakeUEargasm"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

Object AmericaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

Object AmericaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaParticleCannonUplink
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End



Object AmericaStrategyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaSupplyDropZone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End



Object AmericaPatriotBattery
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

Object AmericaFireBase
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaInfantryRanger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


Object AmericaInfantryMissileDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 

Object AmericaInfantryPilot
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 


Object AmericaInfantryPathfinder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 



Object AmericaVehicleHumvee
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 


Object AmericaVehicleTomahawk
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 


Object AmericaVehicleMedic
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 



Object AmericaVehicleBattleDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaVehicleHellfireDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaTankCrusader
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaTankPaladin
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaTankAvenger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaTankMicrowave
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaJetRaptor
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaVehicleComanche
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AmericaVehicleChinook
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

 Object AmericaJetCargoPlane
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

Object AirF_AmericaVehicleComanche
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaJetCargoPlane
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaInfantryRanger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaInfantryMissileDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaInfantryPilot
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaInfantryPathfinder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaVehicleHumvee
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaVehicleTomahawk
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaVehicleMedic
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaVehicleHellfireDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaTankAvenger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaTankMicrowave
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaParticleCannonUplink
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaStrategyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaSupplyDropZone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaPatriotBattery
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaFireBase
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AFG_AmericaVehicleChinook
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaVehicleChinook
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object AirF_AmericaJetRaptor
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaJetRaptor
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleComanche
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleChinook
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaJetCargoPlane
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaInfantryRanger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaInfantryMissileDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaInfantryPilot
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaInfantryPathfinder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleHumvee
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleTomahawk
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleMedic
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleBattleDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleHellfireDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaTankCrusader
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaTankPaladin
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaTankAvenger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaTankMicrowave
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaParticleCannonUplink
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaStrategyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaSupplyDropZone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaFireBase
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaPatriotBattery
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Lazr_AmericaLaserCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaJetRaptor
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleComanche
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleChinook
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaJetCargoPlane
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaInfantryRanger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaInfantryMissileDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaInfantryPilot
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaInfantryPathfinder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleHumvee
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleTomahawk
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleMedic
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleBattleDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleHellfireDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaTankCrusader
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaTankPaladin
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaTankAvenger
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaTankMicrowave
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaParticleCannonUplink
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaStrategyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaPatriotBattery
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaFireBase
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object SupW_AmericaSupplyDropZone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaPropagandaCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaSpeakerTower
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaBunker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaPropagandaCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaGattlingCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaInternetCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaNuclearMissileLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaInfantryRedguard
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaInfantryTankHunter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaInfantryHacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaTankBattleMaster
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaTankOverlord
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaTankDragon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleTroopCrawler
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleInfernoCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleNukeLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaTankGattling
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleSupplyTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaTankECM
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleListeningOutpost
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE RIDERS_ATTACKING
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaVehicleHelix
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object ChinaJetMIG
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaJetMIG
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaInfantryTankHunter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaInfantryHacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaTankDragon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaVehicleInfernoCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaVehicleNukeLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaTankGattling
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaVehicleSupplyTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaTankECM
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaNuclearMissileLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaPropagandaCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaSpeakerTower
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaPropagandaCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaGattlingCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaInternetCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaBunker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaInfantryMiniGunner
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
Object Infa_ChinaVehicleTroopCrawler
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

 Object Infa_ChinaVehicleListeningOutpost
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE RIDERS_ATTACKING
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
 Object Infa_ChinaVehicleHelix
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
 Object Tank_ChinaVehicleHelix
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
 Object Tank_ChinaJetMIG
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
 Object Tank_ChinaInfantryRedguard
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaInfantryTankHunter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaInfantryHacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaTankBattleMaster
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 



  Object Tank_ChinaTankEmperor
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaTankDragon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaVehicleTroopCrawler
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaTankGattling
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 

  Object Tank_ChinaVehicleSupplyTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaTankECM
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaVehicleListeningOutpost
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE RIDERS_ATTACKING
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaNuclearMissileLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaSpeakerTower
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaBunker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaPropagandaCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaGattlingCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaInternetCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Tank_ChinaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleHelix
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaJetMIG
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaInfantryRedguard
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaInfantryTankHunter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaInfantryHacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaTankDragon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleTroopCrawler
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleInfernoCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleNukeLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaTankGattling
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleSupplyTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleDozer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaTankECM
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaVehicleListeningOutpost
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE RIDERS_ATTACKING
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaCommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaAirfield
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaNuclearMissileLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaSpeakerTower
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaSupplyCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaPowerPlant
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaBarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaWarFactory
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaBunker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaPropagandaCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaTankBattleMaster
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaTankOverlord
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End 
 
  Object Nuke_ChinaInternetCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 

  Object GLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object FakeGLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object FakeGLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLAScudStorm
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLATunnelNetwork
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLABarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLAStingerSite
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLAPalace
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 


  Object GLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object FakeGLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object FakeGLABarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object FakeGLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLATankScorpion
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLAVehicleRocketBuggy
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object GLAVehicleCombatBike
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object  GLAVehicleQuadCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object  GLAVehicleToxinTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
  Object  GLAVehicleBombTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAVehicleScudLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object GLAVehicleTechnicalChassisOne
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object GLAVehicleTechnicalChassisTwo
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object GLAVehicleTechnicalChassisThree
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLALightTank
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End


   Object  GLATankMarauder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAVehicleRadarVan
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAVehicleBattleBus
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAInfantryRebel
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAInfantryTunnelDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAInfantryTerrorist
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAInfantryAngryMobNexus
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAInfantryHijacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  GLAInfantryWorker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobPistol01
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobRock02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobMolotov02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobPistol03
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobPistol05
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobRock04
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  GLAInfantryAngryMobMolotov02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_ScudStormMissile
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_FakeGLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_FakeGLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAScudStorm
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLATunnelNetwork
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAStingerSite
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAPalace
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_FakeGLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLABarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object Demo_FakeGLABarracks 
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_FakeGLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryRebel
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryTunnelDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryTerrorist
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 



   Object  Demo_GLAInfantryAngryMobPistol01
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryAngryMobRock02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryAngryMobPistol03
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryAngryMobRock04
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryAngryMobPistol05
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryAngryMobMolotov02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryHijacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAInfantryWorker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLATankScorpion
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleRocketBuggy
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleCombatBike
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleQuadCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleToxinTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleBombTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleScudLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleTechnicalChassisOne
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleTechnicalChassisTwo
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleTechnicalChassisThree
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLATankMarauder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleRadarVan
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Demo_GLAVehicleBattleBus
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_FakeGLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_FakeGLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAScudStorm
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLADemoTrap
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAStingerSite
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 

   Object  Chem_GLAPalace
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_FakeGLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLABarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_FakeGLABarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_FakeGLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 

   Object  Chem_GLAInfantryRebel
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 

   Object  Chem_GLAInfantryTunnelDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryTerrorist
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryAngryMobPistol01
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryAngryMobRock02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryAngryMobPistol03
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryAngryMobRock04
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryAngryMobPistol05
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryAngryMobMolotov02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAInfantryWorker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  Chem_GLATankScorpion
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleRocketBuggy
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleCombatBike
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleQuadCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleToxinTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleBombTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleScudLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleTechnicalChassisOne
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleTechnicalChassisTwo
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleTechnicalChassisThree
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLATankMarauder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleRadarVan
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Chem_GLAVehicleBattleBus
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

 
   Object  Slth_FakeGLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

   Object  Slth_GLACommandCenter
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_FakeGLABlackMarket
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAScudStorm
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLATunnelNetwork
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAStingerSite
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAPalace
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_FakeGLASupplyStash
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLABarracks
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_FakeGLABarracks 
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_FakeGLAArmsDealer
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryRebel
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryTunnelDefender
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryTerrorist
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryAngryMobPistol01
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryAngryMobRock02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryAngryMobPistol03
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryAngryMobRock04
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryAngryMobPistol05
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryAngryMobMolotov02
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAInfantryWorker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLATankScorpion
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleRocketBuggy
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleCombatBike
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleQuadCannon
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleToxinTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleBombTruck
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleScudLauncher
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleTechnicalChassisOne
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleTechnicalChassisTwo
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
   Object  Slth_GLAVehicleTechnicalChassisThree
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
    Object  Slth_GLATankMarauder
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
     Object  Slth_GLAVehicleRadarVan
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
     Object  Slth_GLAVehicleBattleBus
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

     Object  AmericaJetAurora
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

      Object  SupW_AmericaJetAurora
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  Lazr_AmericaJetAurora
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End

      Object  GLAInfantryHijacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  Demo_GLAInfantryHijacker
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  AmericaVehicleSentryDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  AirF_AmericaVehicleSentryDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  AirF_AmericaVehicleSentryDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  Lazr_AmericaVehicleSentryDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
      Object  SupW_AmericaVehicleSentryDrone
  AddModule 
  Behavior = StealthUpdate ModuleTag_NolanStealth
    StealthDelay                = 2000 ; msec
    StealthForbiddenConditions  = ATTACKING USING_ABILITY TAKING_DAMAGE
    HintDetectableConditions    = IS_FIRING_WEAPON 
    FriendlyOpacityMin          = 50.0%
    FriendlyOpacityMax          = 100.0%
    InnateStealth               = Yes
    OrderIdleEnemiesToAttackMeUponReveal  = Yes

  End
  End
End
 
PlayerTemplate FactionAmerica
  ProductionCostChange = AmericaJetAurora 150% 

  End


PlayerTemplate FactionAmericaSuperWeaponGeneral
  ProductionCostChange = SupW_AmericaJetAurora 150% 

  End


PlayerTemplate FactionAmericaLaserGeneral
  ProductionCostChange = Lazr_AmericaJetAurora 150% 

  End


PlayerTemplate FactionAmericaAirForceGeneral
  ProductionCostChange = AirF_AmericaJetAurora 150% 

  End


PlayerTemplate FactionAmericaAirForceGeneral
  ProductionCostChange = AirF_AmericaJetRaptor 265% 

  End


PlayerTemplate FactionChinaNukeGeneral
  ProductionCostChange = Upgrade_ChinaTacticalNukeMig 200% 

End


Object Nuke_ChinaSpeakerTower
  AddModule 
  Behavior = StealthDetectorUpdate ModuleTag_Nolanziet
    DetectionRate             = 900   
    DetectionRange            = 500 
  End
End
End


Object ChinaSpeakerTower
  AddModule 
  Behavior = StealthDetectorUpdate ModuleTag_Nolanziet
    DetectionRate             = 900   
    DetectionRange            = 500 
  End
End
End



Object Tank_ChinaSpeakerTower
  AddModule 
  Behavior = StealthDetectorUpdate ModuleTag_Nolanziet
    DetectionRate             = 900   
    DetectionRange            = 500 
  End
End
End


Object Infa_ChinaSpeakerTower
  AddModule 
  Behavior = StealthDetectorUpdate ModuleTag_Nolanziet
    DetectionRate             = 900   
    DetectionRange            = 500 
  End
End
End


Object AirF_AmericaVehicleComanche
 ReplaceModule ModuleTag_06
  Behavior = JetAIUpdate ModuleTag_06_Override
    MinHeight                     = 5
    NeedsRunway                   = No
    KeepsParkingSpaceWhenAirborne = No
    AutoAcquireEnemiesWhenIdle    = Yes Stealthed
    ; note that comanches do not return to base when idle
    
    ; this is a bit of a trick... normally, units cannot move-and-fire at
    ; the same time. we need the comanche to be able to. so we give it
    ; a "turret" (invisible) and put the two main weapons on it, but with
    ; no turn rate. voila!
    Turret
      TurretTurnRate = 0      ; this "turret" does not turn
      TurretPitchRate = 0     ; nor does it pitch
      ControlledWeaponSlots = PRIMARY SECONDARY
    End

  End
  Locomotor = SET_NORMAL  ComancheLocomotor
  Locomotor = SET_TAXIING BasicHelicopterTaxiLocomotor
End
End


Object AirF_AmericaInfantryRanger
  ReplaceModule ModuleTag_06
    Behavior = AIUpdateInterface ModuleTag_06_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End
 

Object AirF_AmericaInfantryMissileDefender
  ReplaceModule ModuleTag_04
    Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
End
Locomotor = SET_NORMAL MissileDefenderLocomotor
End


Object AirF_AmericaVehicleHumvee
  ReplaceModule ModuleTag_03
 Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 180
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
  Locomotor = SET_NORMAL HumveeLocomotor
End
End


Object AirF_AmericaVehicleTomahawk
  ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 60   ; turn rate, in degrees per sec
      TurretPitchRate = 60
      FirePitch = 70  ; Instead of aiming pitchwise at the target, it will aim here
      AllowsPitch = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TomahawkLocomotor
End
End

Object AirF_AmericaVehicleBattleDrone
  ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      MinPhysicalPitch      = -75 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      AllowsPitch           = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
  Locomotor = SET_NORMAL BattleDroneLocomotor
  Locomotor = SET_PANIC BattleDronePanicLocomotor   ;used for repairing master (zippy)
End
End


Object AirF_AmericaVehicleHellfireDrone
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL HellfireDroneLocomotor
End
End  


Object AirF_AmericaTankAvenger
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL AvengerLocomotor
End
End

 
Object AirF_AmericaTankMicrowave
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor            = SET_NORMAL CrusaderLocomotor
End
End

Object AirF_AmericaPatriotBattery
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 180   // turn rate, in degrees per sec
      TurretPitchRate       = 180
      AllowsPitch           = Yes
      NaturalTurretPitch    = 45   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End



Object AirF_AmericaFireBase
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 60   // turn rate, in degrees per sec
      TurretPitchRate       = 60
      AllowsPitch           = Yes
      NaturalTurretPitch    = 1   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 550    ; in milliseconds
      MaxIdleScanInterval   = 950    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End 
End 
End

Object AmericaVehicleComanche
 ReplaceModule ModuleTag_06
  Behavior = JetAIUpdate ModuleTag_06_Override
    MinHeight                     = 5
    NeedsRunway                   = No
    KeepsParkingSpaceWhenAirborne = No
    AutoAcquireEnemiesWhenIdle    = Yes Stealthed
    ; note that comanches do not return to base when idle
    
    ; this is a bit of a trick... normally, units cannot move-and-fire at
    ; the same time. we need the comanche to be able to. so we give it
    ; a "turret" (invisible) and put the two main weapons on it, but with
    ; no turn rate. voila!
    Turret
      TurretTurnRate = 0      ; this "turret" does not turn
      TurretPitchRate = 0     ; nor does it pitch
      ControlledWeaponSlots = PRIMARY SECONDARY
    End

  End
  Locomotor = SET_NORMAL  ComancheLocomotor
  Locomotor = SET_TAXIING BasicHelicopterTaxiLocomotor
End
End


Object AmericaInfantryRanger
  ReplaceModule ModuleTag_06
    Behavior = AIUpdateInterface ModuleTag_06_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End
 

Object AmericaInfantryMissileDefender
  ReplaceModule ModuleTag_04
    Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
End
Locomotor = SET_NORMAL MissileDefenderLocomotor
End


Object AmericaVehicleHumvee
  ReplaceModule ModuleTag_03
 Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 180
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
  Locomotor = SET_NORMAL HumveeLocomotor
End
End


Object AmericaVehicleTomahawk
  ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 60   ; turn rate, in degrees per sec
      TurretPitchRate = 60
      FirePitch = 70  ; Instead of aiming pitchwise at the target, it will aim here
      AllowsPitch = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TomahawkLocomotor
End
End

Object AmericaVehicleBattleDrone
  ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      MinPhysicalPitch      = -75 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      AllowsPitch           = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
  Locomotor = SET_NORMAL BattleDroneLocomotor
  Locomotor = SET_PANIC BattleDronePanicLocomotor   ;used for repairing master (zippy)
End
End


Object AmericaVehicleHellfireDrone
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL HellfireDroneLocomotor
End
End  


Object AmericaTankAvenger
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL AvengerLocomotor
End
End

 
Object AmericaTankMicrowave
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor            = SET_NORMAL CrusaderLocomotor
End
End

Object AmericaPatriotBattery
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 180   // turn rate, in degrees per sec
      TurretPitchRate       = 180
      AllowsPitch           = Yes
      NaturalTurretPitch    = 45   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End



Object AmericaFireBase
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 60   // turn rate, in degrees per sec
      TurretPitchRate       = 60
      AllowsPitch           = Yes
      NaturalTurretPitch    = 1   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 550    ; in milliseconds
      MaxIdleScanInterval   = 950    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End 
End 
End

Object AmericaTankPaladin
  ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 180 ;60   // turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    ;AltTurret
    ;  TurretTurnRate = 9000;
    ;  ControlledWeaponSlots = SECONDARY
    ;End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL CrusaderLocomotor
End
End


Object AmericaTankCrusader
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate       = 180 ;60   // turn rate, in degrees per sec
      ControlledWeaponSlots= PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor            = SET_NORMAL CrusaderLocomotor
End
End



Object SupW_AmericaVehicleTomahawk
  ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 60   ; turn rate, in degrees per sec
      TurretPitchRate = 60
      FirePitch = 70  ; Instead of aiming pitchwise at the target, it will aim here
      AllowsPitch = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TomahawkLocomotor
End
End

Object SupW_AmericaTankMicrowave
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor            = SET_NORMAL CrusaderLocomotor
End
End

Object SupW_AmericaVehicleHumvee
  ReplaceModule ModuleTag_03
 Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 180
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
  Locomotor = SET_NORMAL HumveeLocomotor
End
End

Object SupW_AmericaTankAvenger
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL AvengerLocomotor
End
End





Object SupW_AmericaVehicleBattleDrone
  ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      MinPhysicalPitch      = -75 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      AllowsPitch           = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
  Locomotor = SET_NORMAL BattleDroneLocomotor
  Locomotor = SET_PANIC BattleDronePanicLocomotor   ;used for repairing master (zippy)
End
End

Object SupW_AmericaVehicleHellfireDrone
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL HellfireDroneLocomotor
End
End  

Object SupW_AmericaVehicleComanche
 ReplaceModule ModuleTag_06
  Behavior = JetAIUpdate ModuleTag_06_Override
    MinHeight                     = 5
    NeedsRunway                   = No
    KeepsParkingSpaceWhenAirborne = No
    AutoAcquireEnemiesWhenIdle    = Yes Stealthed
    ; note that comanches do not return to base when idle
    
    ; this is a bit of a trick... normally, units cannot move-and-fire at
    ; the same time. we need the comanche to be able to. so we give it
    ; a "turret" (invisible) and put the two main weapons on it, but with
    ; no turn rate. voila!
    Turret
      TurretTurnRate = 0      ; this "turret" does not turn
      TurretPitchRate = 0     ; nor does it pitch
      ControlledWeaponSlots = PRIMARY SECONDARY
    End

  End
  Locomotor = SET_NORMAL  ComancheLocomotor
  Locomotor = SET_TAXIING BasicHelicopterTaxiLocomotor
End
End


Object SupW_AmericaInfantryRanger
  ReplaceModule ModuleTag_06
    Behavior = AIUpdateInterface ModuleTag_06_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End


Object SupW_AmericaFireBase
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 60   // turn rate, in degrees per sec
      TurretPitchRate       = 60
      AllowsPitch           = Yes
      NaturalTurretPitch    = 1   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 550    ; in milliseconds
      MaxIdleScanInterval   = 950    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End 
End 
End

Object SupW_AmericaInfantryMissileDefender
  ReplaceModule ModuleTag_04
    Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
End
Locomotor = SET_NORMAL MissileDefenderLocomotor
End




Object SupW_AmericaPatriotBattery
 ReplaceModule ModuleTag_07
  Behavior = AIUpdateInterface ModuleTag_07_Override
    Turret
      TurretTurnRate        = 180   // turn rate, in degrees per sec
      TurretPitchRate       = 180
      AllowsPitch           = Yes
      NaturalTurretPitch    = 45   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End

Object Lazr_AmericaVehicleComanche
 ReplaceModule ModuleTag_06
  Behavior = JetAIUpdate ModuleTag_06_Override
    MinHeight                     = 5
    NeedsRunway                   = No
    KeepsParkingSpaceWhenAirborne = No
    AutoAcquireEnemiesWhenIdle    = Yes Stealthed
    ; note that comanches do not return to base when idle
    
    ; this is a bit of a trick... normally, units cannot move-and-fire at
    ; the same time. we need the comanche to be able to. so we give it
    ; a "turret" (invisible) and put the two main weapons on it, but with
    ; no turn rate. voila!
    Turret
      TurretTurnRate = 0      ; this "turret" does not turn
      TurretPitchRate = 0     ; nor does it pitch
      ControlledWeaponSlots = PRIMARY SECONDARY
    End

  End
  Locomotor = SET_NORMAL  ComancheLocomotor
  Locomotor = SET_TAXIING BasicHelicopterTaxiLocomotor
End
End


Object Lazr_AmericaInfantryRanger
  ReplaceModule ModuleTag_06
    Behavior = AIUpdateInterface ModuleTag_06_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End
 

Object Lazr_AmericaInfantryMissileDefender
  ReplaceModule ModuleTag_04
    Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
End
Locomotor = SET_NORMAL MissileDefenderLocomotor
End


Object Lazr_AmericaVehicleHumvee
  ReplaceModule ModuleTag_03
 Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 180
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
  Locomotor = SET_NORMAL HumveeLocomotor
End
End


Object Lazr_AmericaVehicleTomahawk
  ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 60   ; turn rate, in degrees per sec
      TurretPitchRate = 60
      FirePitch = 70  ; Instead of aiming pitchwise at the target, it will aim here
      AllowsPitch = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TomahawkLocomotor
End
End

Object Lazr_AmericaVehicleBattleDrone
  ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      MinPhysicalPitch      = -75 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      AllowsPitch           = Yes
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End  
  Locomotor = SET_NORMAL BattleDroneLocomotor
  Locomotor = SET_PANIC BattleDronePanicLocomotor   ;used for repairing master (zippy)
End
End


Object Lazr_AmericaVehicleHellfireDrone
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate        = 360   // turn rate, in degrees per sec
      TurretPitchRate       = 360
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL HellfireDroneLocomotor
End
End  


Object Lazr_AmericaTankAvenger
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL AvengerLocomotor
End
End

 
Object Lazr_AmericaTankMicrowave
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor            = SET_NORMAL CrusaderLocomotor
End
End



Object Lazr_AmericaPatriotBattery
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 180   // turn rate, in degrees per sec
      TurretPitchRate       = 180
      AllowsPitch           = Yes
      NaturalTurretPitch    = 45   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End



Object Lazr_AmericaFireBase
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      TurretTurnRate        = 60   // turn rate, in degrees per sec
      TurretPitchRate       = 60
      AllowsPitch           = Yes
      NaturalTurretPitch    = 1   
      GroundUnitPitch       = 40
      MinPhysicalPitch      = -20
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
      MinIdleScanInterval   = 550    ; in milliseconds
      MaxIdleScanInterval   = 950    ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End

    AutoAcquireEnemiesWhenIdle = Yes Stealthed ;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End 
End 
End

Object Lazr_AmericaTankPaladin
  ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 180 ;60   // turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    ;AltTurret
    ;  TurretTurnRate = 9000;
    ;  ControlledWeaponSlots = SECONDARY
    ;End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL CrusaderLocomotor
End
End


Object Lazr_AmericaTankCrusader
 ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate       = 180 ;60   // turn rate, in degrees per sec
      ControlledWeaponSlots= PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor            = SET_NORMAL CrusaderLocomotor
End
End

Object ChinaGattlingCannon
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250   ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End

Object ChinaInfantryRedguard
ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RedguardLocomotor
  End
End 

Object ChinaInfantryTankHunter
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object ChinaTankBattleMaster
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120   ; turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

  Locomotor = SET_NORMAL BattleMasterLocomotor
  Locomotor = SET_NORMAL_UPGRADED NuclearBattleMasterLocomotor
End
End


Object ChinaTankOverlord
ReplaceModule ModuleTag_03
  Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 60 ;30 ;15   // turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL OverlordLocomotor
  Locomotor = SET_NORMAL_UPGRADED NuclearOverlordLocomotor
 End
End

Object ChinaTankOverlordGattlingCannon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 60   // turn rate, in degrees per sec
      TurretPitchRate     = 60
      AllowsPitch         = Yes
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed 
  End
End
End

Object ChinaTankDragon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120
      TurretPitchRate = 120
      AllowsPitch = Yes
      MinPhysicalPitch = -15

      TurretFireAngleSweep = PRIMARY 10
      TurretFireAngleSweep = SECONDARY 60
      TurretSweepSpeedModifier = PRIMARY 0.5    ; Sweep slower than you turn (aim for 30 for art)
      TurretSweepSpeedModifier = SECONDARY 2.0  ; Sweep faster than you turn
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL DragonLocomotor
End
End

Object ChinaVehicleInfernoCannon
ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate = 100
      TurretPitchRate = 100
      AllowsPitch = Yes
      FirePitch = 45
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL InfernoLocomotor
End
End


 
Object ChinaTankGattling
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
                               ; since you never know from whence cometh danger
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
Locomotor       = SET_NORMAL GattlingTankLocomotor
End
End

Object ChinaVehicleHelix
ReplaceModule ModuleTag_07
  Behavior = ChinookAIUpdate ModuleTag_07_Override
     AutoAcquireEnemiesWhenIdle = Yes Stealthed
     RotorWashParticleSystem = HelixRotorWashRing
  End
  Locomotor = SET_NORMAL    HelixLocomotor
  Locomotor = SET_TAXIING   BasicHelicopterTaxiLocomotor
End
End

Object ChinaHelixGattlingCannon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY 
      TurretTurnRate      = 60   // turn rate, in degrees per sec
      TurretPitchRate     = 60
      AllowsPitch         = Yes
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
End
End



Object Nuke_ChinaGattlingCannon
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250   ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End

Object Nuke_ChinaInfantryRedguard
ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RedguardLocomotor
  End
End 

Object Nuke_ChinaInfantryTankHunter
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object Nuke_ChinaTankBattleMaster
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120   ; turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

Locomotor = SET_NORMAL Nuke_FusionBattleMasterLocomotor
End
End


Object Nuke_ChinaTankOverlord
ReplaceModule ModuleTag_03
  Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 60 ;30 ;15   // turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
   Locomotor = SET_NORMAL Nuke_FusionOverlordLocomotor
 End
End

Object Nuke_ChinaTankOverlordGattlingCannon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 60   // turn rate, in degrees per sec
      TurretPitchRate     = 60
      AllowsPitch         = Yes
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed 
  End
End
End

Object Nuke_ChinaTankDragon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120
      TurretPitchRate = 120
      AllowsPitch = Yes
      MinPhysicalPitch = -15

      TurretFireAngleSweep = PRIMARY 10
      TurretFireAngleSweep = SECONDARY 60
      TurretSweepSpeedModifier = PRIMARY 0.5    ; Sweep slower than you turn (aim for 30 for art)
      TurretSweepSpeedModifier = SECONDARY 2.0  ; Sweep faster than you turn
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL DragonLocomotor
End
End

Object Nuke_ChinaVehicleInfernoCannon
ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate = 100
      TurretPitchRate = 100
      AllowsPitch = Yes
      FirePitch = 45
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL InfernoLocomotor
End
End


 
Object Nuke_ChinaTankGattling
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
                               ; since you never know from whence cometh danger
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
Locomotor       = SET_NORMAL GattlingTankLocomotor
End
End

Object Nuke_ChinaVehicleHelix
ReplaceModule ModuleTag_07
  Behavior = ChinookAIUpdate ModuleTag_07_Override
     AutoAcquireEnemiesWhenIdle = Yes Stealthed
     RotorWashParticleSystem = HelixRotorWashRing
  End
  Locomotor = SET_NORMAL    HelixLocomotor
  Locomotor = SET_TAXIING   BasicHelicopterTaxiLocomotor
End
End

Object Nuke_ChinaHelixGattlingCannon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY 
      TurretTurnRate      = 60   // turn rate, in degrees per sec
      TurretPitchRate     = 60
      AllowsPitch         = Yes
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
End
End


Object Tank_ChinaGattlingCannon
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250   ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End

Object Tank_ChinaInfantryRedguard
ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RedguardLocomotor
  End
End 

Object Tank_ChinaInfantryTankHunter
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object Tank_ChinaTankBattleMaster
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120   ; turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

  Locomotor = SET_NORMAL BattleMasterLocomotor
  Locomotor = SET_NORMAL_UPGRADED NuclearBattleMasterLocomotor
End
End


Object Tank_ChinaTankEmperor
ReplaceModule ModuleTag_03
  Behavior = TransportAIUpdate ModuleTag_03_Override
    Turret
      TurretTurnRate = 60 ;30 ;15   // turn rate, in degrees per sec
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL OverlordLocomotor
  Locomotor = SET_NORMAL_UPGRADED NuclearOverlordLocomotor
 End
End

Object Tank_ChinaTankOverlordGattlingCannon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 60   // turn rate, in degrees per sec
      TurretPitchRate     = 60
      AllowsPitch         = Yes
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed 
  End
End
End

Object Tank_ChinaTankDragon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120
      TurretPitchRate = 120
      AllowsPitch = Yes
      MinPhysicalPitch = -15

      TurretFireAngleSweep = PRIMARY 10
      TurretFireAngleSweep = SECONDARY 60
      TurretSweepSpeedModifier = PRIMARY 0.5    ; Sweep slower than you turn (aim for 30 for art)
      TurretSweepSpeedModifier = SECONDARY 2.0  ; Sweep faster than you turn
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL DragonLocomotor
End
End

 
Object Tank_ChinaTankGattling
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
                               ; since you never know from whence cometh danger
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    MoodAttackCheckRate        = 250
  End
Locomotor       = SET_NORMAL GattlingTankLocomotor
End
End

Object Tank_ChinaVehicleHelix
ReplaceModule ModuleTag_07
  Behavior = ChinookAIUpdate ModuleTag_07_Override
     AutoAcquireEnemiesWhenIdle = Yes Stealthed
     RotorWashParticleSystem = HelixRotorWashRing
  End
  Locomotor = SET_NORMAL    HelixLocomotor
  Locomotor = SET_TAXIING   BasicHelicopterTaxiLocomotor
End
End

Object Tank_ChinaHelixGattlingCannon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      ControlledWeaponSlots = PRIMARY 
      TurretTurnRate      = 60   // turn rate, in degrees per sec
      TurretPitchRate     = 60
      AllowsPitch         = Yes
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
End
End



Object Infa_ChinaGattlingCannon
 ReplaceModule ModuleTag_06
  Behavior = AIUpdateInterface ModuleTag_06_Override
    Turret
      ControlledWeaponSlots = PRIMARY SECONDARY
      TurretTurnRate      = 180   // turn rate, in degrees per sec
      TurretPitchRate     = 180
      AllowsPitch         = Yes
      FiresWhileTurning   = Yes
      NaturalTurretPitch  = 45 ; this keeps it aimed half way between land and sky
      MinIdleScanInterval   = 250    ; in milliseconds
      MaxIdleScanInterval   = 250   ; in milliseconds
      MinIdleScanAngle      = 0       ; in degrees off the natural turret angle
      MaxIdleScanAngle      = 360     ; in degrees off the natural turret angle
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed;ATTACK_BUILDINGS; defensive weapon
    MoodAttackCheckRate        = 250
  End
End
End


Object Infa_ChinaInfantryTankHunter
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object Infa_ChinaTankDragon
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 120
      TurretPitchRate = 120
      AllowsPitch = Yes
      MinPhysicalPitch = -15

      TurretFireAngleSweep = PRIMARY 10
      TurretFireAngleSweep = SECONDARY 60
      TurretSweepSpeedModifier = PRIMARY 0.5    ; Sweep slower than you turn (aim for 30 for art)
      TurretSweepSpeedModifier = SECONDARY 2.0  ; Sweep faster than you turn
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL DragonLocomotor
End
End

Object Infa_ChinaVehicleInfernoCannon
ReplaceModule ModuleTag_04
  Behavior = AIUpdateInterface ModuleTag_04_Override
    Turret
      TurretTurnRate = 100
      TurretPitchRate = 100
      AllowsPitch = Yes
      FirePitch = 45
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL InfernoLocomotor
End
End

Object Infa_ChinaVehicleHelix
ReplaceModule ModuleTag_07
  Behavior = ChinookAIUpdate ModuleTag_07_Override
     AutoAcquireEnemiesWhenIdle = Yes Stealthed
     RotorWashParticleSystem = HelixRotorWashRing
  End
  Locomotor = SET_NORMAL    HelixLocomotor
  Locomotor = SET_TAXIING   BasicHelicopterTaxiLocomotor
End
End

Object Infa_ChinaInfantryMiniGunner
ReplaceModule ModuleTag_04
Behavior = AIUpdateInterface ModuleTag_04_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RedguardLocomotor
End
End

Object GLATankScorpion
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 100
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL ScorpionLocomotor
End
End

Object GLAVehicleRocketBuggy
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 90
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RocketBuggyLocomotor
End
End

Object GLAVehicleToxinTruck
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    Turret
      TurretTurnRate            = 180
      TurretPitchRate           = 180
      AllowsPitch               = Yes
      MinPhysicalPitch          = -20 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      TurretFireAngleSweep      = PRIMARY 8
      TurretSweepSpeedModifier  = PRIMARY 0.5    ; Sweep slower than you turn
      ControlledWeaponSlots     = PRIMARY
    End
  End
  Locomotor             = SET_NORMAL ToxinTruckLocomotor
End
End



   Object GLAVehicleTechnicalChassisOne
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object GLAVehicleTechnicalChassisTwo
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object GLAVehicleTechnicalChassisThree
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End


   Object  GLATankMarauder
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MarauderLocomotor
End
End

   Object  GLAInfantryRebel
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End

Object GLAInfantryTunnelDefender
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object GLAInfantryAngryMobNexus 
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

  Locomotor = SET_NORMAL AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_WANDER AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_PANIC AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!

;  Locomotor = SET_NORMAL WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_WANDER WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_PANIC WanderHumanLocomotor ;Important! don't make the Nexus any faster!
End
End


Object Demo_GLATankScorpion
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 100
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL ScorpionLocomotor
End
End

Object Demo_GLAVehicleRocketBuggy
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 90
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RocketBuggyLocomotor
End
End

Object Demo_GLAVehicleToxinTruck
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    Turret
      TurretTurnRate            = 180
      TurretPitchRate           = 180
      AllowsPitch               = Yes
      MinPhysicalPitch          = -20 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      TurretFireAngleSweep      = PRIMARY 8
      TurretSweepSpeedModifier  = PRIMARY 0.5    ; Sweep slower than you turn
      ControlledWeaponSlots     = PRIMARY
    End
  End
  Locomotor             = SET_NORMAL ToxinTruckLocomotor
End
End

   Object Demo_GLAVehicleTechnicalChassisOne
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object Demo_GLAVehicleTechnicalChassisTwo
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object Demo_GLAVehicleTechnicalChassisThree
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End


   Object  Demo_GLATankMarauder
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MarauderLocomotor
End
End

   Object  Demo_GLAInfantryRebel
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End

Object Demo_GLAInfantryTunnelDefender
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object Demo_GLAInfantryAngryMobNexus 
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

  Locomotor = SET_NORMAL AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_WANDER AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_PANIC AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!

;  Locomotor = SET_NORMAL WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_WANDER WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_PANIC WanderHumanLocomotor ;Important! don't make the Nexus any faster!
End
End


Object Chem_GLATankScorpion
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 100
      RecenterTime = 5000   ; how long to wait during idle before recentering
      ControlledWeaponSlots = PRIMARY SECONDARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL ScorpionLocomotor
End
End


Object Chem_GLAVehicleToxinTruck
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    Turret
      TurretTurnRate            = 180
      TurretPitchRate           = 180
      AllowsPitch               = Yes
      MinPhysicalPitch          = -20 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      TurretFireAngleSweep      = PRIMARY 8
      TurretSweepSpeedModifier  = PRIMARY 0.5    ; Sweep slower than you turn
      ControlledWeaponSlots     = PRIMARY
    End
  End
  Locomotor             = SET_NORMAL ToxinTruckLocomotor
End
End



   Object Chem_GLAVehicleTechnicalChassisOne
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object Chem_GLAVehicleTechnicalChassisTwo
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object Chem_GLAVehicleTechnicalChassisThree
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End


   Object  Chem_GLATankMarauder
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MarauderLocomotor
End
End




   Object  Chem_GLAInfantryRebel
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End

Object Chem_GLAInfantryTunnelDefender
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object Chem_GLAInfantryAngryMobNexus 
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

  Locomotor = SET_NORMAL AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_WANDER AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_PANIC AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!

;  Locomotor = SET_NORMAL WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_WANDER WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_PANIC WanderHumanLocomotor ;Important! don't make the Nexus any faster!

End
End


Object Slth_GLAVehicleRocketBuggy
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    Turret
      TurretTurnRate = 90
      ControlledWeaponSlots = PRIMARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL RocketBuggyLocomotor
End
End

Object Slth_GLAVehicleToxinTruck
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
    Turret
      TurretTurnRate            = 180
      TurretPitchRate           = 180
      AllowsPitch               = Yes
      MinPhysicalPitch          = -20 ; If allows pitch, the lowest I can dip down to shoot.  defaults to 0 (horizontal)
      TurretFireAngleSweep      = PRIMARY 8
      TurretSweepSpeedModifier  = PRIMARY 0.5    ; Sweep slower than you turn
      ControlledWeaponSlots     = PRIMARY
    End
  End
  Locomotor             = SET_NORMAL ToxinTruckLocomotor
End
End



   Object Slth_GLAVehicleTechnicalChassisOne
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object Slth_GLAVehicleTechnicalChassisTwo
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End

   Object Slth_GLAVehicleTechnicalChassisThree
ReplaceModule ModuleTag_05
  Behavior = AIUpdateInterface ModuleTag_05_Override
    Turret
      TurretTurnRate = 240       ; turn rate, in degrees per sec
      NaturalTurretAngle = 0
      MinIdleScanAngle = 30      ; in degrees off the natural turret angle
      MaxIdleScanAngle = 60      ; in degrees off the natural turret angle
      MinIdleScanInterval = 5000 ; in milliseconds
      MaxIdleScanInterval = 10000 ; in milliseconds
      ControlledWeaponSlots = PRIMARY SECONDARY TERTIARY
    End
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL TechnicalLocomotor
End
End


   Object  Slth_GLAInfantryRebel
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL BasicHumanLocomotor
End
End

Object Slth_GLAInfantryTunnelDefender
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End
  Locomotor = SET_NORMAL MissileDefenderLocomotor
End
End

Object Slth_GLAInfantryAngryMobNexus 
ReplaceModule ModuleTag_03
  Behavior = AIUpdateInterface ModuleTag_03_Override
    AutoAcquireEnemiesWhenIdle = Yes Stealthed
  End

  Locomotor = SET_NORMAL AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_WANDER AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!
  Locomotor = SET_PANIC AngryMobNexusLocomotor ;Important! don't make the Nexus any faster!

;  Locomotor = SET_NORMAL WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_WANDER WanderHumanLocomotor ;Important! don't make the Nexus any faster!
;  Locomotor = SET_PANIC WanderHumanLocomotor ;Important! don't make the Nexus any faster!
End
End


CommandSet AirF_AmericaAirfieldCommandSet_New
  1 = AirF_Command_ConstructAmericaJetRaptor
  2 = AirF_Command_ConstructAmericaVehicleComanche
  3 = AirF_Command_ConstructAmericaJetAurora
  4 = AirF_Command_ConstructAmericaJetStealthFighter
  5 = Command_ConstructAmericaJetRaptor
  7 = Command_UpgradeComancheRocketPods
  8 = AirF_Command_UpgradeAmericaLaserMissiles
  9 = Command_UpgradeAmericaCountermeasures
 10 = Command_UpgradeAmericaBunkerBusters
 11 = AirF_Command_UpgradeStealthComanche
 13 = Command_SetRallyPoint
 14 = Command_Sell 
End

Object AirF_AmericaAirfield
CommandSet AirF_AmericaAirfieldCommandSet_New
End

Object AmericaJetRaptor
  Prerequisites
End
End

Object AmericaVehicleHumvee
CommandSet AmericaVehicleHumveeCommandSet_New
End

CommandSet AmericaVehicleHumveeCommandSet_New
  1 = Command_ConstructAmericaVehicleBattleDrone
  2 = Command_ConstructAmericaVehicleHellfireDrone
  4 = Command_TransportExit
  5 = Command_TransportExit
  6 = Command_TransportExit
  7 = Command_TransportExit
  8 = Command_TransportExit
  9 = Command_Evacuate 
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AmericaTankCrusader
CommandSet AmericaTankCrusaderCommandSet_New
End

CommandSet AmericaTankCrusaderCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End


Object AmericaTankPaladin
CommandSet AmericaTankPaladinCommandSet_New
End

CommandSet AmericaTankPaladinCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AmericaTankMicrowave
CommandSet AmericaTankMicrowaveCommandSet_New
End

CommandSet AmericaTankMicrowaveCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove  
  13 = Command_Guard
  14 = Command_Stop
End

Object AmericaTankAvenger
CommandSet AmericaTankAvengerCommandSet_New
End

CommandSet AmericaTankAvengerCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AmericaVehicleMedic
CommandSet AmericaVehicleAmbulanceCommandSet_New
End

CommandSet AmericaVehicleAmbulanceCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  4  = Command_TransportExit
  5  = Command_TransportExit
  6  = Command_TransportExit
  7  = Command_TransportExit
  8  = Command_Evacuate 
  10 = Command_AmbulanceCleanupArea
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AmericaVehicleTomahawk
CommandSet AmericaVehicleTomahawkCommandSet_New
End

CommandSet AmericaVehicleTomahawkCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End


Object AirF_AmericaVehicleHumvee
CommandSet AmericaVehicleHumveeCommandSet_New
End

CommandSet AmericaVehicleHumveeCommandSet_New
  1 = Command_ConstructAmericaVehicleBattleDrone
  2 = Command_ConstructAmericaVehicleHellfireDrone
  4 = Command_TransportExit
  5 = Command_TransportExit
  6 = Command_TransportExit
  7 = Command_TransportExit
  8 = Command_TransportExit
  9 = Command_Evacuate 
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AirF_AmericaTankMicrowave
CommandSet AmericaTankMicrowaveCommandSet_New
End

CommandSet AmericaTankMicrowaveCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove  
  13 = Command_Guard
  14 = Command_Stop
End

Object AirF_AmericaTankAvenger
CommandSet AmericaTankAvengerCommandSet_New
End

CommandSet AmericaTankAvengerCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AirF_AmericaVehicleMedic
CommandSet AmericaVehicleAmbulanceCommandSet_New
End

CommandSet AmericaVehicleAmbulanceCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  4  = Command_TransportExit
  5  = Command_TransportExit
  6  = Command_TransportExit
  7  = Command_TransportExit
  8  = Command_Evacuate 
  10 = Command_AmbulanceCleanupArea
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object AirF_AmericaVehicleTomahawk
CommandSet AmericaVehicleTomahawkCommandSet_New
End

CommandSet AmericaVehicleTomahawkCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End


Object Lazr_AmericaVehicleHumvee
CommandSet AmericaVehicleHumveeCommandSet_New
End

CommandSet AmericaVehicleHumveeCommandSet_New
  1 = Command_ConstructAmericaVehicleBattleDrone
  2 = Command_ConstructAmericaVehicleHellfireDrone
  4 = Command_TransportExit
  5 = Command_TransportExit
  6 = Command_TransportExit
  7 = Command_TransportExit
  8 = Command_TransportExit
  9 = Command_Evacuate 
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object Lazr_AmericaTankCrusader
CommandSet AmericaTankCrusaderCommandSet_New
End

CommandSet AmericaTankCrusaderCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End


Object Lazr_AmericaTankMicrowave
CommandSet AmericaTankMicrowaveCommandSet_New
End

CommandSet AmericaTankMicrowaveCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove  
  13 = Command_Guard
  14 = Command_Stop
End

Object Lazr_AmericaTankAvenger
CommandSet AmericaTankAvengerCommandSet_New
End

CommandSet AmericaTankAvengerCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object Lazr_AmericaVehicleMedic
CommandSet AmericaVehicleAmbulanceCommandSet_New
End

CommandSet AmericaVehicleAmbulanceCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  4  = Command_TransportExit
  5  = Command_TransportExit
  6  = Command_TransportExit
  7  = Command_TransportExit
  8  = Command_Evacuate 
  10 = Command_AmbulanceCleanupArea
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End


Object SupW_AmericaVehicleHumvee
CommandSet AmericaVehicleHumveeCommandSet_New
End

CommandSet AmericaVehicleHumveeCommandSet_New
  1 = Command_ConstructAmericaVehicleBattleDrone
  2 = Command_ConstructAmericaVehicleHellfireDrone
  4 = Command_TransportExit
  5 = Command_TransportExit
  6 = Command_TransportExit
  7 = Command_TransportExit
  8 = Command_TransportExit
  9 = Command_Evacuate 
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object SupW_AmericaTankMicrowave
CommandSet AmericaTankMicrowaveCommandSet_New
End

CommandSet AmericaTankMicrowaveCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove  
  13 = Command_Guard
  14 = Command_Stop
End

Object SupW_AmericaTankAvenger
CommandSet AmericaTankAvengerCommandSet_New
End

CommandSet AmericaTankAvengerCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object SupW_AmericaVehicleMedic
CommandSet AmericaVehicleAmbulanceCommandSet_New
End

CommandSet AmericaVehicleAmbulanceCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  4  = Command_TransportExit
  5  = Command_TransportExit
  6  = Command_TransportExit
  7  = Command_TransportExit
  8  = Command_Evacuate 
  10 = Command_AmbulanceCleanupArea
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object SupW_AmericaVehicleTomahawk
CommandSet AmericaVehicleTomahawkCommandSet_New
End

CommandSet AmericaVehicleTomahawkCommandSet_New
  1  = Command_ConstructAmericaVehicleBattleDrone
  2  = Command_ConstructAmericaVehicleHellfireDrone
  11 = Command_AttackMove
  13 = Command_Guard
  14 = Command_Stop
End

Object Slth_GLAInfantryWorker
CommandSet Slth_GLAWorkerCommandSet_New
End

CommandSet Slth_GLAWorkerCommandSet_New
  1  = GC_Slth_Command_ConstructGLASupplyStash
  2  = GC_Slth_Command_ConstructGLAPalace
  3  = GC_Slth_Command_ConstructGLABarracks
  4  = GC_Slth_Command_ConstructGLABlackMarket
  5  = GC_Slth_Command_ConstructGLAStingerSite
  6  = GC_Slth_Command_ConstructGLAScudStorm
  7  = GC_Slth_Command_ConstructGLATunnelNetwork
  8  = GC_Slth_Command_ConstructGLADemoTrap
  9  = GC_Slth_Command_ConstructGLAArmsDealer
 10  = GC_Slth_Command_ConstructGLACommandCenter
 11  = Nuke_Command_ConstructChinaPowerPlant
 14  = Command_DisarmMinesAtPosition
End

Object Nuke_ChinaPowerPlant
  Prerequisites
End
End
