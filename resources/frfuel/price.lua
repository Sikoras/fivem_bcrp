fuel = 1 -- Fuel Cost, this could be made to randomise between 1.05 and 1.30 or something like that

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

local user_id = vRP.getUserId(source)

RegisterServerEvent('frfuel:fuelAdded')
AddEventHandler('frfuel:fuelAdded', function(amount)

local cost = round(fuel * amount)

TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "The price of fuel is $" .. fuel)

TriggerEvent('es:getPlayerFromId', source, function(user)
local wallet = vRP.getMoney(user_id)
local new_wallet = wallet - cost
TriggerClientEvent('chatMessage', source, "SYSTEM", {255,0,0}, "DEBUG: " .. wallet .. " - " .. cost .. " = " .. new_wallet .. " :DEBUG")
		if vRP.tryPayment(user_id,cost) then
			if cost > 0 then
				vRPclient.notify(source,{lang.money.paid({cost})})
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Fuel Cost $" .. round(cost))
		end
			else
				vRPclient.notify(source,{lang.money.not_enough()})
				TriggerClientEvent('chatMessage', -1, "911", {255, 0, 0}, GetPlayerName(source) .." has driven off without paying for fuel.")
		end
    end)
end)
