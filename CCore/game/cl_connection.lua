Corazon = {}
Corazon.Connexion = {}
Corazon.Connexion.Anim = {}
cPlayer = {}
cPlayer.player = {}

local especeOne, banqueOne, metierOne, especeTwo, banqueTwo, metierTwo
local nomOne = ""
local nomTwo = ""
local activeOne = false
local activeTwo = false
local twoSlotLibre
local oneSlotLibre


RMenu.Add('charSelector', 'main', RageUI.CreateMenu("CCore", "CConnexion"))

RMenu:Get('charSelector', 'main'):SetSubtitle("CCore")
RMenu:Get('charSelector', 'main').Closed = function()
    -- TODO Perform action
end;

RMenu.Add('charSelector', 'main', RageUI.CreateMenu("CCore", "CConnexion"))

RMenu:Get('charSelector', 'main'):SetSubtitle("CCore")
RMenu:Get('charSelector', 'main').Closed = function()
    -- TODO Perform action
end;

RageUI.CreateWhile(1.0, true, function()

    if IsControlJustPressed(1, 51) then
        RageUI.Visible(RMenu:Get('charSelector', 'main'), not RageUI.Visible(RMenu:Get('charSelector', 'main')))
    end

	if RageUI.Visible(RMenu:Get('charSelector', 'main')) then
		
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
			RageUI.Button(translate('character').." 1", "Slot n°1", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
				if (Selected) then
					TriggerServerEvent("corazon_connexion:setCharID", "1")
					setCharID("1")
					local charID = getCharID()
					Corazon.Connexion.Anim:Connected(charID)
	
					if oneSlotLibre == true then
						self:CloseMenu(true)
						TriggerEvent("corazon:spawnCharacterData")
						--TriggerEvent("corazon_core:getPlayerData")
						TriggerServerEvent("corazon:spawnPlayerToLastPosition", charID)
						TriggerEvent("corazon.game:setIsConnected")
					elseif oneSlotLibre == false then 
						self:CloseMenu(true)
						TriggerEvent("corazon:createIdentity")
					end
				end
			end)

			RageUI.Button(translate('character').." 2", "Slot n°2", { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
				if (Selected) then
					TriggerServerEvent("corazon_connexion:setCharID", "2")
					setCharID("2")
					local charID = getCharID()
					Corazon.Connexion.Anim:Connected(charID)
	
					if twoSlotLibre == true then
						RageUI.CloseAll()
						TriggerEvent("corazon:spawnCharacterData")
						--TriggerEvent("corazon_core:getPlayerData")
						TriggerServerEvent("corazon:spawnPlayerToLastPosition", charID)
						TriggerEvent("corazon.game:setIsConnected")
					elseif twoSlotLibre == false then 
						RageUI.CloseAll()
						TriggerEvent("corazon:createIdentity")
					end
				end
			end)
        end, function()
            ---Panels
        end)
    end

end, 1)

function openCharSelectorMenu()
    RageUI.Visible(RMenu:Get('charSelector', 'main'), not RageUI.Visible(RMenu:Get('charSelector', 'main')))
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('corazon_connexion:dataGripSelectPersoOne')
AddEventHandler('corazon_connexion:dataGripSelectPersoOne', function(result)
	activeOne = true

	nomOne = tostring(result[1].iNom)
	especeOne = tonumber(result[1].pEspece)
	banqueOne = tonumber(result[1].pBanque)
	metierOne = tostring(result[1].pJob)
end)

RegisterNetEvent('corazon_connexion:dataGripSelectPersoTwo')
AddEventHandler('corazon_connexion:dataGripSelectPersoTwo', function(result)
	activeTwo = true

	nomTwo = tostring(result[1].iNom)
	especeTwo = tonumber(result[1].pEspece)
	banqueTwo = tonumber(result[1].pBanque)
	metierTwo = tostring(result[1].pJob)
end)

