NAME	 	= "Camera AI Director"
VERSION		= "1.0"
TYPE		= "DISABLED"--"GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "This is an example gamemode template"
AUTHOR 		= "Mjstral"

ExecuteAction("SHOW_MILITARY_CAPTION", "This is an empty example gamemode", 300)


ExecuteAction("CAMERA_ADD_SHAKER_AT",...)
ExecuteAction("CAMERA_BLOOM_EFFECT_BEGIN",...)
ExecuteAction("CAMERA_BLOOM_EFFECT_END",...)
ExecuteAction("CAMERA_DISABLE_SLAVE_MODE",...)
ExecuteAction("CAMERA_ENABLE_SLAVE_MODE",...)
ExecuteAction("CAMERA_FADE_ADD",...)
ExecuteAction("CAMERA_FADE_MULTIPLY",...)
ExecuteAction("CAMERA_FADE_SATURATE",...)
ExecuteAction("CAMERA_FADE_SUBTRACT",...)
ExecuteAction("CAMERA_FOLLOW_NAMED",...)
ExecuteAction("CAMERA_LETTERBOX_BEGIN",...)
ExecuteAction("CAMERA_LETTERBOX_END",...)
ExecuteAction("CAMERA_LOOK_TOWARD_OBJECT",...)
ExecuteAction("CAMERA_LOOK_TOWARD_WAYPOINT",...)
ExecuteAction("CAMERA_MOD_FINAL_LOOK_TOWARD",...)
ExecuteAction("CAMERA_MOD_FREEZE_ANGLE",...)
ExecuteAction("CAMERA_MOD_FREEZE_TIME",...)
ExecuteAction("CAMERA_MOD_LOOK_TOWARD",...)
ExecuteAction("CAMERA_MOD_SET_FINAL_PITCH",...)
ExecuteAction("CAMERA_MOD_SET_FINAL_SPEED_MULTIPLIER",...)
ExecuteAction("CAMERA_MOD_SET_FINAL_ZOOM",...)
ExecuteAction("CAMERA_MOD_SET_ROLLING_AVERAGE",...)
ExecuteAction("CAMERA_MOVE_HOME",...)
ExecuteAction("CAMERA_REMOVE_AREA_RESTRICTION",...)
ExecuteAction("CAMERA_RESTRICT_TO_AREA",...)
ExecuteAction("CAMERA_SET_AUDIBLE_DISTANCE",...)
ExecuteAction("CAMERA_SET_DEFAULT",...)
ExecuteAction("CAMERA_STOP_FOLLOW",...)
ExecuteAction("CAMERA_STOP_TETHER_NAMED",...)
ExecuteAction("CAMERA_TETHER_NAMED",...)
ExecuteAction("FOCAL_LENGTH_CAMERA",...)
ExecuteAction("LOCK_CAMERA",...)
ExecuteAction("LOCK_CAMERA_ANGLE_AND_HEIGHT",...)
ExecuteAction("LOCK_CAMERA_RESET",...)
ExecuteAction("LOCK_CAMERA_ROTATION",...)
ExecuteAction("LOCK_CAMERA_SCROLL",...)
ExecuteAction("LOCK_CAMERA_ZOOM",...)
ExecuteAction("MOVE_CAMERA_ALONG_SPLINE_PATH",...)
ExecuteAction("MOVE_CAMERA_BY_ANIMATION",...)
ExecuteAction("MOVE_CAMERA_LOCATOR_ALONG_SPLINE_PATH",...)
ExecuteAction("MOVE_CAMERA_TO",...)
ExecuteAction("MOVE_CAMERA_TO_NAMED",...)
ExecuteAction("MOVE_CAMERA_TO_SELECTION",...)
ExecuteAction("NAMED_SET_CAMERA_FADING",...)
ExecuteAction("PITCH_CAMERA",...)
ExecuteAction("RESET_CAMERA",...)
ExecuteAction("RESET_CAMERA_TUTORIAL_STATE",...)
ExecuteAction("ROLL_CAMERA",...)
ExecuteAction("ROTATE_CAMERA",...)
ExecuteAction("ROTATE_CAMERA_LOCKED",...)
ExecuteAction("ROTATE_CAMERA_TO_ANGLE",...)
ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER",...)
ExecuteAction("SETUP_CAMERA",...)
ExecuteAction("ZOOM_CAMERA",...)


