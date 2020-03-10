file = io.open("/usr/share/freeswitch/scripts/out.log", "a")
io.output(file)

if freeswitch then
    freeswitch.consoleLog("info", "Catch event from test-catch.lua!")
    io.write("Catch event from test-catch.lua to console!\n")
else
    io.write("Catch event from test-catch.lua to file!\n")
end
io.close(file)
