function onUse(cid, item, frompos, item2, topos)
if item.uid == 4045 then
queststatus = getPlayerStorageValue(cid,4045)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou 2 items")
item_uid = doPlayerAddItem(cid,2519,1)
item_uid = doPlayerAddItem(cid,2487,1)
setPlayerStorageValue(cid,4045,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end