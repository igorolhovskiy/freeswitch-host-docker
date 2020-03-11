local clock = os.clock

function sleep(n)  -- seconds
    local t0 = clock()
    while clock() - t0 <= n do end
  end

if freeswitch then    
    freeswitch.consoleLog("info", "Catch event from test-catch.lua! Sleeping for 10 sec")
    sleep(10)
    freeswitch.consoleLog("info", "Sleep ended! Testing CURL")
    api = freeswitch.API()
    response = api:execute("curl", "10.0.0.1 headers")
    freeswitch.consoleLog("info", response)
else
    file = io.open("/usr/share/freeswitch/scripts/out.log", "a")
    io.output(file)
    io.write("Catch event from test-catch.lua to file!\n")
    io.close(file)
end
