function onCombat(cid, target)
    -- This should block all damage monster cause on eachother expect player summons    
    if isMonster(cid) and isMonster(target) then
        local master = getCreatureMaster(cid)   
        if master ~= nil then
			print("Master: "..getCreatureName(master))
        end     
        if not master or not isPlayer(master) then
            return false
        end
    end
    return true
end