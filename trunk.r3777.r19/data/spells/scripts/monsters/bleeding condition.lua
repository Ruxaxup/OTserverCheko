local combat = {}

for i = 30, 50 do
	local condition = createConditionObject(CONDITION_DROWN)
	setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)

	local damage = i
	addDamageCondition(condition, 1, 4000, -damage)
	for j = 1, 9 do
		damage = damage * 1.2
		addDamageCondition(condition, 1, 4000, -damage)
	end

	combat[i] = createCombatObject()
	setCombatParam(combat[i], COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
	
	setCombatParam(combat[i], COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)

	local area = createCombatArea(AREA_CIRCLE3X3)
	setCombatArea(combat[i], area)
	setCombatCondition(combat[i], condition)
end

function onCastSpell(creature, var)
	return doCombat(cid, combat[math.random(30,50)], var)
end