function SpawnObjectTypeOnNamedObject(ObjectType, Object, OverwriteTeam)
	if OverwriteTeam == nil then OverwriteTeam=GetTeamName(Object) end
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", Object, 84, 1)
	local ObjectTypeDestination = GetObj.Type(GetObj.Table(Object))
	local ObjectDestTeam = GetTeamName(Object)
	local ObjectList = {}
	local TempObjectRef
	repeat
		TempObjectRef=RandomString(5)
		ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", ObjectTypeDestination, ObjectDestTeam, TempObjectRef)
		if EvaluateCondition("NAMED_NOT_DESTROYED", TempObjectRef) then 
			tinsert(ObjectList, {["ref"]=TempObjectRef, ["team"]=ObjectDestTeam, ["type"]=ObjectType})
			if EvaluateCondition("UNIT_HAS_OBJECT_STATUS", TempObjectRef, 84) then
				TempObjectRef=RandomString(5)
				if GAME_ACTIVE == "BFME2_ROTWK_2.02" then
					ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE", TempObjectRef, ObjectType, ObjectDestTeam, ObjectTypeDestination) 
				else
					ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", TempObjectRef, ObjectType, ObjectDestTeam, ObjectTypeDestination, 0) 				
				end
				ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", TempObjectRef, 84, 0)
				ExecuteAction("UNIT_SET_TEAM", TempObjectRef, ObjectType, Object, OverwriteTeam)
				break
			else
				ExecuteAction("UNIT_SET_TEAM", TempObjectRef, NeutralTeam)
			end
		end
	until(not EvaluateCondition("NAMED_NOT_DESTROYED", TempObjectRef) or EvaluateCondition("UNIT_HAS_OBJECT_STATUS", TempObjectRef, 84))
	for j=1,getn(ObjectList),1 do
		ExecuteAction("UNIT_SET_TEAM", ObjectList[j].ref, ObjectList[j].team)
	end
end

function SpawnObjectTypeOnNamedObjectSlow(ObjectType, Object, OverwriteTeam)
	local ObjectPosition = GetObjectPosition(Object)
	local TempObjectRef = RandomString(5)
	SpawnAtPosition("MenPorter",NeutralTeam,ObjectPosition.x,ObjectPosition.y)
	local EndSpawn = function()
		if GAME_ACTIVE == "BFME2_ROTWK_2.02" then
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE", %TempObjectRef, %ObjectType, %ObjectDestTeam, %ObjectTypeDestination) 
		else
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", %TempObjectRef, %ObjectType, %ObjectDestTeam, %ObjectTypeDestination, 0) 				
		end
		pop()
	end
	push(EndSpawn)
	return TempObjectRef
end

function SpawnObjectTypeOnNamedObject(ObjectType, Object, OverwriteTeam)
	if OverwriteTeam == nil then OverwriteTeam=GetTeamName(Object) end
	ExecuteAction("UNIT_SET_TEAM", Object, NeutralTeam)
	local ObjectTypeDestination = GetObj.Type(GetObj.Table(Object))
	local TempObjectRef = RandomString(5)
	if GAME_ACTIVE == "BFME2_ROTWK_2.02" then
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE", TempObjectRef, ObjectType, NeutralTeam, ObjectTypeDestination) 
	else
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", TempObjectRef, ObjectType, NeutralTeam, ObjectTypeDestination, 0) 				
	end
	ExecuteAction("UNIT_SET_TEAM", TempObjectRef, OverwriteTeam)	
