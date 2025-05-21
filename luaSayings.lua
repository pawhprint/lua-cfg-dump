local kill_phrases = {
    "table.insert(kill_say.phrase)",
    'error("string expected")',
    "lua:2: attempt to call global 'Print' (a nil value)",
    "file/module gamesense/ui.lua doesn't exist or isn't in the search path",
    "Error: Attempt to index a nil value",
    "App:ROBLOX.rar.bat Blocked By FireWall.",

}

-- Function to get a random kill phrase
local function get_random_phrase()
    return kill_phrases[client.random_int(1, #kill_phrases)]
end
client.set_event_callback("player_death", function(e)
    local local_player = entity.get_local_player()
    local attacker = client.userid_to_entindex(e.attacker)
    
    -- If we got the kill
    if attacker == local_player then
        local phrase = kill_phrases[client.random_int(1, #kill_phrases)]
        client.exec("say " .. phrase)
    end
end)
