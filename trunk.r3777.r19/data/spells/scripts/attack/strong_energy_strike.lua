local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)


function onGetFormulaValues(cid, level, skill, attack, factor)
	local min = (level / 5) + (getPlayerMagLevel(cid) * 2.8) + 16
	local max = (level / 5) + (getPlayerMagLevel(cid) * 4.4) + 28
	return -min, -max
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
