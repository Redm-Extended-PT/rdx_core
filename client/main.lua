local isPaused, isDead, pickups = false, false, {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsPlayerActive(PlayerId()) then
			if (Config.EnableDebug) then
				RDX.StartTimer = GetGameTimer()
			end

			TriggerServerEvent('rdx:onPlayerJoined')
			break
		end
	end
end)

RegisterNetEvent('rdx:playerLoaded')
AddEventHandler('rdx:playerLoaded', function(playerData, isNew, skin)
	if (Config.EnableDebug) then
		TriggerServerEvent('rdx:clientLog', ('after %sms `rdx:playerLoaded` was called from the server after `rdx:onPlayerJoined` event has been triggerd for player id %s'):format((GetGameTimer() - RDX.StartTimer), playerData.playerId))
	end

	RDX.PlayerLoaded = true
	RDX.PlayerData = playerData
		
	if GetEntityModel(PlayerPedId()) == 0x0D7114C9 or GetEntityModel(PlayerPedId()) == 0x00B69710 then
		local defaultModel = 0xF5C1611E
		RequestModel(defaultModel)

		while not HasModelLoaded(defaultModel) do
			Citizen.Wait(10)
		end

		SetPlayerModel(PlayerId(), defaultModel)
		SetPedRandomComponentVariation(PlayerPedId(), true)
		SetModelAsNoLongerNeeded(defaultModel)
	end

	-- enable PVP
	if Config.EnablePVP then
		NetworkSetFriendlyFireOption(true)
	end
	
	if Config.RevealMap then
	    Citizen.InvokeNative(0x4B8F743A4A6D2FF8, true)
	end

	-- disable wanted level
	ClearPlayerWantedLevel(PlayerId())
	SetMaxWantedLevel(0)
	Citizen.Wait(3000)

	RDX.Game.Teleport(PlayerPedId(), {
		x = playerData.coords.x,
		y = playerData.coords.y,
		z = playerData.coords.z + 0.25,
		heading = playerData.coords.heading,
		}, function()
			TriggerServerEvent('rdx:onPlayerSpawn')
			TriggerEvent('rdx:onPlayerSpawn')
			TriggerEvent('playerSpawned') -- compatibility with old scripts
			TriggerEvent('rdx:restoreLoadout')
			if isNew then
				if skin.sex == 0 then
					TriggerEvent('rdx_skin:updateBody', true)
				else
					TriggerEvent('rdx_skin:updateBody', false)
				end
			elseif skin then TriggerServerEvent("rdx_skin:loadSkin") end
			Citizen.Wait(4000)
			ShutdownLoadingScreen()
			ShutdownLoadingScreenNui()
			DoScreenFadeIn(1000)
			FreezeEntityPosition(PlayerPedId(), false)
			StartServerSyncLoops()
			
		CreateThread(function()
			local SetPlayerHealthRechargeMultiplier = SetPlayerHealthRechargeMultiplier
			local PlayerId = PlayerId()
			while true do 
				local Sleep = true

				if Config.DisableHealthRegeneration then
					Sleep = false
					SetPlayerHealthRechargeMultiplier(PlayerId, 0.0)
				end				
			Wait(Sleep and 1500 or 0)
			end
		end)

		if Config.EnableHud then
			for i = 1, #playerData.accounts do
				local account = playerData.accounts[i]
				local accountTpl = '<div><img class="money" src="img/accounts/' .. account.name .. '.png"/>&nbsp;{{money}}</div>'

				RDX.UI.HUD.RegisterElement('account_' .. account.name, i, 0, accountTpl, {money = RDX.Math.GroupDigits(account.money)})
			end

			local jobTpl = '<div>{{job_label}} - {{grade_label}}</div>'

			if playerData.job.grade_label == '' or playerData.job.grade_label == playerData.job.label then
				jobTpl = '<div>{{job_label}}</div>'
			end

			RDX.UI.HUD.RegisterElement('job', #playerData.accounts, 0, jobTpl, {
				job_label = playerData.job.label,
				grade_label = playerData.job.grade_label
			})
		end

		if (Config.EnableDebug) then
			TriggerServerEvent('rdx:clientLog', ('rdx:onPlayerJoined took %sms for loading player id %s'):format((GetGameTimer() - RDX.StartTimer), playerData.playerId))
		end
	end)
