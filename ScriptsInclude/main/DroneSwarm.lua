NAME	 	= "Drone Swarm"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = ""
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

------------------------------------------------------------------
----------------------SCRIPT SECTION------------------------------
------------------------------------------------------------------

GAMEMODE = "DRONESWARM"

ExecuteAction("SHOW_MILITARY_CAPTION", "APT:Hero", 10) --GUI:versus
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

Drones = { "AlienInvaderFighter", "GDIRepairDrone", "NodRepairDrone", "AlienRepairDrone" }
UtilityObjects = {"GDINukeSeed", "GDIMine", "MarkedOfKaneMagneticMine", "NODExplosiveCharge", "HealCrateMP", "MoneyCrateMP", "VeterancyCrateMP", "NODTechBuildingBoobyTrap"}

DroneControllerUnit = "NODVenom"
DRONE_NUMBER_ATTACKER = 500
DRONE_NUMBER_GUARDS = 0
DRONE_ATTACK_DISTANCE = 200

DRONE_SUBGROUP_SIZE = 3

function DroneFollowCoroutine_CHAIN()
	for i=1,getn(DroneListAttacker),1 do
		if i == 1 then
			ExecuteAction("UNIT_GUARD_OBJECT", DroneListAttacker[i], DroneController)
		else
			ExecuteAction("UNIT_GUARD_OBJECT", DroneListAttacker[i], DroneListAttacker[i-1])		
		end
	end
end

function GetNearestEnemy(self)
	NearestEnemy = nil
	Distance = 15000
	NextDistance = 0
	TeamSelf = GetTeamName(self)
	for ObjectIndex,Object in globals() do
		if strfind(ObjectIndex, "ObjID")
		and Object ~= self 
		and GetTeamName(Object) 
		and PartOf(Players, GetPlayerByTeam(GetTeamName(Object))) or CreepsTeam == GetTeamName(Object)
		and Relation[TeamSelf][GetTeamName(Object)] == RELATION_TYPE["Enemy"] then
			local ObjectType = GetObjectType(Object)
			local ObjectName =  GetObjectStringRef(Object)
			if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", ObjectName, GetObjectStatus("NOT_IN_WORLD")) 
			and not strfind(ObjectDescription(Object),"PlayerSpellBook")
			and not strfind(ObjectType,"Debris")
			and not strfind(ObjectType,"Projectile")
			and not strfind(ObjectType,"Husk")
			and not strfind(ObjectType,"Missile")
			and not strfind(ObjectType,"Drone")
			and not strfind(ObjectType,"Turret")
			and not EvaluateCondition("NAMED_DESTROYED", ObjectName) 
			then
				NextDistance = ObjectGetDistance(self, Object)
				if NextDistance <= Distance then
					Distance = NextDistance
					NearestEnemy = Object
				end
			end
		end
	end
	if not NearestEnemy then 
		return nil
	else
		return GetObjectStringRef(NearestEnemy), Distance
	end
end

function DroneFollowCoroutine()
	if EvaluateCondition("NAMED_NOT_DESTROYED", DroneController) then
		DroneFormationOrder(DroneListGuard, DroneListGuardLinking)
		if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", DroneListAttacker[1], GetObjectStatus("IS_ATTACKING")) then
			if ObjectCountNearbyEnemies(DroneControllerLuaRef, DRONE_ATTACK_DISTANCE) > 0 then
				NearestEnemy, Distance = GetNearestEnemy(DroneControllerLuaRef)
				if NearestEnemy then
					if Distance <= DRONE_ATTACK_DISTANCE then
						ExecuteAction("NAMED_FLASH", NearestEnemy, 3)
						--print(GetObjectInfo(GetObjectLuaRef(NearestEnemy)))					
						for i=1,getn(DroneListAttacker),1 do
							ExecuteAction("NAMED_ATTACK_NAMED", DroneListAttacker[i], NearestEnemy)
						end
					end
				end
			else
				DroneFormationOrder(DroneListAttacker, DroneListAttackerLinking)
			end
		end
	else
		DeleteScriptTimerAction(DroneFollowCoroutine)
	end
end

function DroneFollowCoroutine2()
	if EvaluateCondition("NAMED_NOT_DESTROYED", DroneController) then
		DroneFormationOrder(DroneListGuard, DroneListGuardLinking)
		if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", DroneListAttacker[1], GetObjectStatus("IS_ATTACKING")) then
			if ObjectCountNearbyEnemies(DroneControllerLuaRef, DRONE_ATTACK_DISTANCE) > 0 then
				PlayerSelf = GetPlayerByTeam(GetTeamName(DroneController))
				for i=1,getn(Players),1 do
					if Players[i] ~= PlayerSelf 
					and Relation[PlayerSelf][Players[i]] == RELATION_TYPE["Enemy"] 
					and EvaluateCondition("PLAYER_HAS_NUMBER_UNITS_DISTANCE_FROM_OBJECT", Players[i], CompareTable[">="], 1, DRONE_ATTACK_DISTANCE, DroneController) 
					then
						local TeamToAttack = GetTeamByPlayer(Players[i])
						for j=1,getn(DroneListAttacker),1 do
							ExecuteAction("NAMED_ATTACK_TEAM", DroneListAttacker[j], TeamToAttack)
						end
						return
					end
				end
			else
				DroneFormationOrder(DroneListAttacker, DroneListAttackerLinking)
			end
		end
	else
		DeleteScriptTimerAction(DroneFollowCoroutine)
	end
