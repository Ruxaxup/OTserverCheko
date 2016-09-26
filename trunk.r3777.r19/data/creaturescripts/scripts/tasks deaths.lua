function onKill(cid, target, lastHit)

	local name = string.lower(getCreatureName(target))
	local v = TASKS_INFO[name]
	if v then
		if(getPlayerStorageValue(cid, v.s) == -1) then
			setPlayerStorageValue(cid, v.s, 0)
		end
		if (getCreatureName(target) and getPlayerStorageValue(cid, v.s) ~= -2) then			
			setPlayerStorageValue(cid, v.s, getPlayerStorageValue(cid, v.s)+1)
			local totalKilled = getPlayerStorageValue(cid, v.s)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have killed a " .. getCreatureName(target) .. ".("..totalKilled.."/"..v.count..")")
			if getPlayerStorageValue(cid, v.s) >= v.count then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "You have killed " .. v.count .." !!!. Claim your reward.")
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)
			end
		end
	end
	return true
end