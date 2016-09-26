function onStepIn(cid, item, position, fromPosition)

--Config-->
local starting={x = 2016, y = 1058, z = 10, stackpos = 253}
ending={x = 2026, y = 1070, z = 10, stackpos = 253}
local checking = {x = starting.x, y = starting.y, z = starting.z, stackpos = starting.stackpos}
local queststatus = getPlayerStorageValue(cid, 4765) --Value ID OF QUEST WHEN YOU HAVE CATCH THE ITEM
local player_pos_entrada = {x = 2022, y = 1072, z = 10}
--EndConfig-->

--Do not touch this--
if getPlayerLookDir(cid) == 0 then
newdir = 2
elseif getPlayerLookDir(cid) == 1 then
newdir = 3
elseif getPlayerLookDir(cid) == 2 then
newdir = 0
else
newdir = 1
end
--Don't edit this unless you know what you are doing.

if item.actionid == 1974 and queststatus == -1 then
doCreatureSay(cid, "It seems by defeating Azarus you have stopprd this army from entering your world! Better leave this ghastly place forever.", TALKTYPE_ORANGE_1)
setPlayerStorageValue(cid, 4765, 1) --Value ID WHAT THE PLAYER CAN ENTER THE DOOR WHERE ARE THE REWARDS
return TRUE
end

if item.actionid == 1973 and queststatus == -1 then
totalmonsters = 0
monster = {}

repeat
creature = getThingfromPos(checking)

if creature.itemid > 0 then
if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
totalmonsters = totalmonsters + 1
monster[totalmonsters] = creature.uid
end
end

checking.x = checking.x + 1

if checking.x > ending.x then
checking.x = starting.x
checking.y = checking.y + 1
end

until checking.y > ending.y

if totalmonsters ~= 0 then
current = 0
repeat
current = current + 1
doRemoveCreature(monster[current])
until current >= totalmonsters
end

doTeleportThing(cid, player_pos_entrada)
doSendMagicEffect(player_pos_entrada, 10)

else
doMoveCreature(cid, newdir)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Someone has already done this quest.')
end
end