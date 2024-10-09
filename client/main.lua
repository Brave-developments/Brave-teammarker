local activeMarkers = {}

function addMarker(coords)
    local marker = {
        coords = coords,
        timer = GetGameTimer() + 10000
    }

    table.insert(activeMarkers, marker)
    Citizen.CreateThread(function()
        while GetGameTimer() < marker.timer do
            DrawMarker(
                1, 
                marker.coords.x, 
                marker.coords.y, 
                marker.coords.z - 1.0, 
                0.0, 0.0, 0.0, 
                0.0, 0.0, 0.0, 
                Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, -- Marker size from config
                Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, -- Marker color from config
                false, 
                true, 
                Config.MarkerDrawDistance, -- Draw distance from config
                nil, nil, false
            )
            Citizen.Wait(0)
        end
        removeMarker(marker)
    end)
end


function removeMarker(marker)
    for i, m in ipairs(activeMarkers) do
        if m == marker then
            table.remove(activeMarkers, i)
            break
        end
    end
end

function performRaycast(distance)
    local camRot = GetGameplayCamRot(2)
    local camCoord = GetGameplayCamCoord()
    local direction = calculateDirection(camRot)

    local destination = {
        x = camCoord.x + direction.x * distance,
        y = camCoord.y + direction.y * distance,
        z = camCoord.z + direction.z * distance
    }

    local rayHandle = StartShapeTestRay(
        camCoord.x, camCoord.y, camCoord.z, 
        destination.x, destination.y, destination.z, 
        -1,
        PlayerPedId(), 
        0
    )
    
    local _, hit, hitCoords = GetShapeTestResult(rayHandle)

    if hit and hitCoords then
        return true, hitCoords
    else
        return false, nil
    end
end

function calculateDirection(rotation)
    local adjustedRot = {
        x = math.rad(rotation.x),
        y = math.rad(rotation.y),
        z = math.rad(rotation.z)
    }

    return {
        x = -math.sin(adjustedRot.z) * math.abs(math.cos(adjustedRot.x)),
        y = math.cos(adjustedRot.z) * math.abs(math.cos(adjustedRot.x)),
        z = math.sin(adjustedRot.x)
    }
end

RegisterCommand('createMarker', function()
    local hit, hitCoords = performRaycast(10000.0)

    if hit then
        TriggerServerEvent('Brave:syncMarker', hitCoords)    
        addMarker(hitCoords)
    else
    end
end, false)

RegisterKeyMapping('createMarker', 'Create a 3D Marker', 'keyboard', 'BACKSLASH')


RegisterNetEvent('Brave:receiveSyncedMarker')
AddEventHandler('Brave:receiveSyncedMarker', function(coords)
    addMarker(coords)
end)
