RDX = {}
RDX.UsableItemsCallbacks = {}
RDX.Items = {}
RDX.ServerCallbacks = {}
RDX.TimeoutCount = -1
RDX.CancelledTimeouts = {}
RDX.Pickups = {}
RDX.PickupId = 0
RDX.Jobs = {}
RDX.RegisteredCommands = {}

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM items', {}, function(result)
		for i = 1, #result do
			local item = result[i]

			RDX.Items[item.name] = {
				label = item.label,
				weight = item.weight,
				rare = item.rare,
				canRemove = item.can_remove
			}
		end
	end)

	MySQL.Async.fetchAll('SELECT * FROM jobs', {}, function(jobs)
		for i = 1, #jobs do
			local job = jobs[i]

			RDX.Jobs[job.name] = job
			RDX.Jobs[job.name].grades = {}
		end

		MySQL.Async.fetchAll('SELECT * FROM job_grades', {}, function(jobGrades)
			for i = 1, #jobGrades do
				local jobGrade = jobGrades[i]

				if RDX.Jobs[jobGrade.job_name] then
					RDX.Jobs[jobGrade.job_name].grades[tostring(jobGrade.grade)] = jobGrade
				else
					print(('[redm_extended] [^3AVISO^7] Ignorando notas de trabalho para "%s" devido à falta de trabalho'):format(v.job_name))
				end
			end

			for k2,v2 in pairs(RDX.Jobs) do
				if RDX.Table.SizeOf(v2.grades) == 0 then
					RDX.Jobs[v2.name] = nil
					print(('[redm_extended] [^3AVISO^7] Ignorando trabalho "%s" devido a nenhuma classificação de trabalho encontrada'):format(v2.name))
				end
			end
		end)
	end)

	print('^4[RDX_CORE]^7 ^3[INFO]^7 RDX FEITO POR ^5[ESX-Org]^7 REFEITO POR ^5[ThymonA]^7 E MODIFICADO POR ^1[Nevermind]^7 INICIOU COM ^2[SUCESSO]^7')
end)

RegisterServerEvent('rdx:clientLog')
AddEventHandler('rdx:clientLog', function(msg)
	if Config.EnableDebug then
		print(('[redm_extended] [DEBUG] %s'):format(msg))
	end
end)

RegisterServerEvent('rdx:triggerServerCallback')
AddEventHandler('rdx:triggerServerCallback', function(name, requestId, ...)
	local playerId = source

	RDX.TriggerServerCallback(name, requestId, playerId, function(...)
		TriggerClientEvent('rdx:serverCallback', playerId, requestId, ...)
	end, ...)
end)

AddEventHandler('rdx:getSharedObject', function(cb)
	cb(RDX)
end)

function getSharedObject()
	return RDX
end

exports('getSharedObject', function()
	return RDX
end)
