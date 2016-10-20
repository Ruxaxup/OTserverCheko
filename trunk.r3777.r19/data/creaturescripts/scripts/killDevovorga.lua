local tpSpawn = {x = 1540, y = 990, z = 11}
local tpPosition = {x = 1067, y = 1065, z = 6}
local tpID = 1387

local function removeTeleport(pos, segundos)
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
			
		if(segundos > 20 and segundos < 40) then
			textColor = TEXTCOLOR_YELLOW
		elseif(segundos < 20) then
			textColor = TEXTCOLOR_RED
		end
		doSendAnimatedText(pos, segundos, textColor)
		addEvent(removeTeleport, 1000, pos, segundos - 1)
	end	
end

local function createTeleport(timeLeft)
	print("Crea teleport")
	doBroadcastMessage("You now have "..timeLeft.." seconds to leave this place!! Or you will die...", MESSAGE_EVENT_DEFAULT)
	doCreateTeleport(tpID, tpPosition, tpSpawn)	
	doSendAnimatedText(tpSpawn, "Exit",TEXTCOLOR_YELLOW)
	addEvent(removeTeleport, 0, tpSpawn, timeLeft)	
end

function onKill(cid, target, lastHit)
 	local creatureName = getCreatureName(target)
 	
 	if(creatureName == "Devovorga") then
 		if(isInParty(cid)) then
 			print("Is in party")
 			local pos, memberlist = getCreaturePosition(cid), getPartyMembers(cid)
		    if(memberlist == nil or type(memberlist) ~= 'table' or table.maxn(memberlist) <= 1) then
		        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
		        doSendMagicEffect(pos, CONST_ME_POFF)
		        return false
		    end
		    local partyLeader
		    for _, pid in ipairs(memberlist) do
		        if(getPlayerStorageValue(pid,DEVOVORGA_QUEST) == 6) then
		        	partyLeader = pid
		        end
		    end
 			
 			doPlayerSetStorageValue(partyLeader, DEVOVORGA_QUEST, 7)
 			doPlayerRemoveItem(partyLeader,2139,1)
 			doPlayerSendTextMessage(partyLeader, MESSAGE_EVENT_ORANGE, "The tiara has been broken...")
 			doPlayerAddMapMark(partyLeader,{x = 1540, y = 989, z = 11},MAPMARK_STAR,"Exit!")
 			doBroadcastMessage("The party of " .. getCreatureName(partyLeader) .. " has defeated "..creatureName..".", MESSAGE_EVENT_DEFAULT)
 		else
 			print("Is alone")
 			doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 7)
			if(getPlayerItemCount(cid,2139) > 0) then
				print("destruir corona")
	 			doPlayerRemoveItem(cid,2139,1)
	 			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "The tiara has been broken...")
	 			doPlayerAddMapMark(cid,{x = 1540, y = 989, z = 11},MAPMARK_STAR,"Exit!")
	 			doBroadcastMessage("The player " .. getCreatureName(cid) .. " has defeated "..creatureName..".", MESSAGE_EVENT_DEFAULT)
	 		end
 		end
 		setGlobalStorageValue(DEVOVORGA_SPAWN,-1)
 		createTeleport(60)
 	end	

 	return true
end