end



--SpawnObjectTypeOnNamedObject("MenPorter", master)
--master = spawn("MenPorter",GetTeamName(object1))

function SpawnObjectTypeOnNamedObject2(ObjectType, Object, OverwriteTeam)
	local ObjectReferecneListHero = GetObjectReferenceListForObjectTypes({GetObj.Type(Object)})	
	local TempObjectRef = RandomString(5)
	SpawnAtPosition("MenPorter",NeutralTeam,MapSize.x/2,MapSize.y/2,0,nil,nil,nil,nil,nil,SetupCamera)
	local EndSpawn = function()
		if GAME_ACTIVE == "BFME2_ROTWK_2.02" then
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE", TempObjectRef, ObjectType, ObjectDestTeam, ObjectTypeDestination) 
		else
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION", TempObjectRef, ObjectType, ObjectDestTeam, ObjectTypeDestination, 0) 				
		end
	end
	return TempObjectRef
end

function GetWaypointTable()
	local WaypointTable_ = WaypointTable
	local WaypointTableTemp = {}
	local TRef = ""
	for i=1,getn(WaypointTable_),1 do
		TRef = RandomString(5)
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT",TRef,"MenPorter",NeutralTeam,WaypointTable_[i])
		if type(GetObj.Table(TRef))=="table" then tinsert(WaypointTableTemp,WaypointTable_[i]) end
	end
	WaypointTable=WaypointTableTemp
	return WaypointTableTemp
end

-----------------------------------------------------------------------------------
-----------------CINEMA MODE------------------------------------------------------
-----------------------------------------------------------------------------------

CinemaMode = {}
function StartCinemaMode2()
	CinemaMode.TimeScale = 30
	CinemaMode.WaypointTable = GetWaypointTable()
	CinemaMode.CurrentWaypoint = CinemaMode.WaypointTable[1]
	local NextCameraMovement = function ()
		print(CinemaMode.CurrentWaypoint)
		ExecuteAction("CAMERA_LOOK_TOWARD_WAYPOINT", CinemaMode.CurrentWaypoint, 1, 1, 1, 1)
		ExecuteAction("ZOOM_CAMERA", 0.6 , 1, 1, 1)
		ExecuteAction("PITCH_CAMERA", 0.35, 1, 1, 1)
		ExecuteAction("RESET_CAMERA", CinemaMode.CurrentWaypoint, CinemaMode.TimeScale, 1, 1)
		CinemaMode.CurrentWaypoint=NextTableElement(CinemaMode.WaypointTable,CinemaMode.CurrentWaypoint)		
	end
	NextCameraMovement()
	SetScriptTimer(CinemaMode.TimeScale*5, NextCameraMovement, 1)
end

function CameraTopDownCenterViewRotation()
	local SetupCamera = function(ObjRef)
		ExecuteAction("OBJECT_FORCE_SELECT", NeutralTeam, "GenericDummy", "1", "placeholder")
		ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
		ExecuteAction("ZOOM_CAMERA", max(MapSize.x,MapSize.y)/240 , 1, 1, 1)
		ExecuteAction("PITCH_CAMERA", 500, 1, 1, 1)
		local RotationTimes = 1
		ExecuteAction("ROTATE_CAMERA", RotationTimes, 50, 1, 1)
	end
	SpawnAtPosition("MenPorter",NeutralTeam,MapSize.x/2,MapSize.y/2,0,nil,nil,nil,nil,nil,SetupCamera)	
end

function CameraTopDownCenterView()
	local SetupCamera = function(ObjRef)
		ExecuteAction("OBJECT_FORCE_SELECT", NeutralTeam, "GenericDummy", "1", "placeholder")
		ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
		ExecuteAction("ZOOM_CAMERA", max(MapSize.x,MapSize.y)/500 , 1, 1, 1)
		ExecuteAction("PITCH_CAMERA", 500, 1, 1, 1)
		local RotationTimes = 1
		ExecuteAction("ROTATE_CAMERA", RotationTimes, 50, 1, 1)
	end
	SpawnAtPosition("MenPorter",NeutralTeam,MapSize.x/2,MapSize.y/2,0,nil,nil,nil,nil,nil,SetupCamera)	
