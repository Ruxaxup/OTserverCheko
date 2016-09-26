function onUse(cid, item, frompos, item2, topos)
if item.uid == 1011 then
queststatus = getPlayerStorageValue(cid,1015)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"D-lair quest completa!")
item_uid = doPlayerAddItem(cid,2432,1)
setPlayerStorageValue(cid,1015,1)


else
doPlayerSendTextMessage(cid,22,"Vazio.")
end
else
return 0
end
return 1
end