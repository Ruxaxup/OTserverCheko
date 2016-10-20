local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0, 0, 1.0, 0)

function onUseWeapon(cid, var)
	local healthAfter
	local target = variantToNumber(var)	
	
	if(target == 0) then
		return doCombat(cid, combat, var)
	end
	
	local playerMana = getCreatureMana(target)
	local maxHealth = getCreatureHealth(target)
	local ret = doCombat(cid, combat, var)
	
	if(ret == false) then
		return false
	end

	if (variantToNumber(var) == 0) then
		healthAfter = maxHealth
	else
		healthAfter = getCreatureHealth(target)	
	end

	local damage = math.abs(maxHealth - healthAfter)
	if(damage == 0 and playerMana ~= nil) then
		maxHealth = playerMana
		healthAfter = getCreatureMana(target)
		damage = math.abs(maxHealth - healthAfter)
	end
	--

	applyLSorML(cid, damage, target)

	return ret
end
