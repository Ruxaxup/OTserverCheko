local BlindField = {x=2019, y=1055, z=10, stackpos=1}

function mapArea(fromPos, toPos, stack)
        local pos = {x=fromPos.x, y=fromPos.y-1, z=fromPos.z}
        return function()
                if (pos.y < toPos.y) then
                        pos.y = pos.y+1
                elseif (pos.x <= toPos.x) then
                        pos.y = fromPos.y
                        pos.x = pos.x+1
                else
                        pos.x = fromPos.x
                        pos.y = fromPos.y
                        pos.z = pos.z+1
                end
                if (pos.x <= toPos.x and pos.y <= toPos.y or pos.z < toPos.z) then
                        if (stack == nil) then
                                return pos
                        else
                                pos.stackpos = stack
                                --return pos, getTileThingByPos(pos)
                                return pos, getThingfromPos(pos)
                        end
                end
        end
end

function getMonstersfromArea(fromPos, toPos)
        local monsters = {}    
        for _, thing in mapArea(fromPos, toPos, 253) do
                if isMonster(thing.uid) == TRUE then
                        table.insert(monsters, thing.uid)
            end

        end
          local bfm = getThingfromPos(BlindField)
            if isMonster(bfm.uid) == TRUE then
            table.insert(monsters, bfm.uid)
            end
        return monsters
end

function onUse(cid, item, fromPosition, itemEx, toPosition)

local topLeft = {x=2013, y=1556, z=10}
local buttomRight = {x=2030, y=1074, z=10}

local monsters = getMonstersfromArea(topLeft, buttomRight)
local monsters1 = getMonstersfromArea(topLeft, buttomRight)

local tp = {x=2021, y=1073, z=10}

local glo = {x=2021, y=1064, z=10}

function FirstWave()
    doSummonCreature("Rift Worm", {x= glo.x - 4,y=glo.y,z=glo.z})

    doSummonCreature("Rift Worm", {x= glo.x + 4,y=glo.y,z=glo.z})

    doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 4,z=glo.z})

    doSummonCreature("Rift Worm", {x=glo.x,y=glo.y - 4,z=glo.z})

    doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 5,z=glo.z})

    doSummonCreature("Azerus", {x=glo.x,y=glo.y - 5,z=glo.z})
end

function SecondWave()
local monsters1 = getMonstersfromArea(topLeft, buttomRight)

    for _, monster in pairs(monsters1) do
    if getCreatureName(monster) == "Azerus" then
    doRemoveCreature(monster)
    end
    end
    doSummonCreature("Azerus1", {x=glo.x,y=glo.y - 5,z=glo.z})

    doSummonCreature("Rift Brood", {x= glo.x - 4,y=glo.y,z=glo.z})

    doSummonCreature("Rift Brood", {x= glo.x + 4,y=glo.y,z=glo.z})

    doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 4,z=glo.z})

    doSummonCreature("Rift Brood", {x=glo.x,y=glo.y - 4,z=glo.z})

    doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 5,z=glo.z})
end
function ThirdWave()
local monsters1 = getMonstersfromArea(topLeft, buttomRight)

    for _, monster in pairs(monsters1) do
    if getCreatureName(monster) == "Azerus" then
    doRemoveCreature(monster)
    end
    end
    doSummonCreature("Azerus2", {x= glo.x - 5,y=glo.y,z=glo.z})

    doSummonCreature("Rift Scythe", {x= glo.x - 4,y=glo.y,z=glo.z})

    doSummonCreature("Rift Scythe", {x= glo.x + 4,y=glo.y,z=glo.z})
end

function ThirdWave1() 

    doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 4,z=glo.z})

    doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y - 4,z=glo.z})

    doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 5,z=glo.z})
end

function FourthWave()
local monsters1 = getMonstersfromArea(topLeft, buttomRight)

    for _, monster in pairs(monsters1) do
    if getCreatureName(monster) == "Azerus" then
    doRemoveCreature(monster)
    end
    end
    doSummonCreature("Azerus3", {x= glo.x - 5,y=glo.y,z=glo.z})

    doSummonCreature("War Golem", {x= glo.x - 4,y=glo.y,z=glo.z})

    doSummonCreature("War Golem", {x= glo.x + 4,y=glo.y,z=glo.z})

    doSummonCreature("War Golem", {x=glo.x,y=glo.y - 4,z=glo.z})

    doSummonCreature("War Golem", {x=glo.x,y=glo.y + 4,z=glo.z})

end

function Glllobe()
item1 = getTileItemById(glo,9767)
doSetItemActionId(item1.uid, 58261)
end

if item.actionid == 58261 then
doSetItemActionId(item.uid, 58263)
local monsters = getMonstersfromArea(topLeft, buttomRight)
local monsters1 = getMonstersfromArea(topLeft, buttomRight)

if getTileItemById(tp,1387).itemid == 1387 then
doRemoveItem(getTileItemById(tp,1387).uid)
end

addEvent(FirstWave, 0)
addEvent(SecondWave, 10000)
addEvent(ThirdWave, 20000)
addEvent(ThirdWave1, 24000)
addEvent(FourthWave, 38000)
addEvent(Glllobe, 900000)

elseif item.actionid == 58263 then
doCreatureSay(cid, "You have to wait some time before this globe will charge.", TALKTYPE_ORANGE_1)
end

return TRUE
end