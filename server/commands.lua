RDX.RegisterCommand({ 'tp', 'teleport', 'setcoords' }, 'admin', function(xPlayer, args, showError)
	xPlayer.setCoords({x = args.x, y = args.y, z = args.z})
end, false, {help = _U('command_setcoords'), validate = true, arguments = {
	{name = 'x', help = _U('command_setcoords_x'), type = 'number'},
	{name = 'y', help = _U('command_setcoords_y'), type = 'number'},
	{name = 'z', help = _U('command_setcoords_z'), type = 'number'}
}})

RDX.RegisterCommand({ 'tpw', 'teleportwaypoint', 'setwaypointcoords' }, 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('rdx:teleportWaypoint')
end, false, {help = _U('command_teleportwaypoint'), validate = false, arguments = {
}})

RDX.RegisterCommand('setjob', 'admin', function(xPlayer, args, showError)
	if RDX.DoesJobExist(args.job, args.grade) then
		args.playerId.setJob(args.job, args.grade)
	else
		showError(_U('command_setjob_invalid'))
	end
end, true, {help = _U('command_setjob'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'job', help = _U('command_setjob_job'), type = 'string'},
	{name = 'grade', help = _U('command_setjob_grade'), type = 'number'}
}})

RDX.RegisterCommand('car', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('rdx:spawnVehicle', args.car)
end, false, {help = _U('command_car'), validate = false, arguments = {
	{name = 'car', help = _U('command_car_car'), type = 'any'}
}})

RDX.RegisterCommand('horse', 'admin', function(xPlayer, args, showError)
	local index, horse = RDX.GetHorse(args.horse)

	if (horse) then
		xPlayer.triggerEvent('rdx:spawnHorse', horse.name)
	else
		showError('Invalid horse name.')
	end
end, false, {help = _U('command_horse'), validate = false, arguments = {
	{name = 'horse', help = _U('command_horse_horse'), type = 'any'}
}})

RDX.RegisterCommand({'cardel', 'dv'}, 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('rdx:deleteVehicle')
end, false, {help = _U('command_cardel'), validate = false, arguments = {}})

RDX.RegisterCommand({'horsedel', 'dh'}, 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('rdx:deleteHorse')
end, false, {help = _U('command_horsedel'), validate = false, arguments = {}})

RDX.RegisterCommand('setaccountmoney', 'admin', function(xPlayer, args, showError)
	if args.playerId.getAccount(args.account) then
		args.playerId.setAccountMoney(args.account, args.amount)
	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
end, true, {help = _U('command_setaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_setaccountmoney_amount'), type = 'number'}
}})

RDX.RegisterCommand('giveaccountmoney', 'admin', function(xPlayer, args, showError)
	if args.playerId.getAccount(args.account) then
		args.playerId.addAccountMoney(args.account, args.amount)
	else
		showError(_U('command_giveaccountmoney_invalid'))
	end
end, true, {help = _U('command_giveaccountmoney'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'account', help = _U('command_giveaccountmoney_account'), type = 'string'},
	{name = 'amount', help = _U('command_giveaccountmoney_amount'), type = 'number'}
}})

RDX.RegisterCommand('giveitem', 'admin', function(xPlayer, args, showError)
	args.playerId.addInventoryItem(args.item, args.count)
end, true, {help = _U('command_giveitem'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'item', help = _U('command_giveitem_item'), type = 'item'},
	{name = 'count', help = _U('command_giveitem_count'), type = 'number'}
}})

RDX.RegisterCommand('giveweapon', 'admin', function(xPlayer, args, showError)
	if args.playerId.hasWeapon(args.weapon) then
		showError(_U('command_giveweapon_hasalready'))
	else
		xPlayer.addWeapon(args.weapon, args.ammo)
	end
end, true, {help = _U('command_giveweapon'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weapon', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'ammo', help = _U('command_giveweapon_ammo'), type = 'number'}
}})

RDX.RegisterCommand('giveammo', 'admin', function(xPlayer, args, showError)
	if not args.playerId.hasWeapon(args.weapon) then
		showError(_U('command_giveweapon_does_not_haveweapon'))
	else
		xPlayer.addWeaponAmmo(args.weapon, args.ammo)
	end
end, true, {help = _U('command_giveweapon'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weapon', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'ammo', help = _U('command_giveweapon_ammo'), type = 'number'}
}})

RDX.RegisterCommand('giveweaponcomponent', 'admin', function(xPlayer, args, showError)
	if args.playerId.hasWeapon(args.weaponName) then
		local component = RDX.GetWeaponComponent(args.weaponName, args.componentName)

		if component then
			if xPlayer.hasWeaponComponent(args.weaponName, args.componentName) then
				showError(_U('command_giveweaponcomponent_hasalready'))
			else
				xPlayer.addWeaponComponent(args.weaponName, args.componentName)
			end
		else
			showError(_U('command_giveweaponcomponent_invalid'))
		end
	else
		showError(_U('command_giveweaponcomponent_missingweapon'))
	end
end, true, {help = _U('command_giveweaponcomponent'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'weaponName', help = _U('command_giveweapon_weapon'), type = 'weapon'},
	{name = 'componentName', help = _U('command_giveweaponcomponent_component'), type = 'string'}
}})

