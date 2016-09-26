local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3000)
setConditionFormula(condition, -0.3, 0, -0.3, 0)
setCombatCondition(combat, condition)

function getSpellDamageXena(cid, weaponSkill, weaponAttack, attackStrength)
	local attack = 35 --Spear's attack
	local skill = getPlayerSkill(cid, CONST_SKILL_DISTANCE)

	local maxWeaponDamage = (skill * attack) / 20 + attack
	local damage = -((math.random(0, maxWeaponDamage) * attackStrength) / 20) * 0.8 --0.8 is the multiplier

	return damage, damage --The random part of the formula has already been made, just return the normal damage
end

function xenaHit(param)
	if isCreature(param.cid) == TRUE and isCreature(variantToNumber(param.var)) == TRUE then
		doSendDistanceShoot(param.fromcidpos, getCreaturePosition(variantToNumber(param.var)), CONST_ANI_LARGEROCK)
		doCombat(param.cid, param.combat, param.var)
		param.fromcidpos = getCreaturePosition(variantToNumber(param.var))
		table.insert(param.notHitCidArray, variantToNumber(param.var))
		param.count = param.count + 1
		if (param.lastshot == 0) then
			local enemies = getMonstersInArea3(param.fromcidpos, param.notHitCidArray)
			if (enemies.number > 0) and (param.count < 8) then
				local enemiesList = enemies.list
				local randenemy = math.random(1, enemies.number)
				param.var = numberToVariant(enemiesList[randenemy])
			else
				param.var = numberToVariant(param.cid)
				param.lastshot = 1
			end
			addEvent(xenaHit, 200, param)
		end
	end
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamageXena")

function onCastSpell(cid, var)
	if(variantToNumber(var) ~= 0) then
		if isCreature(variantToNumber(var)) == TRUE then
			local param = {}
			param.cid = cid
			param.fromcidpos = getCreaturePosition(cid)
			param.var = var
			param.combat = combat
			param.count = 0
			param.lastshot = 0
			param.notHitCidArray = {cid}
			addEvent(xenaHit, 1, param)
		end
	end
	return true
end
