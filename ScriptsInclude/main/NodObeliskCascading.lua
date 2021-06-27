NAME	 	= "Nod Obelisk Cascading"
VERSION		= "1.0"
TYPE		= "DISABLED"
GAME		= "CNC3,CNC3KW"
DESCRIPTION = "This is an example gamemode template"
AUTHOR 		= "Mjstral"



MainTowerSupporterList= {}
MainTowerSupportConnectionList= {}

function CascadeForwarding(self) --made for "Madin" (cncnz forums)
	self=GetObj.Table(self)
	local IsObjectInSupporterList = function(object)
		for q,p in MainTowerSupporterList do  --to test if a tower already supports another tower
			if q~=tostring(%self) then
				for i=1,getn(p),1 do if p[i]==object then return true end end
			end
		end
		return false
	end	
	local MaximumSupportDistance = 13000
	local TowerAttackRange = 375 --here attack range of nod obelisk
	if ObjectCountNearbyEnemies(self,TowerAttackRange)==0 and IsObjectInSupporterList(self) then return end
	local ObjectList = {}
	local DistanceTable = {}
	local SupportConnection={}
	--create object list of all support towers
	for k,v in globals() do
		if strfind(k,"ObjID") and GetObj.Hash(self)==GetObj.Hash(v) and self~=v and ObjectTeamName(self)==ObjectTeamName(v) then
			if ObjectCountNearbyEnemies(v,TowerAttackRange)==0 and EvaluateCondition("DISTANCE_BETWEEN_OBJ", GetObj.String(self),GetObj.String(v), CompareTable["<="], MaximumSupportDistance) then
				if not IsObjectInSupporterList(v) then tinsert(ObjectList,v) end
			end
		end
	end
	tinsert(ObjectList,self)
	if getn(ObjectList)<2 then return end
	--create 2d matrix with distances
	for i=1,getn(ObjectList),1 do
		DistanceTable[tostring(ObjectList[i])]={}
	end
	for i=1,getn(ObjectList),1 do
		for j=i,getn(ObjectList),1 do
			if i==j then 
				DistanceTable[tostring(ObjectList[i])][tostring(ObjectList[j])]=0
			else 
				if DistanceTable[tostring(ObjectList[i])][tostring(ObjectList[j])] == nil then
					DistanceTable[tostring(ObjectList[i])][tostring(ObjectList[j])]=GetObjectDistance(GetObj.String(ObjectList[i]),GetObj.String(ObjectList[j]))
					DistanceTable[tostring(ObjectList[j])][tostring(ObjectList[i])]=DistanceTable[tostring(ObjectList[i])][tostring(ObjectList[j])]	
				end
			end
		end	
	end
	--sort object list by distance to main tower
	local SortHelper=function(Object1,Object2)
		if %DistanceTable[tostring(%self)][tostring(Object1)] < %DistanceTable[tostring(%self)][tostring(Object2)] then return true end
	end
	sort(ObjectList,SortHelper)
	--main part: distribute one tower for each tower to support
	local MainNodeTable = {}
	tinsert(MainNodeTable,self)
	local i = 2
	local ObjectListSize
	for i=2,getn(ObjectList),1 do
		local MainNodeCriteria = true
		local NextMainNode, NextMainNodeAlternative  --closest main node
		local NextMainNodeDistance = 13000
		for k=1,getn(MainNodeTable),1 do
			if NextMainNodeDistance > DistanceTable[tostring(MainNodeTable[k])][tostring(ObjectList[i])] then
				NextMainNodeDistance = DistanceTable[tostring(MainNodeTable[k])][tostring(ObjectList[i])]
				NextMainNode = MainNodeTable[k]
			end
		end		
		local ShortestLinkToNextMainNodeDistance = 13000
		for j=3,getn(ObjectList),1 do	
			if not i==j and ObjectList[j]~=nil then
				local iNodeTojNodeDistance = DistanceTable[tostring(ObjectList[i])][tostring(ObjectList[j])]
				local iNodeToNextMainNodeDistance = DistanceTable[tostring(NextMainNode)][tostring(ObjectList[i])]
				local jNodeToNextMainNodeDistance = DistanceTable[tostring(NextMainNode)][tostring(ObjectList[j])]
				if jNodeToNextMainNodeDistance < iNodeToNextMainNodeDistance then 
					if iNodeTojNodeDistance < iNodeToNextMainNodeDistance then
						MainNodeCriteria = false
						local LinkToNextMainNodeDistance = iNodeTojNodeDistance + jNodeToNextMainNodeDistance
						if ShortestLinkToNextMainNodeDistance > LinkToNextMainNodeDistance then
							NextMainNodeAlternative=ObjectList[j]
							ShortestLinkToNextMainNodeDistance = LinkToNextMainNodeDistance
						end
					end
				end
			end
		end
		if MainNodeCriteria == true then 
			if TowerAttackRange > DistanceTable[tostring(NextMainNode)][tostring(ObjectList[i])] then
				tinsert(MainNodeTable,ObjectList[i])
				SupportConnection[tostring(ObjectList[i])]=NextMainNode
				else
				ObjectList[i]=nil
			end
			else 
			if TowerAttackRange > ShortestLinkToNextMainNodeDistance then 
				SupportConnection[tostring(ObjectList[i])]=NextMainNodeAlternative
				else 
				ObjectList[i]=nil
			end
		end
	end	
	--remove all unneccasary towers
	local CleanedObjectList = {}
	for i=1,getn(ObjectList),1 do
		if not ObjectList[i]==nil then tinsert(CleanedObjectList,ObjectList[i]) end
	end
	ObjectList=CleanedObjectList
	MainTowerSupporterList[tostring(self)] = CleanedObjectList
	MainTowerSupportConnectionList[tostring(self)]=SupportConnection
	--fire cumulative attribute modifier weapon on main tower (self)
	for i=2,getn(ObjectList),1 do
		ObjectCreateAndFireTempWeapon(self,"PrismTowerSupportWeapon")
	end		
	--fire special power to display visual support beams
	for i=2,getn(ObjectList),1 do
		--ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_NAMED",ObjectList[i],"SpecialPower_PrismForwarding",SupportConnection[tostring(ObjectList[i])])	
		ExecuteAction("NAMED_STOP",ObjectList[i])
		ExecuteAction("NAMED_ATTACK_NAMED",ObjectList[i],SupportConnection[tostring(ObjectList[i])])		
	end
