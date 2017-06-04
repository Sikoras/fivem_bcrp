RegisterServerEvent("runcode:execute")
AddEventHandler('runcode:execute', function(mode,script)
	if mode == 1 then
		TriggerClientEvent("RunCode:RunStringLocally", source, script)
	elseif	mode == 2 then
		TriggerEvent('es:getPlayers', function(pl)
			for k,v in pairs(pl) do
				TriggerClientEvent("RunCode:RunStringLocally", k, script)
			end
		end)
	elseif	mode == 3 then
		RunString(script, source)
	elseif	mode == 4 then
		TriggerClientEvent("RunCode:RunStringLocally", source, script)
		RunString(script, source)
	elseif	mode == 5 then
		TriggerEvent('es:getPlayers', function(pl)
			for k,v in pairs(pl) do
				TriggerClientEvent("RunCode:RunStringLocally", k, script)
			end
		end)
		RunString(script, source)
	end	
end)
