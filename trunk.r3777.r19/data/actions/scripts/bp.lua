function onUse(cid, item, frompos, item2, topos)
if item.uid == 3029 then
queststatus = getPlayerStorageValue(cid,3029)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou a Orange backpack")
item_uid = doPlayerAddItem(cid,10026,1)
setPlayerStorageValue(cid,3029,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end