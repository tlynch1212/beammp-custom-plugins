function onInit()
	print('Loading whitelist done!')
    
    whitelist = {}
    whitelist[1] = "Pintang07"
end

function onPlayerConnecting(playerId)
	checkWhiteList(playerId, 1)
end

function checkWhiteList(playerId)
	local onList = false
    local name = MP.GetPlayerName(playerId)
    
    print("Checking player - "..name.." whitelist status...")
    for index, value in ipairs(whitelist) do
    	if name == value then
        	onList = true
            print("Player - "..name.." is allowed to connect.")
        end
    end
    
    if onList == false then
    	MP.DropPlayer(playerId, "You are not on the whitelist")
        print("Player - "..name.." was denied access to the server.")
    end
end

function checkAllPlayers() 
    print("Checking all players")
    local allPlayers = MP.GetPlayers()
    
    for key, value in pairs(allPlayers) do
        checkWhiteList(key)
    end
end

MP.RegisterEvent("onInit", "onInit")
MP.RegisterEvent("onPlayerConnecting", "onPlayerConnecting")
MP.RegisterEvent("checkWhiteList", "checkWhiteList")
MP.RegisterEvent("checkAllPlayers", "checkAllPlayers")
MP.CreateEventTimer("checkAllPlayers", 60000)
