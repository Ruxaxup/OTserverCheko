function onUse(cid, item, frompos, item2, topos)
if item.uid == 30309 then
queststatus = getPlayerStorageValue(cid,30309)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou todos itens da behe quest")
item_uid = doPlayerAddItem(cid,2520,1)
item_uid = doPlayerAddItem(cid,2466,1)
item_uid = doPlayerAddItem(cid,2427,1)
item_uid = doPlayerAddItem(cid,2171,1)
item_uid = doPlayerAddItem(cid,2168,1)
item_uid = doPlayerAddItem(cid,2145,3)
item_uid = doPlayerAddItem(cid,1294,4)
setPlayerStorageValue(cid,30309,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end