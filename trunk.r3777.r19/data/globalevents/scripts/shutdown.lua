local cyko = {
final_shutdown = 300 --5min until the server gets shutdown
}

function ShutDown()
doSetGameState(GAMESTATE_SHUTDOWN)
return TRUE
end

function ServerClose1()
doSetGameState(GAMESTATE_CLOSED)
addEvent(ShutDown, cyko.final_shutdown*1000)
return TRUE
end

function Save()
doSaveServer()
doBroadcastMessage("Server save, please be patient.")
addEvent(ServerClose1, 5*1000)
return TRUE
end

function ServerClose2()
doBroadcastMessage("Server will go down in 1 minute, please go to a safe zone.")
addEvent(Save, 60*1000)
return TRUE
end

function ServerClose3()
doBroadcastMessage("Server will go down in 2 minutes, please go to a safe zone.")
addEvent(ServerClose2, 60*1000)
return TRUE
end

function ServerClose4()
doBroadcastMessage("Server will go down in 3 minutes, please go to a safe zone.")
addEvent(ServerClose3, 60*1000)
return TRUE
end

function ServerClose5()
doBroadcastMessage("Server will go down in 4 minutes, please go to a safe zone.")
addEvent(ServerClose4, 60*1000)
return TRUE
end

function ServerClose6()
doBroadcastMessage("Server will go down in 5 minutes, please go to a safe zone.")
addEvent(ServerClose5, 60*1000)
return TRUE
end

function ServerClose7()
doBroadcastMessage("Server will go down in 6 minutes, please go to a safe zone.")
addEvent(ServerClose6, 60*1000)
return TRUE
end

function ServerClose8()
doBroadcastMessage("Server will go down in 7 minutes, please go to a safe zone.")
addEvent(ServerClose7, 60*1000)
return TRUE
end

function ServerClose9()
doBroadcastMessage("Server will go down in 8 minutes, please go to a safe zone.")
addEvent(ServerClose8, 60*1000)
return TRUE
end

function ServerClose10()
doBroadcastMessage("Server will go down in 9 minutes, please go to a safe zone.")
addEvent(ServerClose9, 60*1000)
return TRUE
end

function onTimer()
doBroadcastMessage("Server will go down in 10 minutes, please go to a safe zone.")
addEvent(ServerClose10, 60*1000)
return true
end