AddEventHandler('onClientMapStart', function()
	Citizen.Trace("ocms fivem\n")

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
    SetClockTime(24, 0, 0)
    PauseClock(true)
    Citizen.Trace("ocms fivem end\n")
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', 'BoonieCrew RP')
end)

Citizen.CreateThread(function()
    while true 
    	do
    	-- These natives has to be called every frame.
    	SetVehicleDensityMultiplierThisFrame(0.6)
		SetPedDensityMultiplierThisFrame(0.5)
		SetRandomVehicleDensityMultiplierThisFrame(0.6)
		SetParkedVehicleDensityMultiplierThisFrame(0.5)
		SetScenarioPedDensityMultiplierThisFrame(0.5, 0.5)    	
		Citizen.Wait(1)
	end

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 32) then -- INPUT_MOVE_UP_ONLY
			ClearPedTasks(ped);
			playing_emote = false
		end
		Menu.renderGUI()
	end
end)

-- Allow passengers to shoot
local passengerDriveBy = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		local playerPed = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)