end)

RegisterNetEvent('rdx:setMaxWeight')
AddEventHandler('rdx:setMaxWeight', function(newMaxWeight)
	RDX.PlayerData.maxWeight = newMaxWeight
end)

AddEventHandler('rdx:onPlayerSpawn', function() isDead = false end)
AddEventHandler('rdx:onPlayerDeath', function() isDead = true end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not RDX.PlayerLoaded do
		Citizen.Wait(100)
	end

	TriggerEvent('rdx:restoreLoadout')
end)

AddEventHandler('rdx:restoreLoadout', function()
	local playerPed = PlayerPedId()
	local ammoTypes = {}
	local retval, currentWeaponHash = GetCurrentPedWeapon(playerPed, true)

	RemoveAllPedWeapons(playerPed, true, true)

	for i = 1, #RDX.PlayerData.loadout do
		local loadout = RDX.PlayerData.loadout[i]
		local weaponName = loadout.name
		local weaponHash = GetHashKey(weaponName)

		GiveWeaponToPed_2(playerPed, weaponHash, 0, true, false, 0, false, 0.5, 1.0, 0, false, 0, false);

		local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)

		for i2 = 1, #loadout.components do
			local component = loadout.components[i2]
			local componentHash = RDX.GetWeaponComponent(weaponName, component).hash

			GiveWeaponComponentToEntity(playerPed, componentHash, weaponHash, true)
		end

		if not ammoTypes[ammoType] then
			SetPedAmmo(playerPed, weaponHash, loadout.ammo)
			ammoTypes[ammoType] = true
		end
	end

	SetCurrentPedWeapon(playerPed, currentWeaponHash, true)
end)

RegisterNetEvent('rdx:setAccountMoney')
AddEventHandler('rdx:setAccountMoney', function(account)
	for i = 1, #RDX.PlayerData.accounts do
		local _account = RDX.PlayerData.accounts[i]

		if _account.name == account.name then
			RDX.PlayerData.accounts[i] = account
			break
		end
	end

	if Config.EnableHud then
		RDX.UI.HUD.UpdateElement('account_' .. account.name, {
			money = RDX.Math.GroupDigits(account.money)
		})
	end
end)

RegisterNetEvent('rdx:addInventoryItem')
AddEventHandler('rdx:addInventoryItem', function(item, count, showNotification)
	for i = 1, #RDX.PlayerData.inventory do
		local _item = RDX.PlayerData.inventory[i]

		if _item.name == item then
			RDX.UI.ShowInventoryItemNotification(true, _item.label, count - _item.count)
			RDX.PlayerData.inventory[i].count = count
			break
		end
	end

	if showNotification then
		RDX.UI.ShowInventoryItemNotification(true, item, count)
	end

	if RDX.UI.Menu.IsOpen('default', 'redm_extended', 'inventory') then
		RDX.ShowInventory()
	end
end)

RegisterNetEvent('rdx:removeInventoryItem')
AddEventHandler('rdx:removeInventoryItem', function(item, count, showNotification)
	for i = 1, #RDX.PlayerData.inventory do
		local _item = RDX.PlayerData.inventory[i]

		if _item.name == item then
			RDX.UI.ShowInventoryItemNotification(false, _item.label, _item.count - count)
			RDX.PlayerData.inventory[i].count = count
			break
		end
	end

	if showNotification then
		RDX.UI.ShowInventoryItemNotification(false, item, count)
	end

	if RDX.UI.Menu.IsOpen('default', 'redm_extended', 'inventory') then
		RDX.ShowInventory()
	end
end)

RegisterNetEvent('rdx:setJob')
AddEventHandler('rdx:setJob', function(job)
	RDX.PlayerData.job = job
end)

RegisterNetEvent('rdx:addWeapon')
AddEventHandler('rdx:addWeapon', function(weaponName, ammo)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local retval, currentWeaponHash = GetCurrentPedWeapon(playerPed, true)

	GiveWeaponToPed_2(playerPed, weaponHash, ammo, true, false, 0, false, 0.5, 1.0, 0, false, 0, false);

	SetCurrentPedWeapon(playerPed, currentWeaponHash, true)
end)