end

function CameraCenterPitchedRotation()
	local SetupCamera = function(ObjRef)
		ExecuteAction("OBJECT_FORCE_SELECT", NeutralTeam, "GenericDummy", "1", "placeholder")
		ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
		ExecuteAction("ZOOM_CAMERA", max(MapSize.x,MapSize.y)/2000 , 1, 1, 1)
		ExecuteAction("PITCH_CAMERA", 0.8, 1, 1, 1)
		local RotationTimes = 1
		ExecuteAction("ROTATE_CAMERA", RotationTimes, 50, 1, 1)
	end
	SpawnAtPosition("GenericDummy",NeutralTeam,MapSize.x/2,MapSize.y/2,0,nil,nil,nil,nil,nil,SetupCamera)	
end

function FollowHero()
	local ObjectReferecneListHero = GetObjectReferenceListForObjectTypes(OBJECT_TYPE_LIST_HERO)
	local ObjRef = ObjectReferecneListHero[random(getn(ObjectReferecneListHero))]
	if getn(ObjectReferecneListHero) > 0 then 
		ExecuteAction("CAMERA_FOLLOW_NAMED", ObjRef, 0, 70)
		ExecuteAction("PITCH_CAMERA", 0.5, 1, 1, 1)
		StartDynamicCameraAngleAdjustment(ObjRef, 15)
	end
end

function GetObjectReferenceListForObjectTypes(ObjectTypeList)
	local RefList = {}
	local ObjRef = ""
	local TempObjRefTable = {}
	for i=1,getn(GlobalTeamTable),1 do
		for j=1,getn(ObjectTypeList),1 do
			repeat
				ObjRef=RandomString(5)
				ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE",ObjectTypeList[j],GlobalTeamTable[i],ObjRef)
				if EvaluateCondition("NAMED_NOT_DESTROYED",ObjRef) then
					tinsert(RefList,ObjRef)
					tinsert(TempObjRefTable,ObjRef)
					ExecuteAction("UNIT_SET_TEAM",ObjRef,NeutralTeam) 	
				end
			until(not EvaluateCondition("NAMED_NOT_DESTROYED",ObjRef))
		end
		for i=1,getn(TempObjRefTable),1 do
			ExecuteAction("UNIT_SET_TEAM",TempObjRefTable[i],GlobalTeamTable[i])
		end	
		TempObjRefTable = {}
	end
	return RefList
end

function MoveCameraToPosition(x,y)
	local CameraEndPositionDummy = SpawnAtPosition("GenericDummy",NeutralTeam,x,y)
	local CameraFollow = function()
		local CameraFollowDummy = spawn("CameraAnchor",NeutralTeam)
		ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
		ExecuteAction("CAMERA_FOLLOW_NAMED", CameraFollowDummy, 0, 100)
		ExecuteAction("PITCH_CAMERA", 0.25, 1, 1, 1)
		ExecuteAction("ROTATE_CAMERA", 1, 50, 1, 1)
		ExecuteAction("UNIT_GUARD_OBJECT",CameraFollowDummy,%CameraEndPositionDummy)
		StartDynamicCameraAngleAdjustment(CameraFollowDummy, 10000)
		pop()
	end	
	push(CameraFollow)
end

