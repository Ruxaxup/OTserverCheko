function onUse(cid, item, frompos, item2, topos)
if item.uid == 7457 then
queststatus = getPlayerStorageValue(cid,7457)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found a Necromancer Shield.")
doPlayerAddItem(cid,6433,1 )
setPlayerStorageValue(cid,7457,1)
else
doPlayerSendTextMessage(cid,22,"It's Empty!")
end
else
return 0
end
return 1
end 