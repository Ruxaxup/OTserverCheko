--function by Armageddom--
function onStepIn(cid, item, frompos, item2, topos) 

playerpos = getPlayerPosition(cid) 
novapos = {x=434, y=1361, z=8} 

if item.uid == 10237 then

getThingfromPos(playerpos) 
doSendMagicEffect(playerpos,2) 
doTeleportThing(cid,novapos) 
doSendMagicEffect(novapos,10) 
end 
end