function onUse(cid, item, frompos, item2, topos)
if item.uid == 3036 then
queststatus = getPlayerStorageValue(cid,3036)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Blue robe")
item_uid = doPlayerAddItem(cid,2656,1)
setPlayerStorageValue(cid,3036,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end