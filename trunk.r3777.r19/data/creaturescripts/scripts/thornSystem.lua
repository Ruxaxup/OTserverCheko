function onStatsChange(cid, attacker, type, combat, value)
	if(isPlayer(cid)) then
		local thornsDamage = getPlayerStorageValue(cid,THORNS_ID)
		local damageType = type
		if(thornsDamage > 0 and damageType == STATSCHANGE_HEALTHLOSS and combat == COMBAT_PHYSICALDAMAGE) then --Si tiene thorn damage, fue un evento de perdida de salud y es daño fisico
			if(isCreature(attacker) or isPlayer(attacker)) then
				local min = value * (thornsDamage / 100)
				local max = min
				doTargetCombatHealth(cid, attacker, COMBAT_PHYSICALDAMAGE, -min, -max, CONST_ME_REDENERGY)
			end
		end		
	end
	return true
end