end

function GetMyMainTower(object)
	for q,p in MainTowerSupporterList do 
		if q~=tostring(object) then
			for i=1,getn(p),1 do 
				if p[i]==object then 
					return p[1]
				end
			end
		end
	end
end

function IsTowerStillAttacking(MainTower)
	if ObjectTestModelCondition(MainTower,"ATTACKING") or ObjectTestModelCondition(MainTower,"PREATTACK_A") or ObjectTestModelCondition(MainTower,"RELOADING_A") or ObjectTestModelCondition(MainTower,"FIRING_A") then return true else return false end
end

function NodObelisk_RELOADING(self)
	local TowerAttackRange = 375
	if MainTowerSupporterList[tostring(self)]~=nil then --and ObjectCountNearbyEnemies(self,TowerAttackRange)==0 then
		for i=2,getn(MainTowerSupporterList[tostring(self)]),1 do
			ExecuteAction("NAMED_STOP",MainTowerSupporterList[tostring(self)][i])
		end
		--MainTowerSupporterList[tostring(self)]=nil
		else
		if ObjectCountNearbyEnemies(self,TowerAttackRange)==0 then ExecuteAction("NAMED_STOP",self) end
		local MainTower = GetMyMainTower(self)
		if not IsTowerStillAttacking(MainTower) then 
			MainTowerSupporterList[tostring(MainTower)]=nil
			else 
			ExecuteAction("NAMED_STOP",self)
			ExecuteAction("NAMED_ATTACK_NAMED",self,MainTowerSupportConnectionList[tostring(MainTower)][tostring(self)]) 
		end	
	end
end