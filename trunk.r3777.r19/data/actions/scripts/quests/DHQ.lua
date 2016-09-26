function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cfg = {
		stone = { x = 935, y = 1079, z = 13 }, -- Stone is Located
		teleport = { x = 938, y = 1078, z = 13 }, -- Teleport Creates
		to = { x = 945, y = 1078, z = 12 }, -- Teleport Goes
		time = 40 * 1000
	}
	local function reset()
		local tp = getTileItemById(cfg.teleport, 1387)
		if(tp.uid > 0) then
			doRemoveItem(tp.uid)
			doCreateItem(1355, 1, cfg.stone)
			doTransformItem(item.uid, item.itemid - 1)
		end
		return true
	end
	if(item.itemid == 1945) then
		local stoneCheck = getTileItemById(cfg.stone, 1355)
		if(stoneCheck.uid > 0) then
			doRemoveItem(stoneCheck.uid)
			doCreateTeleport(1387, cfg.teleport, cfg.to)
			doCreatureSay(cid, "You have opened the passage.", TALKTYPE_ORANGE_1)
			addEvent(reset, cfg.time)
		end
	elseif(item.itemid == 1946)
	then	doPlayerSendCancel(cid, "The passage is already open.")
	end
	return true
end