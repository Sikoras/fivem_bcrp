-- CONFIG --
local showCompass = true
-- CODE --

local lastStreet = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        lastStreet = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)

        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")

        if showCompass then
        	compass = getCardinalDirectionFromHeading(GetEntityHeading(GetPlayerPed(-1)))
        	lastStreetName = lastStreetName .. " | " .. compass
        end

        AddTextComponentString(lastStreetName)
        DrawText(0.015, 0.75)
    end
end)

-- Thanks @marxy
function getCardinalDirectionFromHeading(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "North"
    elseif (heading >= 45 and heading < 135) then
        return "East"
    elseif (heading >=135 and heading < 225) then
        return "South"
    elseif (heading >= 225 and heading < 315) then
        return "West"
    end
end