RegisterNetEvent('rdx:addWeaponComponent')
AddEventHandler('rdx:addWeaponComponent', function(weaponName, weaponComponent)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local componentHash = RDX.GetWeaponComponent(weaponName, weaponComponent).hash

	GiveWeaponComponentToEntity(playerPed, componentHash, weaponHash, true)
end)

RegisterNetEvent('rdx:setWeaponAmmo')
AddEventHandler('rdx:setWeaponAmmo', function(weaponName, weaponAmmo)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)

	SetPedAmmo(playerPed, weaponHash, weaponAmmo)
end)

RegisterNetEvent('rdx:removeWeapon')
AddEventHandler('rdx:removeWeapon', function(weaponName)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local ammoType = Citizen.InvokeNative(0x5C2EA6C44F515F34, weaponHash)

	RemoveWeaponFromPed(playerPed, weaponHash, true, ammoType)
	SetPedAmmo(playerPed, weaponHash, 0) -- remove leftover ammo
	Citizen.InvokeNative(0xDCD2A934D65CB497, playerPed, weaponHash, 0) -- remove leftover ammo in clip
end)

RegisterNetEvent('rdx:removeWeaponComponent')
AddEventHandler('rdx:removeWeaponComponent', function(weaponName, weaponComponent)
	local playerPed = PlayerPedId()
	local weaponHash = GetHashKey(weaponName)
	local componentHash = RDX.GetWeaponComponent(weaponName, weaponComponent).hash

	RemoveWeaponComponentFromPed(playerPed, componentHash, weaponHash)
end)

RegisterNetEvent('rdx:teleport')
AddEventHandler('rdx:teleport', function(coords)
	local playerPed = PlayerPedId()

	-- ensure decmial number
	coords.x = coords.x + 0.0
	coords.y = coords.y + 0.0
	coords.z = coords.z + 0.0

	RDX.Game.Teleport(playerPed, coords)
end)

RegisterNetEvent('rdx:teleportWaypoint')
AddEventHandler('rdx:teleportWaypoint', function()
	local playerPed = PlayerPedId()
	local x, y = table.unpack(GetWaypointCoords())

	RDX.Game.Teleport(playerPed, { x = x, y = y, z = -199.99 })
end)

RegisterNetEvent('rdx:setJob')
AddEventHandler('rdx:setJob', function(job)
	if Config.EnableHud then
		RDX.UI.HUD.UpdateElement('job', {
			job_label = job.label,
			grade_label = job.grade_label
		})
	end
end)

RegisterNetEvent('rdx:spawnVehicle')
AddEventHandler('rdx:spawnVehicle', function(vehicleName)
	local model = (type(vehicleName) == 'number' and vehicleName or GetHashKey(vehicleName))

	if IsModelInCdimage(model) then
		local playerPed = PlayerPedId()
		local playerCoords, playerHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)

		RDX.Game.SpawnVehicle(model, playerCoords, playerHeading, function(vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		end)
	else
		TriggerEvent('chat:addMessage', {args = {'^1SYSTEM', 'Invalid vehicle model.'}})
	end
end)

RegisterNetEvent('rdx:spawnHorse')
AddEventHandler('rdx:spawnHorse', function(model)
	local _, horse = RDX.GetHorse(model)

	if (horse) then
		model = (type(model) == 'number' and model or GetHashKey(model))

		if IsModelInCdimage(model) then
			local playerPed = PlayerPedId()
			local playerCoords, playerHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)

			RDX.Game.SpawnPed(model, playerCoords, playerHeading, function(ped)
				Citizen.InvokeNative(0x028F76B6E78246EB, playerPed, ped, -1, true)
			end)

			return
		end
	end

	TriggerEvent('chat:addMessage', {args = {'^1SYSTEM', 'Invalid horse model.'}})
end)

