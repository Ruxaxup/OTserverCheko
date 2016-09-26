function onAdvance(cid, skill, oldLevel, newLevel)
	--print("Skill Advance: "..skill)
	if (skill == SKILL__LEVEL) then		
		local lastRewardLevel = getPlayerStorageValue(cid,REWARD_STAT_ID)
		if(lastRewardLevel == -1) then
			lastRewardLevel = 0			
		end
		--Multiplo de 5
		if((newLevel % 5) == 0) then
			--Si no se ha recibido el reward
			if(newLevel > lastRewardLevel) then
				if(doPlayerAddStatPoint(cid)) then
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You recived 5 stat points! Use '!stats' to watch and distribute them")
					doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)
					doPlayerSetStorageValue(cid,REWARD_STAT_ID,newLevel)
				else
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have reach the Maximum Stat points you can get. You are kinda OP!!!")
				end
			end
		end
	end

	return true
end
