function doPlayerGiveItem(cid, itemid, amount, subType)
	local item = 0
	if(isItemStackable(itemid)) then
		item = doCreateItemEx(itemid, amount)
		if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	else
		for i = 1, amount do
			item = doCreateItemEx(itemid, subType)
			if(doPlayerAddItemEx(cid, item, true) ~= RETURNVALUE_NOERROR) then
				return false
			end
		end
	end

	return true
end

function doPlayerGiveItemContainer(cid, containerid, itemid, amount, subType)
	for i = 1, amount do
		local container = doCreateItemEx(containerid, 1)
		for x = 1, getContainerCapById(containerid) do
			doAddContainerItem(container, itemid, subType)
		end

		if(doPlayerAddItemEx(cid, container, true) ~= RETURNVALUE_NOERROR) then
			return false
		end
	end

	return true
end

function doPlayerTakeItem(cid, itemid, amount)
	return getPlayerItemCount(cid, itemid) >= amount and doPlayerRemoveItem(cid, itemid, amount)
end

function doPlayerBuyItem(cid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItem(cid, itemid, count, charges)
end

function doPlayerBuyItemContainer(cid, containerid, itemid, count, cost, charges)
	return doPlayerRemoveMoney(cid, cost) and doPlayerGiveItemContainer(cid, containerid, itemid, count, charges)
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(not doPlayerTakeItem(cid, itemid, count)) then
		return false
	end

	if(not doPlayerAddMoney(cid, cost)) then
		error('[doPlayerSellItem] Could not add money to: ' .. getPlayerName(cid) .. ' (' .. cost .. 'gp).')
	end

	return true
end

function doPlayerWithdrawMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	local balance = getPlayerBalance(cid)
	if(amount > balance or not doPlayerAddMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, balance - amount)
	return true
end

function doPlayerDepositMoney(cid, amount)
	if(not getBooleanFromString(getConfigInfo('bankSystem'))) then
		return false
	end

	if(not doPlayerRemoveMoney(cid, amount)) then
		return false
	end

	doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
	return true
end

function doPlayerAddStamina(cid, minutes)
	return doPlayerSetStamina(cid, getPlayerStamina(cid) + minutes)
end

function isPremium(cid)
	return (isPlayer(cid) and (getPlayerPremiumDays(cid) > 0 or getBooleanFromString(getConfigValue('freePremium'))))
end

function getMonthDayEnding(day)
	if(day == "01" or day == "21" or day == "31") then
		return "st"
	elseif(day == "02" or day == "22") then
		return "nd"
	elseif(day == "03" or day == "23") then
		return "rd"
	end

	return "th"
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function isNumeric(str)
	return tonumber(str) ~= nil
end

function doNumberFormat(i)
	local str, found = string.gsub(i, "(%d)(%d%d%d)$", "%1,%2", 1), 0
	repeat
		str, found = string.gsub(str, "(%d)(%d%d%d),", "%1,%2,", 1)
	until found == 0
	return str
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function doPlayerWithdrawAllMoney(cid)
	return doPlayerWithdrawMoney(cid, getPlayerBalance(cid))
end

function doPlayerDepositAllMoney(cid)
	return doPlayerDepositMoney(cid, getPlayerMoney(cid))
end

function doPlayerTransferAllMoneyTo(cid, target)
	return doPlayerTransferMoneyTo(cid, target, getPlayerBalance(cid))
end

function playerExists(name, multiworld)
	return getPlayerGUIDByName(name, multiworld or false) ~= nil
end

function getTibiaTime()
	local minutes, hours = getWorldTime(), 0
	while (minutes > 60) do
		hours = hours + 1
		minutes = minutes - 60
	end

	return {hours = hours, minutes = minutes}
end

function doWriteLogFile(file, text)
	local f = io.open(file, "a+")
	if(not f) then
		return false
	end

	f:write("[" .. os.date("%d/%m/%Y %H:%M:%S") .. "] " .. text .. "\n")
	f:close()
	return true
end

function getExperienceForLevel(lv)
	lv = lv - 1
	return ((50 * lv * lv * lv) - (150 * lv * lv) + (400 * lv)) / 3
end

function doMutePlayer(cid, time)
	local condition = createConditionObject(CONDITION_MUTED, (time == -1 and time or time * 1000))
	return doAddCondition(cid, condition, false)
end

function getPlayerGroupName(cid)
	return getGroupInfo(getPlayerGroupId(cid)).name
end

function getPlayerVocationName(cid)
	return getVocationInfo(getPlayerVocation(cid)).name
end

function getPromotedVocation(vid)
	return getVocationInfo(vid).promotedVocation
end

function doPlayerRemovePremiumDays(cid, days)
	return doPlayerAddPremiumDays(cid, -days)
end

function getPlayerMasterPos(cid)
	return getTownTemplePosition(getPlayerTown(cid))
end

function getHouseOwner(houseId)
	return getHouseInfo(houseId).owner
end

function getHouseName(houseId)
	return getHouseInfo(houseId).name
end

function getHouseEntry(houseId)
	return getHouseInfo(houseId).entry
end

function getHouseRent(houseId)
	return getHouseInfo(houseId).rent
end

function getHousePrice(houseId)
	return getHouseInfo(houseId).price
end

function getHouseTown(houseId)
	return getHouseInfo(houseId).town
end

function getHouseDoorsCount(houseId)
	return table.maxn(getHouseInfo(houseId).doors)
end

function getHouseBedsCount(houseId)
	return table.maxn(getHouseInfo(houseId).beds)
end

function getHouseTilesCount(houseId)
	return table.maxn(getHouseInfo(houseId).tiles)
end

function getItemNameById(itemid)
	return getItemDescriptionsById(itemid).name
end

function getItemPluralNameById(itemid)
	return getItemDescriptionsById(itemid).plural
end

function getItemArticleById(itemid)
	return getItemDescriptionsById(itemid).article
end

function getItemName(uid)
	return getItemDescriptions(uid).name
end

function getItemPluralName(uid)
	return getItemDescriptions(uid).plural
end

function getItemArticle(uid)
	return getItemDescriptions(uid).article
end

function getItemText(uid)
	return getItemDescriptions(uid).text
end

function getItemSpecialDescription(uid)
	return getItemDescriptions(uid).special
end

function getItemWriter(uid)
	return getItemDescriptions(uid).writer
end

function getItemDate(uid)
	return getItemDescriptions(uid).date
end

function getTilePzInfo(pos)
	return getTileInfo(pos).protection
end

function getTileZoneInfo(pos)
	local tmp = getTileInfo(pos)
	if(tmp.pvp) then
		return 2
	end

	if(tmp.nopvp) then
		return 1
	end

	return 0
end

function doShutdown()
	return doSetGameState(GAMESTATE_SHUTDOWN)
end

function doSummonCreature(name, pos, displayError)
	local displayError, cid = displayError or true, doCreateMonster(name, pos, false, false, displayError)
	if(not cid) then
		cid = doCreateNpc(name, pos, displayError)
	end

	return cid
end

function getOnlinePlayers()
	local players = {}
	for i, cid in ipairs(getPlayersOnline()) do
		table.insert(players, getCreatureName(cid))
	end

	return players
end

function getPlayerByName(name)
	local cid = getCreatureByName(name)
	return isPlayer(cid) and cid or nil
end

function isPlayer(cid)
	return isCreature(cid) and cid >= AUTOID_PLAYERS and cid < AUTOID_MONSTERS
end

function isPlayerGhost(cid)
	return isPlayer(cid) and (getCreatureCondition(cid, CONDITION_GAMEMASTER, GAMEMASTER_INVISIBLE) or getPlayerFlagValue(cid, PLAYERFLAG_CANNOTBESEEN))
end

function isMonster(cid)
	return isCreature(cid) and cid >= AUTOID_MONSTERS and cid < AUTOID_NPCS
end

function isNpc(cid)
	return isCreature(cid) and cid >= AUTOID_NPCS
end

function doPlayerSetExperienceRate(cid, value)
	return doPlayerSetRate(cid, SKILL__LEVEL, value)
end

function doPlayerSetMagicRate(cid, value)
	return doPlayerSetRate(cid, SKILL__MAGLEVEL, value)
end

function doPlayerAddLevel(cid, amount, round)
	local experience, level, amount = 0, getPlayerLevel(cid), amount or 1
	if(amount > 0) then
		experience = getExperienceForLevel(level + amount) - (round and getPlayerExperience(cid) or getExperienceForLevel(level))
	else
		experience = -((round and getPlayerExperience(cid) or getExperienceForLevel(level)) - getExperienceForLevel(level + amount))
	end

	return doPlayerAddExperience(cid, experience)
end

function doPlayerAddMagLevel(cid, amount)
	local amount = amount or 1
	for i = 1, amount do
		doPlayerAddSpentMana(cid, getPlayerRequiredMana(cid, getPlayerMagLevel(cid, true) + 1) - getPlayerSpentMana(cid), false)
	end

	return true
end

function doPlayerAddSkill(cid, skill, amount, round)
	local amount = amount or 1
	if(skill == SKILL__LEVEL) then
		return doPlayerAddLevel(cid, amount, round)
	elseif(skill == SKILL__MAGLEVEL) then
		return doPlayerAddMagLevel(cid, amount)
	end

	for i = 1, amount do
		doPlayerAddSkillTry(cid, skill, getPlayerRequiredSkillTries(cid, skill, getPlayerSkillLevel(cid, skill) + 1) - getPlayerSkillTries(cid, skill), false)
	end

	return true
end

function getPartyLeader(cid)
	local party = getPartyMembers(cid)
	if(type(party) ~= 'table') then
		return 0
	end

	return party[1]
end

function isInParty(cid)
	return type(getPartyMembers(cid)) == 'table'
end

function isPrivateChannel(channelId)
	return channelId >= CHANNEL_PRIVATE
end

function doPlayerResetIdleTime(cid)
	return doPlayerSetIdleTime(cid, 0)
end

function doBroadcastMessage(text, class)
	local class = class or MESSAGE_STATUS_WARNING
	if(type(class) == 'string') then
		local className = MESSAGE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doPlayerSendTextMessage(pid, class, text)
	end

	print("> Broadcasted message: \"" .. text .. "\".")
	return true
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
	local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
	if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
		return false
	end

	if(type(class) == 'string') then
		local className = TALKTYPE_TYPES[class]
		if(className == nil) then
			return false
		end

		class = className
	elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
		return false
	end

	for _, pid in ipairs(getPlayersOnline()) do
		doCreatureSay(cid, text, class, ghost, pid)
	end

	print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
	return true
end

function getBooleanFromString(input)
	local tmp = type(input)
	if(tmp == 'boolean') then
		return input
	end

	if(tmp == 'number') then
		return input > 0
	end

	local str = string.lower(tostring(input))
	return (str == "yes" or str == "true" or (tonumber(str) ~= nil and tonumber(str) > 0))
end

function doCopyItem(item, attributes)
	local attributes = ((type(attributes) == 'table') and attributes or { "aid" })

	local ret = doCreateItemEx(item.itemid, item.type)
	for _, key in ipairs(attributes) do
		local value = getItemAttribute(item.uid, key)
		if(value ~= nil) then
			doItemSetAttribute(ret, key, value)
		end
	end

	if(isContainer(item.uid)) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end

	return getThing(ret)
end

function doRemoveThing(uid)
	if(isCreature(uid)) then
		return doRemoveCreature(uid)
	end

	return doRemoveItem(uid)
end

function setAttackFormula(combat, type, minl, maxl, minm, maxm, min, max)
	local min, max = min or 0, max or 0
	return setCombatFormula(combat, type, -1, 0, -1, 0, minl, maxl, minm, maxm, -min, -max)
end

function setHealingFormula(combat, type, minl, maxl, minm, maxm, min, max)
	local min, max = min or 0, max or 0
	return setCombatFormula(combat, type, 1, 0, 1, 0, minl, maxl, minm, maxm, min, max)
end

function doChangeTypeItem(uid, subtype)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local subtype = subtype or 1
	return doTransformItem(thing.uid, thing.itemid, subtype)
end

function doSetItemText(uid, text, writer, date)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	doItemSetAttribute(uid, "text", text)
	if(writer ~= nil) then
		doItemSetAttribute(uid, "writer", tostring(writer))
		if(date ~= nil) then
			doItemSetAttribute(uid, "date", tonumber(date))
		end
	end

	return true
end

function getFluidSourceType(itemid)
	local item = getItemInfo(itemid)
	return item and item.fluidSource or false
end

function getDepotId(uid)
	return getItemAttribute(uid, "depotid") or false
end

function getItemDescriptions(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item = getItemInfo(thing.itemid)
	return {
		name = getItemAttribute(uid, "name") or item.name,
		plural = getItemAttribute(uid, "pluralname") or item.plural,
		article = getItemAttribute(uid, "article") or item.article,
		special = getItemAttribute(uid, "description") or "",
		text = getItemAttribute(uid, "text") or "",
		writer = getItemAttribute(uid, "writer") or "",
		date = getItemAttribute(uid, "date") or 0
	}
end

function getItemWeightById(itemid, count, precision)
	local item, count, precision = getItemInfo(itemid), count or 1, precision or false
	if(not item) then
		return false
	end

	if(count > 100) then
		-- print a warning, as its impossible to have more than 100 stackable items without "cheating" the count
		print('[Warning] getItemWeightById', 'Calculating weight for more than 100 items!')
	end

	local weight = item.weight * count
	--[[if(precision) then
		return weight
	end

	local t = string.explode(tostring(weight), ".")
	if(table.maxn(t) == 2) then
		return tonumber(t[1] .. "." .. string.sub(t[2], 1, 2))
	end]]--

	return weight
end

function getItemWeaponType(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	return getItemInfo(thing.itemid).weaponType
end

function getItemRWInfo(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item, flags = getItemInfo(thing.itemid), 0
	if(item.readable) then
		flags = 1
	end

	if(item.writable) then
		flags = flags + 2
	end

	return flags
end

function getItemLevelDoor(itemid)
	local item = getItemInfo(itemid)
	return item and item.levelDoor or false
end

function isItemStackable(itemid)
	local item = getItemInfo(itemid)
	return item and item.stackable or false
end

function isItemRune(itemid)
	local item = getItemInfo(itemid)
	return item and item.type == ITEM_TYPE_RUNE or false
end

function isItemDoor(itemid)
	local item = getItemInfo(itemid)
	return item and item.type == ITEM_TYPE_DOOR or false
end

function isItemContainer(itemid)
	local item = getItemInfo(itemid)
	return item and item.group == ITEM_GROUP_CONTAINER or false
end

function isItemFluidContainer(itemid)
	local item = getItemInfo(itemid)
	return item and item.group == ITEM_GROUP_FLUID or false
end

function isItemMovable(itemid)
	local item = getItemInfo(itemid)
	return item and item.movable or false
end

function isCorpse(uid)
	local thing = getThing(uid)
	if(thing.itemid < 100) then
		return false
	end

	local item = getItemInfo(thing.itemid)
	return item and item.corpseType ~= 0 or false
end

function getContainerCapById(itemid)
	local item = getItemInfo(itemid)
	if(not item or item.group ~= 2) then
		return false
	end

	return item.maxItems
end

function getMonsterAttackSpells(name)
	local monster = getMonsterInfo(name)
	return monster and monster.attacks or false
end

function getMonsterHealingSpells(name)
	local monster = getMonsterInfo(name)
	return monster and monster.defenses or false
end

function getMonsterLootList(name)
	local monster = getMonsterInfo(name)
	return monster and monster.loot or false
end

function getMonsterSummonList(name)
	local monster = getMonsterInfo(name)
	return monster and monster.summons or false
end

function choose(...)
	local arg = {...}
	return arg[math.random(1, table.maxn(arg))]
end

function doItemSetActionId(uid, aid)
	return doItemSetAttribute(uid, "aid", aid)
end

function isContainer(uid)
	local thing = getThing(uid)
	return thing.uid > 0 and type(thing.items) == 'table' and not table.empty(thing.items)
end

function isUnderWater(cid)
	return isInArray(underWater, getTileInfo(getCreaturePosition(cid)).itemid)
end

--statSystem

--LIFE_STEAL_PERC = 65003
--MANA_LEECH_PERC = 65004
--STAT_POINTS =	65005
function doPlayerSpendStatPoint(cid)
	local statPoints = getPlayerStorageValue(cid, STAT_POINTS)
	statPoints = statPoints - 1
	if(statPoints < 0) then
		statPoints = 0
	end
	doPlayerSetStorageValue(cid, STAT_POINTS, statPoints)
	return TRUE
end

function doPlayerAddStatPoint(cid)
	local statPoints = getPlayerStorageValue(cid, STAT_POINTS)
	local pointsPerAdvance = 5
	if(statPoints == -1) then
		statPoints = 0
		doPlayerSetStorageValue(cid, STAT_POINTS, 0)
	end
	if( (statPoints + pointsPerAdvance) < MAX_STATPOINTS) then
		doPlayerSetStorageValue(cid, STAT_POINTS, statPoints + pointsPerAdvance)
		return TRUE
	else
		return FALSE
	end
end

function doPlayerSetStatPoint(cid, count)
	local cantidad = tonumber(count)
	if (cantidad == nil) then
		return FALSE
	end
	if(cantidad < 0) then
		return FALSE
	else
		doPlayerSetStorageValue(cid, STAT_POINTS, cantidad)
		return TRUE
	end
end

function getPlayerStatPoints(cid)
	local statPoints = getPlayerStorageValue(cid, STAT_POINTS)
	if(statPoints == -1) then
		statPoints = 0
		doPlayerSetStorageValue(cid, STAT_POINTS, 0)
	end
	return statPoints
end

-- Life Steal

function getPlayerLifeStealPoints(cid)
	local lifeStealPoints = getPlayerStorageValue(cid, LIFE_STEAL_PERC)
	if(lifeStealPoints == -1) then
		lifeStealPoints = 0
		doPlayerSetStorageValue(cid,LIFE_STEAL_PERC,0)
	end
	return lifeStealPoints
end

function doPlayerDecreaseLifeStealPoint(cid)
	local lifeStealPoints = tonumber(getPlayerLifeStealPoints(cid))
	if(lifeStealPoints > 0.0) then
		doPlayerAddStatPoint(cid)
		lifeStealPoints = lifeStealPoints - LS_PER_POINT
		doPlayerSetStorageValue(cid, LIFE_STEAL_PERC, lifeStealPoints)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_YELLOW_RINGS)
		return TRUE
	else
		doPlayerSendCancel(cid, "Minimum Life Steal points reached.")
		return FALSE
	end
end

function doPlayerAddLifeStealPoint(cid)
	local statPoints = getPlayerStatPoints(cid)
	if(statPoints == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You don't have enough stat points.")
		return FALSE
	else
		local lifeStealPoints = getPlayerLifeStealPoints(cid)
		if( (lifeStealPoints + LS_PER_POINT) > MAX_LIFESTEAL) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have reached max Life Steal.")
			return FALSE
		else
			lifeStealPoints = lifeStealPoints + LS_PER_POINT
			doPlayerSetStorageValue(cid, LIFE_STEAL_PERC, lifeStealPoints)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				 "You Life Steal is been increased by "..(LS_PER_POINT * 100)..". Now you have "..(getPlayerLifeStealPoints(cid) * 100)..".")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SOUND_GREEN)
			doCreatureSay(cid,"Health potions... para que?",MESSAGE_EVENT_ORANGE)
			return TRUE
		end
	end
end

--Mana Leech

function getPlayerManaLeechPoints(cid)
	local manaChancePoints = getPlayerStorageValue(cid, MANA_LEECH_PERC)
	if(manaChancePoints == -1) then
		manaChancePoints = 0
		doPlayerSetStorageValue(cid,MANA_LEECH_PERC,0)
	end
	return manaChancePoints
end

function doPlayerDecreaseManaLeechPoint(cid)
	local manaChancePoints = tonumber(getPlayerManaLeechChancePoints(cid))
	if(manaChancePoints > 0.0) then
		doPlayerAddStatPoint(cid)
		manaChancePoints = manaChancePoints - ML_PER_POINT
		doPlayerSetStorageValue(cid, MANA_LEECH_PERC, manaChancePoints)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_YELLOW_RINGS)
		return TRUE
	else
		doPlayerSendCancel(cid, "Minimum Mana Leech points reached.")
		return FALSE
	end
end

function doPlayerAddManaLeechPoint(cid)
	local statPoints = getPlayerStatPoints(cid)
	if(statPoints == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You don't have enough stat points.")
		return FALSE
	else
		local manaLeechPoints = getPlayerManaLeechPoints(cid)		
		if( (manaLeechPoints + ML_PER_POINT) > MAX_MANALEECH) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have reached max Mana Leech.")
			return FALSE
		else
			manaLeechPoints = manaLeechPoints + ML_PER_POINT
			doPlayerSetStorageValue(cid, MANA_LEECH_PERC, manaLeechPoints)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				 "You Mana Leech is been increased by "..(ML_PER_POINT * 100).."%. Now you have "..(getPlayerManaLeechPoints(cid) * 100).."%.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SOUND_BLUE)
			doCreatureSay(cid,"Mana potions... para que?",MESSAGE_EVENT_ORANGE)
			return TRUE
		end
	end
end

--Life Steal Chance
function getPlayerLifeStealChancePoints(cid)
	local lifeStealChancePoints = getPlayerStorageValue(cid, LS_CHANCE)
	if(lifeStealChancePoints == -1) then
		lifeStealChancePoints = 0
		doPlayerSetStorageValue(cid,LS_CHANCE,0)
	end
	return lifeStealChancePoints
end

function doPlayerDecreaseLifeStealChancePoint(cid)
	local lifeStealChancePoints = tonumber(getPlayerLifeStealChancePoints(cid))
	if(lifeStealChancePoints > 0.0) then
		doPlayerAddStatPoint(cid)
		lifeStealChancePoints = lifeStealChancePoints - LS_CHANCE_P_POINT
		doPlayerSetStorageValue(cid, LS_CHANCE, lifeStealChancePoints)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_YELLOW_RINGS)
		return TRUE
	else
		doPlayerSendCancel(cid, "Minimum Life Steal Chance points reached.")
		return FALSE
	end
end

function doPlayerAddLifeStealChancePoint(cid)
	local statPoints = getPlayerStatPoints(cid)
	if(statPoints == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You don't have enough stat points.")
		return FALSE
	else
		local lifeStealChancePoints = getPlayerLifeStealChancePoints(cid)
		if( (lifeStealChancePoints + LS_CHANCE_P_POINT) > LS_MAXCHANCE) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have reached max Life Steal Chance.")
			return FALSE
		else
			lifeStealChancePoints = lifeStealChancePoints + LS_CHANCE_P_POINT
			doPlayerSetStorageValue(cid, LS_CHANCE, lifeStealChancePoints)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				 "You Life Steal is been increased by "..LS_CHANCE_P_POINT..". Now you have "..getPlayerLifeStealChancePoints(cid)..".")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SOUND_PURPLE)
			doCreatureSay(cid,"Tendre mas Health papu :v",MESSAGE_EVENT_ORANGE)
			return TRUE
		end
	end
