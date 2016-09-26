function onUse(cid, item, frompos, item2, topos)
if item.uid == 4952 then
queststatus = getPlayerStorageValue(cid,4952)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você pegou todos itens da banshe quest!")
item_uid = doPlayerAddItem(cid,2195,1)
item_uid = doPlayerAddItem(cid,2393,1)
item_uid = doPlayerAddItem(cid,2528,1)
item_uid = doPlayerAddItem(cid,2165,1)
item_uid = doPlayerAddItem(cid,2197,1)
item_uid = doPlayerAddItem(cid,2160,1)
setPlayerStorageValue(cid,4952,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end