RegisterNetEvent('rdx:createPickup')
AddEventHandler('rdx:createPickup', function(pickupId, label, coords, type, name, components)
	local function setObjectProperties(object)
		SetEntityAsMissionEntity(object, true, false)
		PlaceObjectOnGroundProperly(object)
		FreezeEntityPosition(object, true)
		SetEntityCollision(object, false, true)

		pickups[pickupId] = {
			obj = object,
			label = label,
			inRange = false,
			coords = vector3(coords.x, coords.y, coords.z)
		}
	end

	if type == 'item_weapon' then
		local weaponHash = GetHashKey(name)
		local pickupObject = Citizen.InvokeNative(0x9888652B8BA77F73, weaponHash, 50, coords.x, coords.y, coords.z, true, 1.0, 0)

		for i = 1, #components do
			local component = RDX.GetWeaponComponent(name, components[i])

			GiveWeaponComponentToWeaponObject(pickupObject, component.hash)
		end

		setObjectProperties(pickupObject)
	else
		RDX.Game.SpawnLocalObject('s_mp_moneybag02x', coords, setObjectProperties)
	end
end)

RegisterNetEvent('rdx:createMissingPickups')
AddEventHandler('rdx:createMissingPickups', function(missingPickups)
	for pickupId,pickup in pairs(missingPickups) do
		TriggerEvent('rdx:createPickup', pickupId, pickup.label, pickup.coords, pickup.type, pickup.name, pickup.components)
	end
end)

RegisterNetEvent('rdx:registerSuggestions')
AddEventHandler('rdx:registerSuggestions', function(registeredCommands)
	for name,command in pairs(registeredCommands) do
		if command.suggestion then
			TriggerEvent('chat:addSuggestion', ('/%s'):format(name), command.suggestion.help, command.suggestion.arguments)
		end
	end
end)

RegisterNetEvent('rdx:removePickup')
AddEventHandler('rdx:removePickup', function(pickupId)
	if pickups[pickupId] and pickups[pickupId].obj then
		RDX.Game.DeleteObject(pickups[pickupId].obj)
		pickups[pickupId] = nil
	end
end)

RegisterNetEvent('rdx:deleteVehicle')
AddEventHandler('rdx:deleteVehicle', function()
	local playerPed = PlayerPedId()
	local vehicle, attempt = RDX.Game.GetVehicleInDirection(), 0

	if IsPedInAnyVehicle(playerPed, true) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	end

	while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
		Citizen.Wait(100)
		NetworkRequestControlOfEntity(vehicle)
		attempt = attempt + 1
	end

	if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
		RDX.Game.DeleteVehicle(vehicle)
	end
end)

RegisterNetEvent('rdx:deleteHorse')
AddEventHandler('rdx:deleteHorse', function()
	local playerPed = PlayerPedId()
	local horse, attempt = RDX.Game.GetHorseInDirection(), 0

	if IsPedOnMount(playerPed) then
		horse = GetMount(playerPed)
	end

	while not NetworkHasControlOfEntity(horse) and attempt < 100 and DoesEntityExist(horse) do
		Citizen.Wait(100)
		NetworkRequestControlOfEntity(horse)
		attempt = attempt + 1
	end

	if DoesEntityExist(horse) and NetworkHasControlOfEntity(horse) then
		RDX.Game.DeleteHorse(horse)
	end
end)

-- Pause menu disables HUD display
if Config.EnableHud then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(300)

			if IsPauseMenuActive() and not isPaused then
				isPaused = true
				RDX.UI.HUD.SetDisplay(0.0)
			elseif not IsPauseMenuActive() and isPaused then
				isPaused = false
				RDX.UI.HUD.SetDisplay(1.0)
			end
		end
	end)
end

