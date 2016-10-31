function onPrepareDeath(cid,deathlist) -- Script by mock the bear
    if(isMonster(cid)) then
    	print("Name: "..getCreatureName(cid))
    	doCreatureSetDropLoot(cid, false)
    end
    return true
end