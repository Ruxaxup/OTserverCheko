function onUse(cid, item, frompos, item2, topos)
piece1pos = {x=1222, y=1318, z=8, stackpos=1}
rockpos = {x=1222, y=1318, z=8, stackpos=1}
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 2124 and item.itemid == 3697 and getpiece1.itemid == 5114 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 2124 and item.itemid == 3698 then
doCreateItem(5114,1,rockpos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Desculpe,Nao eh Possivel.")
end
return 1
end

