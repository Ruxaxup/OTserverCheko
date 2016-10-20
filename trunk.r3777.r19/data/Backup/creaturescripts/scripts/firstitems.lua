  local commonItems = {
  -- ITEMS ALL VOCS RECEIVE
  {itemid=2480, count=1}, -- legion helmet
  {itemid=2464, count=1}, -- chain armor
  {itemid=2468, count=1}, -- studded legs
  {itemid=2643, count=1}, -- leather boots
  {itemid=2120, count=1}, -- rope
  {itemid=5710, count=1} -- shovel
}

local firstItems = {
  { -- SORC ITEMS
    {itemid=2190, count=1}, -- wand of vortex
    {itemid=2175, count=1} -- spellbook
  },
  { -- DRUID ITEMS
    {itemid=2182, count=1}, -- snakebite rod
    {itemid=2175, count=1} -- spellbook
  },
  { -- PALADIN ITEMS
    {itemid=2456, count=1}, -- bow
    {itemid=2544, count=100} -- 100 arrows
  },
  { -- KNIGHT ITEMS
    {itemid=2412, count=1}, -- katana
    {itemid=2530, count=1} -- copper shield
  }
}

for _, items in ipairs(firstItems) do
  for _, item in ipairs(commonItems) do
    table.insert(items, item)
  end
end

local storage = 35353
function onLogin(cid)
        if getPlayerGroupId(cid) < 3 then
        local receivedItems = getPlayerStorageValue(cid, storage)
                if receivedItems == -1 then
                --[[local backpack = ]]doPlayerAddItem(cid, 1988, 1)
                local giveItems = firstItems[getPlayerVocation(cid)]
                        if giveItems ~= nil then
                        for _, v in ipairs(giveItems) do
                                --doAddContainerItem(backpack, v.itemid, v.count or 1)
                                doPlayerAddItem(cid, v.itemid, v.count or 1)
                        end
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have recieved your first items!")
                end
                setPlayerStorageValue(cid, storage, 1)
        end
        return true
end 