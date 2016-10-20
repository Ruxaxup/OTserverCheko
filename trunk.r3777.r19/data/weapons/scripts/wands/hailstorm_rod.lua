local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
--setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -75, 0, -100)

function onUseWeapon(cid, var)
	local healthAfter
	local target = variantToNumber(var)
	local maxHealth = getCreatureHealth(target)
	local playerMana = getCreatureMana(target)
	
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
	return true
end
