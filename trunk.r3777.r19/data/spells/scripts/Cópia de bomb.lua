local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 61)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.6, -50, -1.8, 0)

local area = createCombatArea(AREA_CROSS5X5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end