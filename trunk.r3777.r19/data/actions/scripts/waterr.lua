function onUse(cid, item, frompos, item2, topos)
if item.uid == 4040 then
queststatus = getPlayerStorageValue(cid,4040)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Helmet of the Deep")
item_uid = doPlayerAddItem(cid,5461,1)
setPlayerStorageValue(cid,4040,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end