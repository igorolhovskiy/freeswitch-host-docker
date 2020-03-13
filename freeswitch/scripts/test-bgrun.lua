local clock = os.clock

function sleep(n)  -- seconds
    local t0 = clock()
    while clock() - t0 <= n do end
  end

if freeswitch then    
    freeswitch.consoleLog("info", "[BGRUN] Started. Sleeping for 10 sec")
    sleep(10)
    freeswitch.consoleLog("info", "[BGRUN] Sleep ended! Testing CURL")
    api = freeswitch.API()
    response = api:execute("curl", "10.0.0.1 headers")
    freeswitch.consoleLog("info", "[BGRUN]" .. response)
else
    file = io.open("/usr/share/freeswitch/scripts/out.log", "a")
    io.output(file)
    io.write("[BGRUN] Cannot get freeswitch object!\n")
    io.close(file)
end
