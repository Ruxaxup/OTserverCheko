function onSay(cid, words, param, channel)
	local statPoints = getPlayerStatPoints(cid)
	local lifeStealPoints = getPlayerLifeStealPoints(cid) * 100
	local manaLeechPoints = getPlayerManaLeechPoints(cid) * 100
	local lifeStealChance = getPlayerLifeStealChancePoints(cid)
	local manaLeechChance = getPlayerManaLeechChancePoints(cid)
	local thorns		  = getThornDamage(cid)
	local str = ""

	local msg_statPoints 		= "[] You have "..statPoints.." points left."
	local msg_lifeStealPoints	= "[] Your Life Steal is "..lifeStealPoints.."% / ".. (MAX_LIFESTEAL * 100) .. "%. --> Command: !als"
	local msg_manaLeechPoints	= "[] Your Mana Leech is "..manaLeechPoints.."% / ".. (MAX_MANALEECH * 100) .. "%. --> Command: !aml"
	local msg_lsChancePoints 	= "[] Your Life Steal Chance is "..lifeStealChance.."% / ".. LS_MAXCHANCE .. "%. --> Command: !alsc" 
	local msg_mlChancePoints 	= "[] Your Mana Leech Chance is "..manaLeechChance.."% / ".. ML_MAXCHANCE .. "%. --> Command: !amlc"
	local msg_thornsDamage	 	= "[] Your Thorns Damage is "..thorns.."%, that will reflect all physical damage to enemies."

	if(not getCreatureCondition(cid, CONDITION_INFIGHT)) then
		str = "[========== STAT POINTS ==========]\n"
		str = str .. msg_statPoints .. "\n"
		str = str .. msg_lifeStealPoints .. "\n"
		str = str .. msg_manaLeechPoints .. "\n"
		str = str .. msg_lsChancePoints .. "\n"
		str = str .. msg_mlChancePoints .. "\n"
		if(thorns > 0) then
			str = str .. msg_thornsDamage .. "\n"
		end
		str = str .. "[=================================]\n"
		doPlayerPopupFYI(cid, str)
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[========== STAT POINTS ==========]")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msg_statPoints)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msg_lifeStealPoints)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msg_lsChancePoints)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg_manaLeechPoints)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg_mlChancePoints)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[=================================]")
		if(thorns > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msg_thornsDamage)
		end
	end
	return true
end