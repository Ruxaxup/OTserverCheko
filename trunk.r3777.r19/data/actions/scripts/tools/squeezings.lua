local holes = {468, 481, 483}
local holeId = {294, 369, 370, 383, 392, 408, 409, 427, 428, 430, 462, 469, 470, 482, 484, 485, 489, 924, 3135, 3136, 8276, 8277, 8279, 8280, 8284, 8285}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if toPosition.x == 0 or toPosition.x == 65535 then
        return false
    elseif itemEx.itemid == 2739 then
        doTransformItem(itemEx.uid, 2737)
        doCreateItem(2694, 1, toPosition)
        doDecayItem(itemEx.uid)
    elseif itemEx.itemid == 2782 then
        doTransformItem(itemEx.uid, 2781)
        doDecayItem(itemEx.uid)
    elseif itemEx.itemid == 1499 then
        doRemoveItem(itemEx.uid)
    elseif (itemEx.itemid == 355 or itemEx.itemid == 9025) and (itemEx.uid <= 65535 or itemEx.actionid ~= 0) then
        doTransformItem(itemEx.uid, 392)
        doDecayItem(itemEx.uid)
    elseif itemEx.uid == 60001 then
        doTeleportThing(cid, {x=329, y=772, z=10})
        doSendMagicEffect({x=329, y=772, z=10},10)
    elseif isInArray(holes, itemEx.itemid) then
        doTransformItem(itemEx.uid, itemEx.itemid + 1)
        doDecayItem(itemEx.uid)
    elseif isInArray(holeId, itemEx.itemid) then
        local hole = getThingfromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}).uid
        if hole ~= 0 then
            doTeleportThing(hole, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z})
        end
    elseif table.find({384, 418, 8278}, getThingfromPos(toPosition).itemid) then
        doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1})
    else
        return false
    end
    return true
end