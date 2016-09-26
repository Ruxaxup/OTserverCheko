function onSay(cid, words, param, channel)
	local weapon = getPlayerWeapon(cid)
	if(weapon ~= nil) then
		print(param)
		print(weapon.uid)
		local attack = tonumber(param)
		--setItemAttack(weapon.uid, attack)
		doItemSetAttribute(weapon.uid,"attackspeed",attack)
	end
	return true
end