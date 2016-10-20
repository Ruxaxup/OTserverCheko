local tpSpawn = {x = 1585, y = 992, z = 2, stackpos=1}
local tpPosition = {x = 1565, y = 1084, z = 7}
local tpID = 1387
local timeLeft = 60 -- segundos

local function removeSthenoTeleport(pos, segundos)
	if(segundos == 0) then
		if getThingfromPos(pos).itemid == 1387 then
			local tele = getTileItemById(pos, 1387).uid			
			if(tele > 0) then
				doRemoveItem(tele,1)				
			end
			--doRemoveItem(getThingfromPos(pos).uid,1)
			doSendMagicEffect(pos, CONST_ME_POFF)	
			return TRUE
		end
	else
		local textColor = TEXTCOLOR_GREEN		
			
		if(segundos > 10 and segundos < 20) then
			textColor = TEXTCOLOR_YELLOW
		elseif(segundos < 10) then
			textColor = TEXTCOLOR_RED
		end
		doSendAnimatedText(pos, segundos, textColor)
		addEvent(removeSthenoTeleport, 1000, pos, segundos - 1)
	end	
end

local function createTeleport()
	doBroadcastMessage("You now have "..timeLeft.." seconds to leave this place!!", MESSAGE_EVENT_DEFAULT)
	doCreateTeleport(tpID, tpPosition, tpSpawn)	
	doSendAnimatedText(tpSpawn, "Exit",TEXTCOLOR_YELLOW)
	addEvent(removeSthenoTeleport, 0, tpSpawn, timeLeft)	
end

function onKill(cid, target, lastHit)
 	local creatureName = getCreatureName(target)
	
 	if(creatureName == "Stheno") then
 		print(creatureName.." has been killed.")
 		if(isInParty(cid)) then
 			local partyLeader = getPartyLeader(cid)
 			doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 6)
 			doBroadcastMessage("The party of " .. getCreatureName(partyLeader) .. " has defeated "..creatureName..".", MESSAGE_EVENT_DEFAULT)
 		else
 			doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 6)
 			doBroadcastMessage("The player " .. getCreatureName(cid) .. " has defeated "..creatureName..".", MESSAGE_EVENT_DEFAULT)
 		end 		
 		createTeleport()
 		setGlobalStorageValue(STHENO_SPAWN,-1)
 	end
	return true
end