RDX.RegisterCommand({'clear', 'cls'}, 'user', function(xPlayer, args, showError)
	xPlayer.triggerEvent('chat:clear')
end, false, {help = _U('command_clear')})

RDX.RegisterCommand({'clearall', 'clsall'}, 'admin', function(xPlayer, args, showError)
	TriggerClientEvent('chat:clear', -1)
end, false, {help = _U('command_clearall')})

RDX.RegisterCommand('clearinventory', 'admin', function(xPlayer, args, showError)
	for i = 1, #args.playerId.inventory do
		local item = args.playerId.inventory[i]

		if item.count > 0 then
			args.playerId.setInventoryItem(item.name, 0)
		end
	end
end, true, {help = _U('command_clearinventory'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('clearloadout', 'admin', function(xPlayer, args, showError)
	for i = 1, #args.playerId.loadout do
		local weapon = args.playerId.loadout[i]

		if weapon then
			args.playerId.removeWeapon(weapon.name)
		end
	end
end, true, {help = _U('command_clearloadout'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('setgroup', 'admin', function(xPlayer, args, showError)
	args.playerId.setGroup(args.group)
end, true, {help = _U('command_setgroup'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'},
	{name = 'group', help = _U('command_setgroup_group'), type = 'string'},
}})

RDX.RegisterCommand('save', 'admin', function(xPlayer, args, showError)
	RDX.SavePlayer(args.playerId)
end, true, {help = _U('command_save'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('saveall', 'admin', function(xPlayer, args, showError)
	RDX.SavePlayers()
end, true, {help = _U('command_saveall')})

RDX.RegisterCommand('group', {"user", "admin"}, function(xPlayer, args, showError)
	print(xPlayer.getName()..", You are currently: ^5".. xPlayer.getGroup() .. "^0")
end, true)

RDX.RegisterCommand('job', {"user", "admin"}, function(xPlayer, args, showError)
	print(xPlayer.getName()..", You are currently: ^5".. xPlayer.getJob().name.. "^0 - ^5".. xPlayer.getJob().grade_label .. "^0")
end, true)

RDX.RegisterCommand('info', {"user", "admin"}, function(xPlayer, args, showError)
	local job = xPlayer.getJob().name
	local jobgrade = xPlayer.getJob().grade_name
	print("^2ID : ^5"..xPlayer.source.." ^0| ^2Name:^5"..xPlayer.getName().." ^0 | ^2Group:^5"..xPlayer.getGroup().."^0 | ^2Job:^5".. job.."^0")
end, true)

RDX.RegisterCommand('coords', "admin", function(xPlayer, args, showError)
    local ped = GetPlayerPed(xPlayer.source)
	local coords = GetEntityCoords(ped, false)
	local heading = GetEntityHeading(ped)
	print("Coords - Vector3: ^5".. vector3(coords.x,coords.y,coords.z).. "^0")
	print("Coords - Vector4: ^5".. vector4(coords.x, coords.y, coords.z, heading) .. "^0")
end, true)

RDX.RegisterCommand('goto', "admin", function(xPlayer, args, showError)
	local targetCoords = args.playerId.getCoords()
	xPlayer.setCoords(targetCoords)
end, true, {help = _U('command_goto'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('bring', "admin", function(xPlayer, args, showError)
	local playerCoords = xPlayer.getCoords()
	args.playerId.setCoords(playerCoords)
end, true, {help = _U('command_bring'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('kill', "admin", function(xPlayer, args, showError)
	args.playerId.triggerEvent("RDX:killPlayer")
end, true, {help = _U('command_kill'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('kick', 'admin', function(source, args)
    if args[1] ~= nil then
	if GetPlayerName(tonumber(args[1])) ~= nil then	    
	     Citizen.Wait(5000)
	     DropPlayer((tonumber(args[1])), "You have been kicked by an admin")
	     TriggerClientEvent('chat:addMessage', -1, { args = { ''..PlayerPedId(GetPlayerName(tonumber(args[1])))..' has been kicked by an admin!?' } })
	end	
    end
end, function(source, args)
TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } }) end)

RDX.RegisterCommand('freeze', "admin", function(xPlayer, args, showError)
	args.playerId.triggerEvent('RDX:freezePlayer', "freeze")
end, true, {help = _U('command_freeze'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('unfreeze', "admin", function(xPlayer, args, showError)
	args.playerId.triggerEvent('RDX:freezePlayer', "unfreeze")
end, true, {help = _U('command_unfreeze'), validate = true, arguments = {
	{name = 'playerId', help = _U('commandgeneric_playerid'), type = 'player'}
}})

RDX.RegisterCommand('players', "admin", function(xPlayer, args, showError)
	local xPlayers = RDX.GetExtendedPlayers() -- Returns all xPlayers
	print("^5"..#xPlayers.." ^2online player(s)^0")
	for i=1, #(xPlayers) do 
		local xPlayer = xPlayers[i]
		print("^1[ ^2ID : ^5"..xPlayer.source.." ^0| ^2Name : ^5"..xPlayer.getName().." ^0 | ^2Group : ^5"..xPlayer.getGroup().." ^0 | ^2Identifier : ^5".. xPlayer.identifier .."^1]^0\n")
	end
end, true)


