local nonDieDelay = 60*3 --- 3 minuts
function onPrepareDeath(cid,aa) -- Script by mock the bear
        if getWorldUpTime() <= nonDieDelay then
                doCreatureAddHealth(cid,getCreatureMaxHealth(cid))
                doCreatureAddMana(cid,getCreatureMaxMana(cid))
                doTeleportThing(cid,getTownTemplePosition(getPlayerTown(cid)))
                doRemoveCreature(cid)
                return false
        end
        return true
end