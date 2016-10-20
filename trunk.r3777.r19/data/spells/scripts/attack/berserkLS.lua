local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onTargetTile(cid, pos)
	local level = getPlayerLevel(cid)
	local weapon = getPlayerWeapon(cid)
	local wType = getItemWeaponType(weapon.uid)
	local skill = getPlayerSkillLevel(cid,SKILLBYWEAPON[wType])
	local attack = getItemInfo(weapon.itemid).attack
	local newAttack = tonumber(getItemAttribute(weapon.uid, "attack"))
	if(newAttack ~= nil) then
		attack = newAttack
	end
	local skillTotal, levelTotal = skill + attack, level / 5

	local creatureTable = {}
    --local n, i = Tile({x=pos.x, y=pos.y, z=pos.z}).creatures, 1
    local n,i = getTileInfo({x=pos.x, y=pos.y, z=pos.z}).creatures, 1
    if n ~= 0 then
        local v = getThingfromPos({x=pos.x, y=pos.y, z=pos.z, stackpos=i}).uid
        while v ~= 0 do
            if isCreature(v) == true then
                table.insert(creatureTable, v)
                if n == #creatureTable then
                    break
                end
            end
            i = i + 1
            v = getThingfromPos({x=pos.x, y=pos.y, z=pos.z, stackpos=i}).uid
        end
    end
    if #creatureTable ~= nil and #creatureTable > 0 then
        for r = 1, #creatureTable do
            if creatureTable[r] ~= cid then
                local target = creatureTable[r]
				
                local min = -(skillTotal * 0.5 + levelTotal)
		        local max = -(skillTotal * 1.5 + levelTotal)
				--print("Min: "..min..", Max: "..max)

				local healthAfter
				local manaAfter = getCreatureMana(target)
				if(target == 0) then
					return doCombat(cid, combat, var)
				end

				local maxHealth = getCreatureHealth(target)
				--COMBAT
				doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, min, max, CONST_ME_HITAREA)

				healthAfter = getCreatureHealth(target)

				local damage = math.abs(maxHealth - healthAfter)
				if(damage == 0) then
					damage = math.abs(getCreatureMana(target) - manaAfter)
				else
					applyLSorML(cid, damage, target)	
				end

				
            end
        end
    end
    
end

setCombatCallback(combat,CALLBACK_PARAM_TARGETTILE,"onTargetTile")

function onCastSpell(cid, var)
	return doCombat(cid, combat, positionToVariant(getCreaturePosition(cid)))
end


