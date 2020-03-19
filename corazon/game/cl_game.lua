Corazon = Corazon or {}
Corazon.Game = {}

--------------------------------------------------------

RegisterNetEvent("corazon:loadPlayer")
RegisterNetEvent("corazon.game:gripData")

--------------------------------------------------------

function Corazon.Game:loadPlayer()
    TriggerServerEvent("corazon:firstConnexionCreate")
end

AddEventHandler("corazon:loadPlayer", function()
    Corazon.Game:loadPlayer()
end)

--------------------------------------------------------
local isConnected = false

AddEventHandler("corazon.game:setIsConnected", function()
    isConnected = true
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(10000)
        
        if isConnected then 
            TriggerServerEvent("corazon_core:goGripCharID")
        end
	end
end)

