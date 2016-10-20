local healing = 20
local ticks = 3000
local duration = 1 * 60 * 1000
local time =  duration / ticks-- seconds

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)


local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, healing)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, ticks)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)


setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