function StartServerSyncLoops()
	-- keep track of ammo
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)

			if isDead then
				Citizen.Wait(500)
			else
				local playerPed = PlayerPedId()

				if IsPedShooting(playerPed) then
					local _,weaponHash = GetCurrentPedWeapon(playerPed, true)
					local weapon = RDX.GetWeaponFromHash(weaponHash)

					if weapon then
						local ammoCount = GetAmmoInPedWeapon(playerPed, weaponHash)
						TriggerServerEvent('rdx:updateWeaponAmmo', weapon.name, ammoCount)
					end
				end
			end
		end
	end)

	-- sync current player coords with server
	Citizen.CreateThread(function()
		local previousCoords = vector3(RDX.PlayerData.coords.x, RDX.PlayerData.coords.y, RDX.PlayerData.coords.z)

		while true do
			Citizen.Wait(1000)
			local playerPed = PlayerPedId()

			if DoesEntityExist(playerPed) then
				local playerCoords = GetEntityCoords(playerPed)
				local distance = #(playerCoords - previousCoords)

				if distance > 1 then
					previousCoords = playerCoords
					local playerHeading = RDX.Math.Round(GetEntityHeading(playerPed), 1)
					local formattedCoords = {x = RDX.Math.Round(playerCoords.x, 1), y = RDX.Math.Round(playerCoords.y, 1), z = RDX.Math.Round(playerCoords.z, 1), heading = playerHeading}
					TriggerServerEvent('rdx:updateCoords', formattedCoords)
				end
			end
		end
	end)
end

Citizen.CreateThread(function()
	 while true do
		 Citizen.Wait(0)

		 if IsControlJustReleased(0, 0x1F6D95E5) then -- F1
			 if IsInputDisabled(0) and not isDead and not RDX.UI.Menu.IsOpen('default', 'redm_extended', 'inventory') then
				 RDX.ShowInventory()
			 end
		 end
	 end
end)

-- Pickups
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local playerCoords, letSleep = GetEntityCoords(playerPed), true
		local closestPlayer, closestDistance = RDX.Game.GetClosestPlayer(playerCoords)

		for pickupId,pickup in pairs(pickups) do
			local distance = #(playerCoords - pickup.coords)

			if distance < 5 then
				local label = pickup.label
				letSleep = false

				if distance < 1 then
					if IsControlJustReleased(0, 0xCEFD9220) then
						if IsPedOnFoot(playerPed) and (closestDistance == -1 or closestDistance > 3) and not pickup.inRange then
							pickup.inRange = true

							TriggerServerEvent('rdx:onPickup', pickupId)
						end
					end

					label = ('%s~n~%s'):format(label, _U('threw_pickup_prompt'))
				end

				RDX.Game.Utils.DrawText3D({
					x = pickup.coords.x,
					y = pickup.coords.y,
					z = pickup.coords.z + 0.25
				}, label, 1.2, 1)
			elseif pickup.inRange then
				pickup.inRange = false
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(200)

	while true do
		local ped = PlayerPedId()
		
		if Config.RadarType == 0 then
			SetMinimapType(0)
			Config.Sleep = 15000
			Wait(10000)
		elseif not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not Config.Radar and Config.DisableRadarOnFoot then
			Config.Radar = true
			SetMinimapType(0)
			Config.Sleep = 850
		elseif not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not Config.Radar and not Config.DisableRadarOnFoot then
			Config.Radar = true
			SetMinimapType(Config.RadarType)
			Config.Sleep = 2000
		elseif IsPedOnMount(ped) or IsPedInAnyVehicle(ped) and Config.Radar then
			Config.Radar = false
			SetMinimapType(Config.RadarTypeM)
			Config.Sleep = 750
		end

		Wait(Config.Sleep)
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsPlayerFreeAiming(PlayerId()) then -- Aiming?
            if Config.Fps == true then -- already first and not Config.Fps
                Citizen.InvokeNative(0x90DA5BA5C2635416) -- force first
            end
        else -- not aiming
            if Config.Fps == false then -- Is being Config.Fps?
                Citizen.InvokeNative(0x1CFB749AD4317BDE) -- force 3rd
            end
        end
    end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.ColorMap) do
		wanted_region_hash = v.hash
		map_color = v.color
		Citizen.InvokeNative(0x563FCB6620523917, wanted_region_hash, GetHashKey(map_color));
		wanted_region_is_activated = true
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k,v in pairs(Config.ColorMap) do
			wanted_region_hash = v.hash
        	Citizen.InvokeNative(0x6786D7AFAC3162B3, wanted_region_hash);
        	wanted_region_is_activated = false
		end
	end
end)
