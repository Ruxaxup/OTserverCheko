local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -10, -1, -20, 5, 5, 1.4, 2.1)

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
