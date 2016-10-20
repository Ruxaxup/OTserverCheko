local thornsExtraDamage = {
	[2472] = 25,
	[2494] = 50,
	[12603] = 75
}

function onEquip(cid, item, slot)
	local condition = getSpecialCondition(cid,THORNS_ARMOR_CONDITION)
	if(condition == -1) then
		local extraDamage = thornsExtraDamage[item.itemid]
		if(extraDamage ~= nil) then
			addThornsDamage(cid, extraDamage)
			doCreatureSay(cid,"Come and hit me!",MESSAGE_EVENT_ORANGE)
			setThornArmorCondition(cid, true)
		end
	end
	
	return true
end

function onDeEquip(cid, item, slot)
	if(getPlayerGroupId(cid) < 6) then
		local extraDamage = thornsExtraDamage[item.itemid]
		if(extraDamage ~= nil) then
			addThornsDamage(cid, -extraDamage)
			doCreatureSay(cid,"Emm... easy dude!",MESSAGE_EVENT_ORANGE)
			setThornArmorCondition(cid, false)
		end
	end
	return true
end