local function selectPersoOne()
	if metierOne == "nil" then 
		metierOne = translate('unemployed')
	end

	if nomOne == "nil" then 
		oneSlotLibre = false
		DrawRect(0.883000000000001, 0.300, 0.185, 0.250, 0, 0, 0, 220)
		DrawAdvancedText2(0.975000000000001, 0.220, 0.005, 0.0028, 0.500, "~b~~b~Slot n°1", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText2(0.897000000000001, 0.305, 0.005, 0.0028, 0.550, translate('slotvide'), 255, 255, 255, 255, 0, 1)
	else
		oneSlotLibre = true
		DrawRect(0.883000000000001, 0.300, 0.185, 0.250, 0, 0, 0, 220)
		DrawAdvancedText2(0.975000000000001, 0.220, 0.005, 0.0028, 0.500, "~b~~b~Slot n°1", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText2(0.897000000000001, 0.290, 0.005, 0.0028, 0.300, translate('name').." : "..nomOne, 255, 255, 255, 255, 0, 1)
		DrawAdvancedText2(0.897000000000001, 0.320, 0.005, 0.0028, 0.300, translate('cash').." : "..especeOne, 255, 255, 255, 255, 0, 1)
		DrawAdvancedText2(0.897000000000001, 0.350, 0.005, 0.0028, 0.300, translate('bank').." : "..banqueOne, 255, 255, 255, 255, 0, 1)
		DrawAdvancedText2(0.897000000000001, 0.380, 0.005, 0.0028, 0.300, translate('occupation').." : "..metierOne, 255, 255, 255, 255, 0, 1)
	end
end

local function selectPersoTwo()
	if metierTwo == "nil" then 
		metierTwo = translate('unemployed')
	end

	if nomTwo == "nil" then 
		twoSlotLibre = false
		DrawRect(0.883000000000001, 0.600, 0.185, 0.250, 0, 0, 0, 220)
		DrawAdvancedText2(0.975000000000001, 0.520, 0.005, 0.0028, 0.500, "~b~~b~Slot n°2", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText2(0.897000000000001, 0.605, 0.005, 0.0028, 0.550, translate('slotvide'), 255, 255, 255, 255, 0, 1)
	else 
		twoSlotLibre = true
		DrawRect(0.883000000000001, 0.600, 0.185, 0.250, 0, 0, 0, 220)
		DrawAdvancedText2(0.975000000000001, 0.520, 0.005, 0.0028, 0.500, "~b~~b~Slot n°2", 255, 255, 255, 255, 0, 0)
		DrawAdvancedText2(0.897000000000001, 0.590, 0.005, 0.0028, 0.300, translate('name').." : "..nomTwo, 255, 255, 255, 255, 0, 1)
		DrawAdvancedText2(0.897000000000001, 0.620, 0.005, 0.0028, 0.300, translate('cash').." : "..especeTwo, 255, 255, 255, 255, 0, 1)
		DrawAdvancedText2(0.897000000000001, 0.650, 0.005, 0.0028, 0.300, translate('bank').." : "..banqueTwo, 255, 255, 255, 255, 0, 1)
		DrawAdvancedText2(0.897000000000001, 0.680, 0.005, 0.0028, 0.300, translate('occupation').." : "..metierTwo, 255, 255, 255, 255, 0, 1)
	end
end

function Corazon.Connexion:goSvGrip()
	TriggerServerEvent("corazon_connexion:goDataGripOne")
	TriggerServerEvent("corazon_connexion:goDataGripTwo")
end

RegisterCommand("zboubi", function()
	Corazon.Connexion:goSvGrip()
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if activeOne and activeTwo then
			selectPersoOne()
			selectPersoTwo()
		end
	end
end)

RegisterCommand("printResult", function()
    print(getCharID())
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Corazon.Connexion.Anim:upAnim()

	SwitchOutPlayer(PlayerPedId(), 0, 1)
	Wait(5000)
	DoScreenFadeIn(800)
	LoadingPrompt(translate('loading_in_progress'), 1)
	Wait(12500)
	RemoveLoadingPrompt()
	
	LoadingPrompt(translate('wait_select_char'), 1)
	Corazon.Connexion:goSvGrip()
	openCharSelectorMenu()
end

function Corazon.Connexion.Anim:downAnim()
	SwitchInPlayer(PlayerPedId())
	RemoveLoadingPrompt()
end

function Corazon.Connexion.Anim:Connected()
	activeOne = false
	activeTwo = false

	
--	TriggerEvent(corazon:createIdentity)
	TriggerMusicEvent("GLOBAL_KILL_MUSIC")
	
	Wait(10)

	Corazon.Connexion.Anim:downAnim()

	Wait(7500)

	--PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
	ShowAboveRadarMessage(translate('connected_to_server'))
end

RegisterCommand("goLoad", function()
	Corazon.Connexion.Anim:upAnim()
end)

RegisterCommand("debugLoad", function()
	Corazon.Connexion.Anim:downAnim()
end)

RegisterNetEvent("corazon.connexion:goUpAnim")
AddEventHandler("corazon.connexion:goUpAnim", function()
	Corazon.Connexion.Anim:upAnim()
end)

------------------------------------------------

RegisterCommand("playerSpawned", function()
	TriggerEvent("playerSpawned")
end)

RegisterCommand("getCharID", function()
	print(getCharID())
end)

local function firstFunction()
	DoScreenFadeOut(800)
	TriggerEvent("corazon:loadPlayer")
end

AddEventHandler("playerSpawned", firstFunction)



----------------------------------------------------------------------------------