end


--Mana Leech Chance

function getPlayerManaLeechChancePoints(cid)
	local manaLeechChancePoints = getPlayerStorageValue(cid, ML_CHANCE)
	if(manaLeechChancePoints == -1) then
		manaLeechChancePoints = 0
		doPlayerSetStorageValue(cid,ML_CHANCE,0)
	end
	return manaLeechChancePoints
end

function doPlayerDecreaseManaLeechChancePoint(cid)
	local manaLeechChancePoints = tonumber(getPlayerManaLeechChancePoints(cid))
	if(manaLeechChancePoints > 0.0) then
		doPlayerAddStatPoint(cid)
		manaLeechChancePoints = manaLeechChancePoints - ML_CHANCE_P_POINT
		doPlayerSetStorageValue(cid, ML_CHANCE, manaLeechChancePoints)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_YELLOW_RINGS)
		return TRUE
	else
		doPlayerSendCancel(cid, "Minimum Mana Leech Chance points reached.")
		return FALSE
	end
end

function doPlayerAddManaLeechChancePoint(cid)
	local statPoints = getPlayerStatPoints(cid)
	if(statPoints == 0) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You don't have enough stat points.")
		return FALSE
	else
		local manaLeechChancePoints = getPlayerManaLeechChancePoints(cid)
		if( (manaLeechChancePoints + ML_CHANCE_P_POINT) > ML_MAXCHANCE) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have reached max Mana Leech Chance.")
			return FALSE
		else
			manaLeechChancePoints = manaLeechChancePoints + ML_CHANCE_P_POINT
			doPlayerSetStorageValue(cid, ML_CHANCE, manaLeechChancePoints)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,
				 "You Mana Leech is been increased by "..ML_CHANCE_P_POINT.."%. Now you have "..getPlayerManaLeechChancePoints(cid).."%.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SOUND_YELLOW)
			doCreatureSay(cid,"Tendre mas Mana papu :v",MESSAGE_EVENT_ORANGE)
			return TRUE
		end
	end
