function onUse(cid, item, frompos, item2, topos)
piece1pos = {x=941, y=1228, z=9, stackpos=1}
rockpos = {x=941, y=1228, z=9, stackpos=1}
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 4951 and item.itemid == 1945 and getpiece1.itemid == 5474 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 4951 and item.itemid == 1946 then
doCreateItem(5474,1,rockpos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Desculpe,Nao eh Possivel.")
end
return 1
end