function StartCinemaMode()
	CinemaMode.TimeScale = 30

	CinemaMode.CameraAnchor = spawn("CameraAnchor",NeutralTeam)
	ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
	ExecuteAction("CAMERA_FOLLOW_NAMED", CinemaMode.CameraAnchor, 0, 100)
	ExecuteAction("PITCH_CAMERA", 0.25, 1, 1, 1)
	local NextCameraMovement = function ()
		local CameraEndPositionDummy = SpawnAtPosition("GenericDummy",NeutralTeam,random(MapSize.x),random(MapSize.y))
		local Move = function() 
			ExecuteAction("UNIT_GUARD_OBJECT",CinemaMode.CameraAnchor,%CameraEndPositionDummy) 
			ExecuteAction("ROTATE_CAMERA", 1, 50, 1, 1)
			pop() 
		end
		push(Move)
	end
	NextCameraMovement()
	SetScriptTimer(CinemaMode.TimeScale*2, NextCameraMovement, 10)
end

	spawn("MapRevealer",GetTeamName(object1))
CameraCenterPitchedRotation()
		
--		
		

--CameraTopDownCenterViewRotation()
--CameraTopDownCenterViewRotation()


--,0,nil,nil,nil,nil,nil,CameraFollow



--
		ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
ExecuteAction("CAMERA_FOLLOW_NAMED", master, 0, 5000)
--master = spawn("MenPorter",GetTeamName(object1))
--master = SpawnAtPosition("MenPorter",NeutralTeam,MapSize.x/2,MapSize.y/2,0,nil,nil,nil,nil,nil,SetupCamera)	
--


	ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
	ExecuteAction("ZOOM_CAMERA", max(MapSize.x,MapSize.y)/240 , 1, 1, 1)
	ExecuteAction("PITCH_CAMERA", 500, 1, 1, 1)
		ExecuteAction("ROTATE_CAMERA", 1, 50, 1, 1)
--ExecuteAction("OBJECT_FORCE_SELECT", GetTeamName(object1), "MenPorter", "1", "placeholder")

--StartCinemaMode()
--CinemaMode.WaypointTable = GetWaypointTable()
--		ExecuteAction("HIDE_UI")

--
ExecuteAction("CAMERA_ENABLE_SLAVE_MODE")
ExecuteAction("MOVE_CAMERA_BY_ANIMATION", CameraAnimation)
ExecuteAction("MOVE_CAMERA_TO_SELECTION")
ExecuteAction("CAMERA_LOOK_TOWARD_WAYPOINT", WaypointName, RealNumber, RealNumber, RealNumber, Boolean)

ExecuteAction("CAMERA_FOLLOW_NAMED", UnitName, Boolean, RealNumber)
ExecuteAction("RESET_CAMERA", WaypointName, RealNumber, RealNumber, RealNumber)

--"MOVE_CAMERA_TO_NAMED"
ExecuteAction("CAMERA_LOOK_TOWARD_OBJECT", UnitName, RealNumber, RealNumber, RealNumber, RealNumber, RealNumber)













--ExecuteAction("CREATE_REINFORCEMENT_TEAM", GlobalTeamTable[1], "Player_1_Start")


--SpawnObjectTypeOnObject("MenPorter", master)
--master = spawn("MenPorter",GetTeamName(object1))

--SetScriptTimerFast(1,"print('hello')")






--NeutralTeam="/team"  --or "team"
--CivilianTeam="PlyrCivilian/teamPlyrCivilian"
--NeutralTeam=CivilianTeam
--SetScriptTimer(1,"print('hi')")

--print("yes")


--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", random(9999), "ScriptTimerFast", "/team", "((0.00,0.00,0.00))", 0)

--out(ObjectTemplateName(GetObj.Table(master)))
--master = spawn("MenPorter")

--SpawnInvincibleCustomHero()


--SpawnSuperAngmarShadeWolf()
--GameModeEnum

-- todo reset specialpower timer of selected unit option
-- EvaluateCondition("IS_GAME_MODE_ACTIVE", "ringheroes") as metamod toggle ? 
-- spawn team also creeps
-- spawn kind of confliciting objects to see
-- spawner Option - spawn on object type
----BFMEII ROTWK TEMPCHANGE

