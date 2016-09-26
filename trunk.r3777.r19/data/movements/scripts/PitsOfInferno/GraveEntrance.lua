
function onStepIn(cid, item, frompos, item2, topos) 
 
playerpos = getPlayerPosition(cid) 
novapos = {x=884, y=1332, z=10} 
 
if item.uid == 10200 then
 
getThingfromPos(playerpos) 
doSendMagicEffect(playerpos,2) 
doTeleportThing(cid,novapos) 
doSendMagicEffect(novapos,10) 
end 
end