end

--ResetPoints

function resetAllPoints(cid)
	doPlayerSetStorageValue(cid, LIFE_STEAL_PERC, 0)
	doPlayerSetStorageValue(cid, MANA_LEECH_PERC, 0)
	doPlayerSetStorageValue(cid, ML_CHANCE, 0)
	doPlayerSetStorageValue(cid, LS_CHANCE, 0)
	doPlayerSetStorageValue(cid, STAT_POINTS, 0)
	doPlayerSetStorageValue(cid, REWARD_STAT_ID, 0)
	return TRUE
end

--Apply Life Steal or Mana Leech
function applyLSorML(cid, damage, target)
	local lifeSteal = getPlayerStorageValue(cid, LIFE_STEAL_PERC)
	-- chance to heal
	local chanceHeal = math.random(0, 100)
	if(chanceHeal > (100 - getPlayerLifeStealChancePoints(cid)) and damage ~= 0 )  then
		local healing = math.ceil(damage * lifeSteal)
		doCreatureAddHealth(cid,healing)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "[*]Life Steal: You were healed by " .. healing .. " hitpoints.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
		doSendAnimatedText(getCreaturePosition(cid), ""..healing, TEXTCOLOR_LIGHTGREEN)
	end

	-- chance to manaHeal
	local chanceMana = math.random(0, 100)
	local manaLeech = getPlayerStorageValue(cid, MANA_LEECH_PERC)
	if(chanceMana > (100 - getPlayerManaLeechChancePoints(cid)) and damage ~= 0) then
		local mana = math.ceil(damage * manaLeech)
		doCreatureAddMana(cid,mana)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[*]Mana Leech: You were healed by " .. mana .. " manapoints.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
		doSendAnimatedText(getCreaturePosition(cid), ""..mana, TEXTCOLOR_LIGHTBLUE)
	end
