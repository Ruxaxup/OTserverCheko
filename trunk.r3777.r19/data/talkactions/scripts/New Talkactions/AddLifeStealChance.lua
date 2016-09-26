function onSay(cid, words, param, channel)
	if(doPlayerAddLifeStealChancePoint(cid)) then		
		doPlayerSpendStatPoint(cid)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Stat points left: " .. getPlayerStatPoints(cid))	
		return TRUE
	else
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_BLOCKHIT)
		return TRUE
	end

end
