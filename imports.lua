RDX = exports['rdx_core']:getSharedObject()

if not IsDuplicityVersion() then -- Only register this event for the client
    AddEventHandler('rdx:setPlayerData', function(key, val, last)
        if GetInvokingResource() == 'rdx_core' then
            RDX.PlayerData[key] = val
            if OnPlayerData then
                OnPlayerData(key, val, last)
            end
        end
    end)

    RegisterNetEvent('rdx:playerLoaded', function(xPlayer)
        RDX.PlayerData = xPlayer
        RDX.PlayerLoaded = true
    end)

    RegisterNetEvent('rdx:onPlayerLogout', function()
        RDX.PlayerLoaded = false
        RDX.PlayerData = {}
    end)
end