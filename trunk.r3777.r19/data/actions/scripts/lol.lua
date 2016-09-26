--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==8887 then
queststatus = getPlayerStorageValue(cid,7899)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,7899,1)
setPlayerStorageValue(cid,7899,1)
end
return 0
end
return 1
end
