stime = 60 -- Tempo entre as execu��es do comando (em segundos).
time = os.clock()

function onThink()
if (time + stime) < os.clock() then
time = os.clock()
selfSay("/clean")
end
end