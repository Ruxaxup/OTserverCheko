function onUse(cid, item, frompos, item2, topos)
if item.uid == 4042 then
queststatus = getPlayerStorageValue(cid,4042)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Crusader helmet")
item_uid = doPlayerAddItem(cid,2497,1)
setPlayerStorageValue(cid,4042,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end