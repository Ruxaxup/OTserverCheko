function onDeath(cid, corpse)
 
	if getCreatureStorage(cid, storages.treeCut) > 0 and getCreatureStorage(cid, storages.done) < 1 then
		local creatures = getCreaturesInQuestArea(TYPE_MONSTER, questAreaPosition[1], questAreaPosition[2], GET_UID)
		if creatures and #creatures > 0 then
			for _, it in ipairs(creatures) do
				doRemoveCreature(it)
			end
		end
		doCreatureSetStorage(cid, storages.treeCut, 0)
	end
	return true
end