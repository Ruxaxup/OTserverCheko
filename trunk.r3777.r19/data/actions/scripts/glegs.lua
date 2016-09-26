function onUse(cid, item, frompos, item2, topos)
if item.uid == 4950 then
queststatus = getPlayerStorageValue(cid,4950)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Parabens voce achou uma g-legs")
item_uid = doPlayerAddItem(cid,2470,1)
setPlayerStorageValue(cid,4950,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end