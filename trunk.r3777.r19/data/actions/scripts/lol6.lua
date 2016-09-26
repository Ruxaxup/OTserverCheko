--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==8005 then
queststatus = getPlayerStorageValue(cid,8900)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"You found a Spellbook of Enlightenment")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,8900,1)
setPlayerStorageValue(cid,8900,1)
end
return 0
end
return 1
end
