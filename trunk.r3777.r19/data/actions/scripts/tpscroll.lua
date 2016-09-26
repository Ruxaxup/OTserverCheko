function onUse(cid, item, frompos, item2, topos)
ppos = getPlayerPosition(cid)
temple = getPlayerMasterPos(cid)
if (getCreatureCondition(cid, CONDITION_INFIGHT) == FALSE) then
doTeleportThing(cid, temple, TRUE)
doSendMagicEffect(ppos,13)
doSendAnimatedText(frompos,'Bye',251)
else
doPlayerSendCancel(cid,"Can't be used in battle")
doSendMagicEffect(ppos,2)
end
return 1
end