function onUse(cid, item, frompos, item2, topos)

if item.uid == 10263 and item.itemid == 1945 then
doTransformItem(item.uid,item.itemid+1)
doSendMagicEffect(getPlayerPosition(cid),2)
doTeleportThing(cid,{x=860, y=1340, z=13})
doSendMagicEffect({x=860, y=1340, z=13},10)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 10263 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end  
