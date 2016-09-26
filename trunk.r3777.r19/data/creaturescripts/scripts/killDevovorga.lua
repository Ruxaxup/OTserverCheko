function onKill(cid, target, lastHit)
 	local creatureName = getCreatureName(target)
	
 	if(creatureName == "Devovorga") then
 		if(isInParty(cid)) then
 			local partyLeader = getPartyLeader(cid)
 			doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 6)
 		end
 	end
	return true
end