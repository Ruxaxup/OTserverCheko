function onLogout(cid)
 
	if getCreatureStorage(cid, storages.treeCut) > 0 and getCreatureStorage(cid, storages.done) < 1 then
		doCreatureSetStorage(cid, storages.treeCut, 0)
	end
	return true
end