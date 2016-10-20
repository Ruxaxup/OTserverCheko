local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_FRONT_SWEEP)
setCombatArea(combat, area)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local min = (level / 5) + (skill * attack * 0.04) + 31
	local max = (level / 5) + (skill * attack * 0.08) + 45
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
