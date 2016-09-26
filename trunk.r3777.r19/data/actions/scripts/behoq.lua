function onUse(cid, item, frompos, item2, topos)
if item.uid == 3031 then
queststatus = getPlayerStorageValue(cid,3031)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um beholder shield")
item_uid = doPlayerAddItem(cid,2518,1)
setPlayerStorageValue(cid,3031,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end