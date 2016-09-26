function onStepIn(cid, item, position, fromPosition) 	
	if isPlayer(cid) then
		spawnArmy()
	end		
	return true
end