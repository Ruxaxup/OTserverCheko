local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
--setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -100, 0, -125)

function onUseWeapon(cid, var)
	local healthAfter
	local target = variantToNumber(var)
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
	
	--Apply Life Steal or Mana Leech
	applyLSorML(cid, healthAfter, maxHealth, target)
	return true
end
