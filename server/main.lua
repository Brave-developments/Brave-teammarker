RegisterServerEvent('Brave:syncMarker')
AddEventHandler('Brave:syncMarker', function(markerCoords)
    local src = source
    local plyState = Player(src).state
    local srcRadioChannel = plyState.radioChannel 
    if srcRadioChannel and srcRadioChannel > 0 then
        for _, playerId in ipairs(GetPlayers()) do
            local playerState = Player(playerId).state 
            local playerRadioChannel = playerState.radioChannel 
            if playerRadioChannel == srcRadioChannel then
                TriggerClientEvent('Brave:receiveSyncedMarker', playerId, markerCoords) 
            end
        end
    else
    end
end)
