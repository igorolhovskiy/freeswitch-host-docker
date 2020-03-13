freeswitch.consoleLog("info", "[HOOK] Started. Running test-bgrun")

api = freeswitch.API()

api:executeString("bgapi luarun test-bgrun.lua")

freeswitch.consoleLog("info", "[HOOK] Ended")