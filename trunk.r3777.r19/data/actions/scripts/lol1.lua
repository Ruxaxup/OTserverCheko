--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==8886 then
queststatus = getPlayerStorageValue(cid,7900)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"You Found a Magma Monocle")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,7900,1)
setPlayerStorageValue(cid,7900,1)
end
return 0
end
return 1
end
