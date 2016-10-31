function onDeath( cid, corpse, deathlist )
	if(isMonster(cid))then
		local nKillers = #deathlist
		if(nKillers >= 1) then
			for i = 1, #deathlist do
				if(isPlayer(deathlist[i])) then
					print("Killers: "..getCreatureName(deathlist[i]))
					local rewardBag = doPlayerAddItem(deathlist[i], REWARD_BAG_ID, 1)
					addDescription(rewardBag, getItemInfo(REWARD_BAG_ID).description .. " "..getCreatureName(cid)..".")
					doPlayerSendTextMessage(deathlist[i], MESSAGE_INFO_DESCR, "You have received a reward bag for your participation!!!")
				end
			end
		end
	end
	return true
end