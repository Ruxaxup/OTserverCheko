function onStepIn(cid, item, pos)

if getPlayerLevel(cid) < 60 and getPlayerAccess(cid) < 1 then
  doPlayerSendCancel(cid,"Apenas jogadores com level 60 ou maior podem passar.")
  doSendMagicEffect(pos, 2)
  pos.y = pos.y+1
  doTeleportThing(cid, pos)
  doSendMagicEffect(pos, 2)
end
end