local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function onGetFormulaValues(cid, level, skill, attack, factor)
	return -(((skill + 100) / 2) + (level / 20)), -((skill + 250) + (level / 5))
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
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
	if(damage == 0) then
		maxHealth = playerMana
		healthAfter = getCreatureMana(target)
		damage = math.abs(maxHealth - healthAfter)
	end
	--

	applyLSorML(cid, damage, target)
	return ret
end