--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==8004 then
queststatus = getPlayerStorageValue(cid,7891)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"You Found a Magma boots")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,7891,1)
setPlayerStorageValue(cid,7891,1)
end
return 0
end
return 1
end
