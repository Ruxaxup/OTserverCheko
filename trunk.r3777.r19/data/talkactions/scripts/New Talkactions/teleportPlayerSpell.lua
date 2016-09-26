local condition = createConditionObject(CONDITION_EXHAUST)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)

function onSay(cid, words, param, channel)

	if hasCondition(cid, CONDITION_EXHAUST) == true then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
      	doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)      
      	return true
   	end

	local level = getPlayerLevel(cid)
	local vocation = getPlayerVocation(cid)
	local isPz = isPlayerPzLocked(cid)

	local comillas = string.sub(param,1,1)
	if(comillas ~= '"') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Example: utito tp \"GM Mexicano.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return true
	end
	
	param = string.gsub(param,"\"","")
	
	if(param == '') then
		doPlayerSendCancel(cid, "Spell requires a player.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return true
	end

	local player = getPlayerByNameWildcard(param)
	local waypoint = getWaypointPosition(param)
	local pos = {x = 0, y = 0, z = 0}

	if(player ~= nil and (not isPlayerGhost(player) or getPlayerGhostAccess(player) <= getPlayerGhostAccess(cid))) then
		pos = getCreaturePosition(player)
	else
		doPlayerSendCancel(cid, "Offline player or invalid name.")
		return true
	end

	if(not pos or isInArray({pos.x, pos.y}, 0)) then
		doPlayerSendCancel(cid, "Destination not reachable.")
		return true
	end

	pos = getClosestFreeTile(cid, pos, true, false)
	if(not pos or isInArray({pos.x, pos.y}, 0)) then
		doPlayerSendCancel(cid, "Cannot perform action.")
		return true
	end

-- Momento de hacer la TP
	local tmp = getCreaturePosition(cid)
	local distance = getDistanceBetween(tmp, pos)
	local manaSpent = distance * (level / 6)
	local mana = getCreatureMana(cid)

	if (mana < manaSpent) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return true
	end

	if(doTeleportThing(cid, pos, true) and not isPlayerGhost(cid)) then
	-- Nos basaremos en la distancia para hacer el gasto de Mana.		
		doAddCondition(cid, condition)
		--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Distance: " .. distance)
		--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "ManaSpent: " .. manaSpent)
		doSendMagicEffect(tmp, CONST_ME_MAGIC_BLUE)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
		doCreatureAddMana(cid, -manaSpent)
	end

	return true
end