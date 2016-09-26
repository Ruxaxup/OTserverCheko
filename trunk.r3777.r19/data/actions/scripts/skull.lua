function onUse(cid, item, frompos, item2, topos)
if item.uid == 3035 then
queststatus = getPlayerStorageValue(cid,3035)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Skull staff")
item_uid = doPlayerAddItem(cid,2436,1)
setPlayerStorageValue(cid,3035,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end