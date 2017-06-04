function startCodding()
    DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 255)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        script = GetOnscreenKeyboardResult()
        OpenMenu()
    end
end
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)
        if IsControlJustPressed(1,167) then
            startCodding()
        end
	end
end)

runcode_menu = {
	opened = false,
	title = "",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 }, -- ???
	menu = {
		x = 0.11,
		y = 0.25,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "SEND TO",
			name = "main",
			buttons = {
				{name = "Client"},
				{name = "All clients"},
                {name = "Server"},
                {name = "Server + Client"},
                {name = "Server + All clients"},
			}
		},
	}
}

function LocalPed()
    return GetPlayerPed(-1)
end
-------------------------------------------------
----------------CONFIG SELECTION----------------
-------------------------------------------------
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = runcode_menu.currentmenu
	if this == "main" then
        if button.name == "Client" then
            TriggerServerEvent("runcode:execute", 1, script) -- CLIENT
            drawNotification("Code sent to you !")
            CloseMenu()
        elseif button.name == "All clients" then
            TriggerServerEvent("runcode:execute", 2, script) -- ALL CLIENTS
            drawNotification("Code sent to everybody !")
            CloseMenu()
        elseif button.name == "Server" then
            TriggerServerEvent("runcode:execute", 3, script) -- SERVER
            drawNotification("Code sent to the server !")
            CloseMenu()
        elseif button.name == "Server + Client" then
            TriggerServerEvent("runcode:execute", 4, script) -- SERVER + CLIENT
            drawNotification("Code sent to the server and you !")
            CloseMenu()
        elseif button.name == "Server + All clients" then
            TriggerServerEvent("runcode:execute", 5, script) -- SERVER + ALL CLIENTS
            drawNotification("Code sent everywhere !")
            CloseMenu()
        end
		
	end
end
-------------------------------------------------
------------------DRAW NOTIFY--------------------
-------------------------------------------------
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
-------------------------------------------------
------------------DRAW TITLE MENU----------------
-------------------------------------------------
function drawMenuTitle(txt,x,y)
local menu = runcode_menu.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,244,122,66,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU BOUTON---------------
-------------------------------------------------
function drawMenuButton(button,x,y,selected)
	local menu = runcode_menu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU INFO-----------------
-------------------------------------------------
function drawMenuInfo(text)
	local menu = runcode_menu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end
-------------------------------------------------
----------------DRAW MENU DROIT------------------
-------------------------------------------------
function drawMenuRight(txt,x,y,selected)
	local menu = runcode_menu.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
-------------------DRAW TEXT---------------------
-------------------------------------------------
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end
-------------------------------------------------
----------------CONFIG BACK MENU-----------------
-------------------------------------------------
function Back()
	if backlock then
		return
	end
	backlock = true
	if runcode_menu.currentmenu == "main" then
		CloseMenu()
	end
end
-------------------------------------------------
----------------FONCTION ???????-----------------
-------------------------------------------------
function f(n)
return n + 0.0001
end

function LocalPed()
return GetPlayerPed(-1)
end

function try(f, catch_f)
local status, exception = pcall(f)
if not status then
catch_f(exception)
end
end
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end
-------------------------------------------------
----------------FONCTION OPEN--------------------
-------------------------------------------------
function OpenMenu() --OpenCreator
	boughtcar = false
	runcode_menu.currentmenu = "main"
	runcode_menu.opened = true
	runcode_menu.selectedbutton = 0
end
-------------------------------------------------
----------------FONCTION CLOSE-------------------
-------------------------------------------------
function CloseMenu() -- Close Creator
	Citizen.CreateThread(function()
        runcode_menu.opened = false
		runcode_menu.menu.from = 1
		runcode_menu.menu.to = 10
	end)
end
-------------------------------------------------
----------------FONCTION OPEN MENU---------------
-------------------------------------------------
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local backlock = false
Citizen.CreateThread(function()
	local x = 406.281
	local y = -1644.16
	local z = 29.2919

	while true do
		Citizen.Wait(0)
		if runcode_menu.opened then
			local ped = LocalPed()
			local menu = runcode_menu.menu[runcode_menu.currentmenu]
			drawTxt(runcode_menu.title,1,1,runcode_menu.menu.x,runcode_menu.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, runcode_menu.menu.x,runcode_menu.menu.y + 0.08)
			drawTxt(runcode_menu.selectedbutton.."/"..tablelength(menu.buttons),0,0,runcode_menu.menu.x + runcode_menu.menu.width/2 - 0.0385,runcode_menu.menu.y + 0.067,0.4, 255,255,255,255)
			local y = runcode_menu.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= runcode_menu.menu.from and i <= runcode_menu.menu.to then

					if i == runcode_menu.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,runcode_menu.menu.x,y,selected)
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if runcode_menu.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if runcode_menu.selectedbutton > 1 then
					runcode_menu.selectedbutton = runcode_menu.selectedbutton -1
					if buttoncount > 10 and runcode_menu.selectedbutton < runcode_menu.menu.from then
						runcode_menu.menu.from = runcode_menu.menu.from -1
						runcode_menu.menu.to = runcode_menu.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if runcode_menu.selectedbutton < buttoncount then
					runcode_menu.selectedbutton = runcode_menu.selectedbutton +1
					if buttoncount > 10 and runcode_menu.selectedbutton > runcode_menu.menu.to then
						runcode_menu.menu.to = runcode_menu.menu.to + 1
						runcode_menu.menu.from = runcode_menu.menu.from + 1
					end
				end
			end
		end

	end
end)
