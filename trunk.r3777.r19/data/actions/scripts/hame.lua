function onUse(cid, item, frompos, item2, topos)
if item.uid == 4046 then
queststatus = getPlayerStorageValue(cid,4046)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um dragon hammer")
item_uid = doPlayerAddItem(cid,2434,1)
setPlayerStorageValue(cid,4046,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end