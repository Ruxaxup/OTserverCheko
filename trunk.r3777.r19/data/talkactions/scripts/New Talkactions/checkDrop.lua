function onSay(cid, words, param, channel)
	if(param == "") then
		doPlayerSendCancel(cid,"Need a monster name")
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
		return true
	end
	local info = getMonsterInfo(param)
	if(info ~= nil) then
		local lootList = info.loot
		for i = 1, #lootList do
			print("Item: " .. getItemNameById(lootList[i].id) ..", Chance: ".. (lootList[i].chance / 1000) .. "%")
		end
	end
	return TRUE

end