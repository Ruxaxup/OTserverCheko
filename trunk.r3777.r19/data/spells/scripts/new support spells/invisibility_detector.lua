local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_INVISIBLE)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)




function onCastSpell(cid, var)
	addEvent(doCombat,1000,cid,combat,var)
	addEvent(doCombat,2000,cid,combat,var)
	addEvent(doCombat,3000,cid,combat,var)
	addEvent(doCombat,4000,cid,combat,var)
	addEvent(doCombat,5000,cid,combat,var)	
	return doCombat(cid, combat, var)
end