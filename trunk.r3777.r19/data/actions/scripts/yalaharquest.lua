-- Inquisition chests

function onUse(cid, item, frompos, item2, topos)

       if item.uid == 41002 then
           queststatus = getPlayerStorageValue(cid,41002)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found Elite Draken Helmet")
               doPlayerAddItem(cid,12606,1)
               setPlayerStorageValue(cid,41002,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 41003 then
           queststatus = getPlayerStorageValue(cid,41003)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Royal Scale Robe")
               doPlayerAddItem(cid,12604,1)
               setPlayerStorageValue(cid,41003,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end
       elseif item.uid == 41004 then
           queststatus = getPlayerStorageValue(cid,41004)
           if queststatus == -1 then
               doPlayerSendTextMessage(cid,22,"You have found a Royal Draken Mail")
               doPlayerAddItem(cid,12603,1)
               setPlayerStorageValue(cid,41004,1)
           else
               doPlayerSendTextMessage(cid,22,"It is empty.")
           end

    else
        return 0
       end

       return 1
end