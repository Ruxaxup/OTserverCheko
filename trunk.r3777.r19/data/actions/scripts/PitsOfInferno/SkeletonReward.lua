function onUse(cid, item, frompos, item2, topos)

	if item.uid == 10282 then
		if getPlayerStorageValue(cid,10282) == -1 then
			local bp = doPlayerAddItem(cid,5926,1) --pirate backpack
			doAddContainerItem(bp,6561,1) --Ceremonial Ankh
			doAddContainerItem(bp,6300,1) --Death Ring
			doAddContainerItem(bp,2168,1) --Life Ring
			doAddContainerItem(bp,2143,5) --White Pearls
			doAddContainerItem(bp,5022,3) --Orichalcum Pearls
			doAddContainerItem(bp,5944,2) --Soul Orbs
			doAddContainerItem(bp,2152,11) --Platinum Coins
			doAddContainerItem(bp,6561,1) --Ceremonial Ankh
			doAddContainerItem(bp,2268,3) --Sudden Death Rune
			doAddContainerItem(bp,2268,3) --Sudden Death Rune
			doAddContainerItem(bp,2273,3) --Ultimate Healing Rune
			doAddContainerItem(bp,2273,1) --Ultimate Healing Rune
			doAddContainerItem(bp,2273,1) --Ultimate Healing Rune
			doAddContainerItem(bp,2260) --Blank Rune
			doAddContainerItem(bp,7590,1) --Great Mana Potion
			setPlayerStorageValue(cid,10282,1)
			doPlayerSendTextMessage(cid,25,'You have found a pirate backpack.')
	elseif getPlayerStorageValue(cid,10282) == 1 then
		doPlayerSendTextMessage(cid,25,'The corpse is empty.')
end
return 1
else
return 0
end
end