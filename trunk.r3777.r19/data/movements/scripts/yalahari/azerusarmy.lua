function onStepIn(cid, item, position, fromPosition)
if item.actionid == 58262 then
if getPlayerStorageValue(cid,    102505) == 1  then        
doCreatureSay(cid, "It seems by defating Azerus you have stopped this army from entering your world! Better leave this gastly place forever.", TALKTYPE_ORANGE_1)
setPlayerStorageValue(cid, 102503, 3) -- Finishing Quest
setPlayerStorageValue(cid, 102500, 5)
elseif getPlayerStorageValue(cid,    102504) == 1 then        
doCreatureSay(cid, "It seems by defating Azerus you have stopped this army from entering your world! Better leave this gastly place forever.", TALKTYPE_ORANGE_1)
setPlayerStorageValue(cid, 102502, 3) -- Finishing Quest
setPlayerStorageValue(cid, 102500, 5)
else
doCreatureSay(cid, "It seems by defating Azerus you have stopped this army from entering your world! Better leave this gastly place forever.", TALKTYPE_ORANGE_1)
end
end
return TRUE
end