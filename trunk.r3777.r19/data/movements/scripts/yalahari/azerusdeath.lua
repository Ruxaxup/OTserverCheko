function onStepIn(cid, item, position, fromPosition)

local yalahar = {x=2019, y=1068, z=14, stackpos=253}

        if item.itemid == 9738 then
        doTeleportThing(cid, yalahar, TRUE)
        doSendMagicEffect(yalahar,12)
        end
    
    return TRUE
end  