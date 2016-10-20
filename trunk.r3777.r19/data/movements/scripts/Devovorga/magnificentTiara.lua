local backPosition = {x = 1584, y = 986, z = 3}
local backPositionCastle = {x = 1585, y = 1024, z = 6}
local backPositionMountain = {x = 1565, y = 1084, z = 7}

local SthenoSpawn 	= {x = 1585, y = 983, z = 2}
local EuryaleSpawn1 = {x = 1588, y = 981, z = 2}
local EuryaleSpawn2 = {x = 1582, y = 981, z = 2}
local EuryaleSpawn3 = {x = 1582, y = 988, z = 2}
local EuryaleSpawn4 = {x = 1588, y = 988, z = 2}

function onStepIn(cid, item, position, fromPosition) 	
	if (isPlayer(cid)) then
		if(item.actionid == 10300 and item.itemid == 407) then --Tiles de Devo
			if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) < 5) then
				doTeleportThing(cid, backPosition, TRUE)
				doSendMagicEffect(backPosition,CONST_ME_BIGPLANTS)
			end 		
		elseif(item.actionid == 10301 and item.itemid == 5259) then --Escaleras
			print("Went upstairs")
			if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 5) then
				if(getGlobalStorageValue(STHENO_SPAWN) == -1) then
					setGlobalStorageValue(STHENO_SPAWN, 1)
					doSummonCreature("Stheno", SthenoSpawn)
					doSummonCreature("Euryale", EuryaleSpawn1)
					doSummonCreature("Euryale", EuryaleSpawn2)
					doSummonCreature("Euryale", EuryaleSpawn3)
					doSummonCreature("Euryale", EuryaleSpawn4)
				end
			elseif(getPlayerStorageValue(cid, DEVOVORGA_QUEST) ~= 5) then
				--Si nadie de la party puede invocarlo
				doTeleportThing(cid, backPosition, TRUE)
				doSendMagicEffect(backPosition,CONST_ME_ICETORNADO)
				doCreatureSay(cid,"I must use a safest exit!!",MESSAGE_EVENT_ORANGE)
			end
		elseif(item.actionid == 10303) then
			if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) < 6) then
				doTeleportThing(cid, backPositionMountain, TRUE)
				doSendMagicEffect(backPosition,CONST_ME_PURPLEENERGY)
				doCreatureSay(cid,"An evil magic is blocking the way...",MESSAGE_EVENT_ORANGE)
			end
		end
	end		
	return true
end