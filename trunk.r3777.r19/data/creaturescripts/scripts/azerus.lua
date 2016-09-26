local config = {
    message = "Azerus ran into teleporter! It will disappear in 2 minutes. Enter It!",
    teleportId = 1387,
    bosses = { -- Monster Name, Teleport To Position, Teleport Position
        ["Azerus"] = {{x=2021, y=1075, z=9}, {x=2021, y=1073, z=10}},



            }
}

function onDeath(cid, corpse, killer)
    local position = getCreaturePosition(cid)
    for name, pos in pairs(config.bosses) do
        if name == getCreatureName(cid) then

        doCreateTeleport(config.teleportId, pos[1], pos[2])
        doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
        end
    end
    return TRUE
end  