end

-- Special Raid

function spawnArmy( )
	for x = brigandArea.fromPos.x, brigandArea.toPos.x do
        for y = brigandArea.fromPos.y, brigandArea.toPos.y do
        	local pos = {x = x, y = y, z = brigandArea.fromPos.z}
          	if(math.random(0,100) > 95) then
          		doSummonCreature("Mini Brigand", pos)
          	end            
        end
    end
end

-- Boost Weapons

function addAttack(cid, weapon, attack)
	if(isInArray(WEAPONS,getItemWeaponType(weapon.uid))) then
		local diff
		local baseAttack = getItemInfo(weapon.itemid).attack
		local newAttack = tonumber(getItemAttribute(weapon.uid, "attack"))
		if(newAttack == nil) then
			newAttack = baseAttack
		end
		newAttack = newAttack + 1
		diff = newAttack - baseAttack
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_YALAHARIGHOST)
		doItemSetAttribute(weapon.uid,"attack",newAttack)
		local baseDescription = getItemInfo(weapon.itemid).description
		addDescription(weapon.uid, baseDescription .." Attack increased by "..diff..".")
		return true
	else
		doCreatureSay(cid, "Can only be used on weapons.",MESSAGE_EVENT_ORANGE)
		return false
	end	
end

function addAttackSpeed(uid, attackSpeed)
	return doItemSetAttribute(uid,"attackSpeed",attackSpeed)
