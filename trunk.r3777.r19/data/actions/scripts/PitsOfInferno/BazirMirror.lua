function onUse(cid, item, frompos, item2, topos)
if item.uid == 10273 then
if item.itemid == 1850 then

  nplayer1pos = {x=835, y=1391, z=13}
  doTeleportThing(cid,nplayer1pos)
  doSendMagicEffect(nplayer1pos,10)
  doSendMagicEffect(topos,6)
  doSendMagicEffect(frompos,6)

end
end
return 1
end