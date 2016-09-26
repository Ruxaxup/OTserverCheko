function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	if getCreatureStorage(cid, storages.done) > 1 then
		return doTeleportThing(cid, positions.rewardRoom)
	end
	return false
end