end

function DroneFollowCoroutineDemo() --CreepsTeam
	if EvaluateCondition("NAMED_NOT_DESTROYED", DroneController) then
		if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", DroneListAttacker[1], GetObjectStatus("IS_ATTACKING")) then
			if ObjectCountNearbyEnemies(DroneControllerLuaRef, DRONE_ATTACK_DISTANCE) > 0 then
				if EvaluateCondition("PLAYER_HAS_NUMBER_UNITS_DISTANCE_FROM_OBJECT", CreepsPlayer, CompareTable[">="], 1, DRONE_ATTACK_DISTANCE, DroneController) then
					for j=1,getn(DroneListAttacker),1 do
						ExecuteAction("NAMED_ATTACK_TEAM", DroneListAttacker[j], CreepsTeam)
					end
					return
				end
			else
				DroneFormationOrder(DroneListAttacker, DroneListAttackerLinking)
			end
		end
	else
		DeleteScriptTimerAction(DroneFollowCoroutine)
	end
end

function SetDroneFormationLinking(DroneList, DroneListLinking)
	local RootIndex = 1
	local TreeLevelSum = {}
	local SubGroupCounter = 1
	local TreeLevel = 1
	TreeLevelSum[-1] = 0
	TreeLevelSum[0] = 1
	DroneListLinking[1] = DroneController
	for i=1,15,1 do
		TreeLevelSum[i] = TreeLevelSum[i-1] + DRONE_SUBGROUP_SIZE^i
	end
	for i=2,getn(DroneList),1 do
		--NEW TREE LEVEL
		if i-TreeLevelSum[TreeLevel-1] == 1 then
			TreeLevelSum[TreeLevel] = TreeLevelSum[TreeLevel-1] + DRONE_SUBGROUP_SIZE^TreeLevel
			SubGroupCounter = 1
		end
		--GET INDEX OF ROOT NODE
		if SubGroupCounter >= DRONE_SUBGROUP_SIZE then
			SubGroupCounter = 1
		end
		RootIndex = TreeLevelSum[TreeLevel-2] + ceil((i-TreeLevelSum[TreeLevel-1])/DRONE_SUBGROUP_SIZE)		
		SubGroupCounter = SubGroupCounter + 1
		DroneListLinking[i] = DroneList[RootIndex]
		--LAST INDEX OF CURRENT TREE LEVEL
		if i >= TreeLevelSum[TreeLevel-1] + DRONE_SUBGROUP_SIZE^TreeLevel then 
			TreeLevel = TreeLevel + 1
		end
	end
end

function DroneFormationOrder(DroneList, DroneListLinking)
	for i=1,getn(DroneListLinking),1 do
		ExecuteAction("UNIT_GUARD_OBJECT", DroneList[i], DroneListLinking[i])
	end	
end

function SpawnDrones()
	STANCE_TYPE = { ["GUARD"]=0, ["AGGRESSIVE"]=1, ["HOLD_POSITION"]=2, ["HOLD_FIRE"]=3 }	
	for i=1,DRONE_NUMBER_ATTACKER,1 do
		tinsert(DroneListAttacker, spawn(Drones[1],LocalTeam))
		--ExecuteAction("NAMED_SET_STOPPING_DISTANCE", DroneListAttacker[getn(DroneListAttacker)], 200)
		ExecuteAction("UNIT_SET_STANCE", DroneListAttacker[getn(DroneListAttacker)], STANCE_TYPE["AGGRESSIVE"])
		ExecuteAction("UNIT_AI_TRANSFER", DroneListAttacker[getn(DroneListAttacker)], 1)
		ExecuteAction("UNIT_ALLOW_AI_AUTOACQUIRE", DroneListAttacker[getn(DroneListAttacker)], 1)
	end
	for i=1,DRONE_NUMBER_GUARDS,1 do
		tinsert(DroneListGuard, spawn(Drones[3],LocalTeam))
		--ExecuteAction("NAMED_SET_STOPPING_DISTANCE", DroneListGuard[getn(DroneListGuard)], 10)
		ExecuteAction("UNIT_SET_STANCE", DroneListGuard[getn(DroneListGuard)], STANCE_TYPE["AGGRESSIVE"])
	end
end

DroneListAttacker = {}
DroneListGuard = {}

DroneListAttackerLinking = {}
DroneListGuardLinking = {}

function InitGamemode()
	DroneController = spawn(DroneControllerUnit)
	DroneControllerLuaRef = GetObjectLuaRef(DroneController)
	SpawnDrones()
	SetDroneFormationLinking(DroneListAttacker, DroneListAttackerLinking)	
	-- DroneListAttackerLinking[1] = DroneListAttacker[getn(DroneListAttacker)]
	-- DroneListAttackerLinking[getn(DroneListAttackerLinking)] = DroneListAttacker[1]	
	SetDroneFormationLinking(DroneListGuard, DroneListGuardLinking)
	SetScriptTimer(1,DroneFollowCoroutine,-1)
end

InitGamemode()