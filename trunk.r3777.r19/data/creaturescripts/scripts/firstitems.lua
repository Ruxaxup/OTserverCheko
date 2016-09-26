local commonItems = {
  -- ITEMS ALL VOCS RECEIVE
  {itemid=2120, count=1}, -- rope
  {itemid=5710, count=1}, -- shovel
  {itemid=2420, count=1}, -- machete
  {itemid=2789, count=10}, -- brown mushrooms
  {itemid=2305, count=1}, -- fire bomb rune
  {itemid=2261, count=1}, -- destroy field rune
}

local firstItems = {
  { -- SORC ITEMS
    {itemid=2323, count=1}, -- hat of the mad
    {itemid=8871, count=1}, -- focus cape
    {itemid=7730, count=1}, -- blue legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=8902, count=1}, -- spellbook of mind control
    {itemid=2187, count=1}, -- wand of inferno 

    {itemid=2268, count=1}, -- sd
    {itemid=2273, count=1}, -- uh
    {itemid=7590, count=1}, -- gmp
    {itemid=2293, count=1}, -- mw
  },
  { -- DRUID ITEMS
    {itemid=2323, count=1}, -- hat of the mad
    {itemid=8871, count=1}, -- focus cape
    {itemid=7730, count=1}, -- blue legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=8902, count=1}, -- spellbook of mind control
    {itemid=2183, count=1}, -- hailstorm rod  

    {itemid=2268, count=1}, -- sd
    {itemid=2273, count=1}, -- uh
    {itemid=7590, count=1}, -- gmp
    {itemid=2293, count=1}, -- mw
    {itemid=2269, count=1}, -- wg
    {itemid=2278, count=1}, -- para
  },
  { -- PALADIN ITEMS
    {itemid=2493, count=1}, -- demon helmet
    {itemid=8891, count=1}, -- paladin armor
    {itemid=7730, count=1}, -- blue legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=2514, count=1}, -- mastermind shield
    {itemid=7368, count=1}, -- assassin stars

    {itemid=2268, count=1}, -- sd
    {itemid=2273, count=1}, -- uh
    {itemid=8472, count=1}, -- gsp
    {itemid=7589, count=1}, -- smp
    {itemid=7588, count=1}, -- shp
    {itemid=2293, count=1}, -- mw
  },
  { -- KNIGHT ITEMS
    {itemid=2493, count=1}, -- demon helmet
    {itemid=2472, count=1}, -- magic plate armor
    {itemid=2470, count=1}, -- golden legs
    {itemid=2195, count=1}, -- boots of haste
    {itemid=2514, count=1}, -- mastermind shield
    {itemid=2400, count=1}, -- magic sword

    {itemid=7620, count=1}, -- mp
    {itemid=7591, count=1}, -- ghp
    {itemid=8473, count=1}, -- uhp
    {itemid=2273, count=1}, -- uh
    {itemid=2293, count=1}, -- mw
  }
}

for _, items in ipairs(firstItems) do
  for _, item in ipairs(commonItems) do
    table.insert(items, item)
  end
end

function onLogin(cid)
  if getPlayerGroupId(cid) < 2 then
    local hasReceivedFirstItems = getPlayerStorageValue(cid, 67708)

    if hasReceivedFirstItems ~= 1 then
      --[[local backpack = ]]doPlayerAddItem(cid, 1988, 1)

      local giveItems = firstItems[getPlayerVocation(cid)]

      if giveItems ~= nil then
        for _, v in ipairs(giveItems) do
          --doAddContainerItem(backpack, v.itemid, v.count or 1)
          doPlayerAddItem(cid, v.itemid, v.count or 1)
        end        
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have recieved your first items!")
      end
      setPlayerStorageValue(cid, 67708, 1)
    end
  end
  return TRUE
end