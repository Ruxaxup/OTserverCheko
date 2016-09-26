--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==8006 then
queststatus = getPlayerStorageValue(cid,2432)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"You found a Fire Axe")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,2432,1)
setPlayerStorageValue(cid,2432,1)
end
return 0
end
return 1
end
