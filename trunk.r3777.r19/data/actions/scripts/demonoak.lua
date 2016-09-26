function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	if blockingTree[itemEx.itemid] and itemEx.uid == blockingTree[itemEx.itemid][1] then
 
		local tree = toPosition
		if canEnter(cid, tree) ~= ERROR_NOERROR then
			return doPlayerSendCancel(cid, getError(canEnter(cid, tree), tree)) and doSendMagicEffect(tree, CONST_ME_POFF)
		end
 
		doTransformItem(itemEx.uid, blockingTree[itemEx.itemid][2])
		doSendMagicEffect(tree, CONST_ME_POFF)
		doMoveCreature(cid, getDirectionTo(getCreaturePosition(cid), toPosition))
		doCreatureSetStorage(cid, storages.treeCut, 1)
		doCreatureSay(cid, "I AWAITED YOU! COME HERE AND GET YOUR REWARD!", TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
		return true
 
	elseif isInArray(demonOak, itemEx.itemid) then
 
		local get = getCreatureStorage(cid, itemEx.itemid)
		if get == -1 then doCreatureSetStorage(cid, itemEx.itemid, 1) end
 
		local k = 0
		for i = demonOak[1], demonOak[#demonOak] do
			if(getCreatureStorage(cid, i) == (waves and waves > 0 and waves or #summons) + 1) then
				k = k + 1
			end
		end
 
		if killAllBeforeCut or k == #demonOak then
			if getCreaturesInQuestArea(TYPE_MONSTER, questAreaPosition[1], questAreaPosition[2], GET_COUNT) > 0 then
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need to kill all monsters first.")
				doSendMagicEffect(toPosition, CONST_ME_POFF)
				return true
			end
		end
 
		if(k == #demonOak) then 
			doTeleportThing(cid, positions.kick)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Tell Oldrak about your great victory against the demon oak.")
			doCreatureSetStorage(cid, storages.done, 1)
			return true
		end
 
		if getCreatureStorage(cid, itemEx.itemid) >= (waves and waves > 0 and waves or #summons) + 1 then
			return doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
 
		if math.random(10) > 3 then
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			doCreatureSay(cid, "-krrrrak-", TALKTYPE_MONSTER_YELL, false, cid, getThingPos(itemEx.uid))
			doTargetCombatHealth(0, cid, floorDamage.type, -floorDamage.min, -floorDamage.max, floorDamage.effect)
			return true
		end
 
		local deny = false
		local cbs = 0
		if summons[get] then
			for i = 1, #summons[get] do
				if monsterExists(summons[get][i]) then
					local sPos = positions.summon[math.random(#positions.summon)]
					local thing = getTopCreature(sPos)
					local area
					if isMonster(thing.uid) then
						area = getArea(sPos, 2, 2)
						for _, pos in ipairs(area) do
							if isCreature(getTopCreature(pos).uid) or not isInRange(pos, questAreaPosition[1], questAreaPosition[2]) then
								deny = true
								break
							else
								ret = doCreateMonster(summons[get][i], pos)
								if tonumber(ret) == nil then
									cbs = cbs + 1
								end
								break
							end
						end
					else
						ret = doCreateMonster(summons[get][i], sPos)
						if tonumber(ret) == nil then
							cbs = cbs + 1
						end
					end
				end
			end
 
			if cbs > 0 then
				return doPlayerSendCancel(cid, "There are " .. cbs .. " monster that could not be summoned. Wave has not been counted.")
			end
 
			if not deny then
				doCreatureSetStorage(cid, itemEx.itemid, get + 1)
			end
			if isLastCut(cid) then
				doCreatureSay(cid, "HOW IS THAT POSSIBLE?!? MY MASTER WILL CRUSH YOU!! AHRRGGG!", TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
			else
				doCreatureSay(cid, sounds[2][math.random(1, #sounds[2])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
			end
			doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
			if math.random(100) >= 50 then
				doTargetCombatHealth(0, cid, floorDamage.type, -floorDamage.min, -floorDamage.max, floorDamage.effect)
			end
		end
	return false
	end
end