end

function addDefense(uid, defense)
	return doItemSetAttribute(uid,"defense",defense)
end

function addArmor(uid, armor)
	return doItemSetAttribute(uid,"armor",armor)
end

function addHitchance(uid, hitchance)
	return doItemSetAttribute(uid,"hitchance",hitchance)
end

function addDescription(uid, text)	
	return doItemSetAttribute(uid,"description",text)
end


-- Mark map

function markMap(cid)
	doPlayerAddMapMark(cid,{x=1055,y=1087,z=7},MAPMARK_SWORD,"Offline Training Statues")
    doPlayerAddMapMark(cid,{x=1016,y=1022,z=7},MAPMARK_STAR,"Potions and Runes shop")
    doPlayerAddMapMark(cid,{x = 1062, y = 1044, z = 7},MAPMARK_STAR,"Stop and Go shop")
    doPlayerAddMapMark(cid,{x=1030,y=1012,z=7},MAPMARK_BAG,"Rashid")
    doPlayerAddMapMark(cid,{x=1070,y=1010,z=7},MAPMARK_SWORD,"Training monks")
    doPlayerAddMapMark(cid,{x = 1022, y = 1020, z = 7},MAPMARK_BAG,"Jeweller")
    doPlayerAddMapMark(cid,{x = 1034, y = 1041, z = 7},MAPMARK_TEMPLE,"Temple")
    doPlayerAddMapMark(cid,{x = 1028, y = 1037, z = 7},MAPMARK_GREENNORTH,"Teleports")
    doPlayerAddMapMark(cid,{x = 1040, y = 1046, z = 7},MAPMARK_EXCLAMATION,"Tasker")
    doPlayerAddMapMark(cid,{x = 1080, y = 1064, z = 6},MAPMARK_FLAG,"Boat")
    doPlayerAddMapMark(cid,{x = 1061, y = 1063, z = 7},MAPMARK_BAG,"Addon Seller")
    doPlayerAddMapMark(cid,{x = 1087, y = 955, z = 7},MAPMARK_GREENNORTH,"Story Teller")
    --Hunt Spots
    doPlayerAddMapMark(cid,{x = 1024, y = 1057, z = 7},MAPMARK_REDSOUTH,"Rotworms")
    doPlayerAddMapMark(cid,{x = 1029, y = 1032, z = 7},MAPMARK_REDSOUTH,"Rotworms")
    doPlayerAddMapMark(cid,{x = 1000, y = 1026, z = 7},MAPMARK_REDSOUTH,"Rotworms")
    doPlayerAddMapMark(cid,{x = 965, y = 1065, z = 7},MAPMARK_REDSOUTH,"Cyclops")
    doPlayerAddMapMark(cid,{x = 930, y = 1150, z = 7},MAPMARK_REDSOUTH,"POH")
    doPlayerAddMapMark(cid,{x = 825, y = 1047, z = 7},MAPMARK_REDSOUTH,"Quaras")
    doPlayerAddMapMark(cid,{x = 913, y = 1013, z = 7},MAPMARK_REDSOUTH,"Minotaurs")
    doPlayerAddMapMark(cid,{x = 966, y = 1027, z = 7},MAPMARK_REDSOUTH,"Dwarves")
    doPlayerAddMapMark(cid,{x = 1179, y = 945, z = 7},MAPMARK_REDSOUTH,"Pirates")
    doPlayerAddMapMark(cid,{x = 1184, y = 1050, z = 7},MAPMARK_REDSOUTH,"Dragons")

    --Towns
    doPlayerAddMapMark(cid,{x = 1277, y = 806, z = 7},MAPMARK_TEMPLE,"Evolutions City")
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your map is been marked!")
    doSendMagicEffect(getCreaturePosition(cid),CONST_ME_FIREWORK_BLUE)
end

--Thorn System
function getThornDamage(cid)
	local thornDamage = getPlayerStorageValue(cid, THORNS_ID)
	if(thornDamage < 0) then
		thornDamage = 0
	end
	return thornDamage
end

function addThornsDamage(cid, damage)
	local thornDamage = getThornDamage(cid)
	doPlayerSetStorageValue(cid, THORNS_ID, (thornDamage + damage))
end

function setThornArmorCondition(cid, activate) -- activate es booleano
	if(activate) then -- activamos condicion
		doPlayerSetStorageValue(cid, THORNS_ARMOR_CONDITION, 1)
	else
		doPlayerSetStorageValue(cid, THORNS_ARMOR_CONDITION, -1)
	end
end

function getSpecialCondition( cid, specialCondition )
	local condition = getPlayerStorageValue(cid, specialCondition)
	return condition
end