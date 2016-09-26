local combat1 = createCombatObject()
local combat2 = createCombatObject()

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 0)
local condition1 = createConditionObject(CONDITION_HASTE)
setConditionParam(condition1, CONDITION_PARAM_TICKS, 10000)
--setConditionParam(condition1, CONDITION_PARAM_SPEED, 500)
setConditionFormula(condition1, 1.8, -10, 2.1, -12)
setCombatCondition(combat1, condition1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)
local condition2 = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition2, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition2, CONDITION_PARAM_SKILL_DISTANCE, -200)
setConditionParam(condition2, CONDITION_PARAM_SKILL_SHIELD, 100)
setConditionParam(condition2, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat2, condition2)

local function onCastSpell1(parameters)
    doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters)
    doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var) 
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters) 
addEvent(onCastSpell2, 2, parameters)

end