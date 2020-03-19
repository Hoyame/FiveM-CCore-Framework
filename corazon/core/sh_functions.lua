local zboubi

function ShowAboveRaderMedals(name, dict, medal)
	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(name)
	Citizen.InvokeNative(0xAA295B6F28BD587D, dict, medal, 0, 109, "HUD_MED_UNLKED")
end

RegisterNetEvent("corazon:ShowAboveRaderMedals")
AddEventHandler("corazon:ShowAboveRaderMedals", function(name, dict, medal)
	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(name)
	Citizen.InvokeNative(0xAA295B6F28BD587D, dict, medal, 0, 109, "HUD_MED_UNLKED")
end)

function ShowAboveRadarMessage(message, back)
	if back then Citizen.InvokeNative(0x92F0DA1E27DB96DC, back) end
	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(message)
	if string.len(message) > 99 and AddLongString then AddLongString(message) end
	return DrawNotification(0, 1)
end

RegisterNetEvent("corazon:ShowAboveRadarMessage")
AddEventHandler("corazon:ShowAboveRadarMessage", function(message, back)
	if back then Citizen.InvokeNative(0x92F0DA1E27DB96DC, back) end
	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(message)
	if string.len(message) > 99 and AddLongString then AddLongString(message) end
	return DrawNotification(0, 1)
end)

function ShowHelpNotification(msg)
	AddTextEntry('zbiHelpNotification', msg)
	BeginTextCommandDisplayHelp('zbiHelpNotification')
	EndTextCommandDisplayHelp(0, false, true, -1)
end

RegisterNetEvent("corazon:ShowHelpNotification")
AddEventHandler("corazon:ShowHelpNotification", function(msg)
	AddTextEntry('zbiHelpNotification', msg)
	BeginTextCommandDisplayHelp('zbiHelpNotification')
	EndTextCommandDisplayHelp(0, false, true, -1)
end)

function ShowAboveRadarMessageIcon(icon, intType, sender, title, text, back)

	if type(icon) == "number" then

		local ped = GetPlayerPed(GetPlayerFromServerId(icon))
		icon = ped and GetPedHeadshot(ped) or GetPedHeadshot(PlayerPedId())

	elseif not HasStreamedTextureDictLoaded(icon) then

		RequestStreamedTextureDict(icon, false)
		while not HasStreamedTextureDictLoaded(icon) do Wait(0) end

	end

	if back then
		SetNotificationBackgroundColor(back)
	end

	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(text)
	if string.len(text) > 99 and AddLongString then AddLongString(text) end

	SetNotificationMessage(icon, icon, true, intType, sender, title)
	SetStreamedTextureDictAsNoLongerNeeded(icon)
	return DrawNotification(0, 1)

end

RegisterNetEvent("corazon:ShowAboveRadarMessageIcon")
AddEventHandler("corazon:ShowAboveRadarMessageIcon", function(icon, intType, sender, title, text, back)

	if type(icon) == "number" then

		local ped = GetPlayerPed(GetPlayerFromServerId(icon))
		icon = ped and GetPedHeadshot(ped) or GetPedHeadshot(PlayerPedId())

	elseif not HasStreamedTextureDictLoaded(icon) then

		RequestStreamedTextureDict(icon, false)
		while not HasStreamedTextureDictLoaded(icon) do Wait(0) end

	end

	if back then
		SetNotificationBackgroundColor(back)
	end

	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(text)
	if string.len(text) > 99 and AddLongString then AddLongString(text) end

	SetNotificationMessage(icon, icon, true, intType, sender, title)
	SetStreamedTextureDictAsNoLongerNeeded(icon)
	return DrawNotification(0, 1)

end)

function drawCenterText(msg, time)

	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(msg)
	DrawSubtitleTimed(time and math.ceil(time) or 0, true)

end

RegisterNetEvent("corazon:drawCenterText")
AddEventHandler("corazon:drawCenterText", function(msg, time)

	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(msg)
	DrawSubtitleTimed(time and math.ceil(time) or 0, true)

end)

function drawScrTxt(x, y, w, h, f, s, text, outline, center, wr)

	SetTextFont(f)
	SetTextScale(s, s)
	SetTextColour(255, 255, 255, 255)

	if center then
		SetTextCentre(true)
	end

	SetTextDropShadow()

	if outline then
		SetTextOutline()
	end

	if wr then
		SetTextWrap(0.0, xSMS + 0.125)
	end

	SetTextEntry("halloufgang")
	AddTextComponentString(text)
	if string.len(text) > 99 and AddLongString then AddLongString(text) end
	DrawText(x - w / 2, y - h / 2 + 0.005)

end


function LoadingPrompt(loadingText, spinnerType)

	if IsLoadingPromptBeingDisplayed() then
		RemoveLoadingPrompt()
	end

	if (loadingText == nil) then
		BeginTextCommandBusyString(nil)
	else
		BeginTextCommandBusyString("STRING");
		AddTextComponentSubstringPlayerName(loadingText);
	end

	EndTextCommandBusyString(spinnerType)
end

function DrawAdvancedText2(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function stringsplit(inputstr, sep)

	if not inputstr then return end

	if sep == nil then
		sep = "%s"
	end

	local t = {} ; i = 1

	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		t[i] = str
		i = i + 1
	end

	return t

end

function firstToUpper(str)

	str = string.lower(tostring(str))
	return str:gsub("^%l", string.upper)

end

function drawTxt(x,y,scale, text, f,c,n, a)

	a = a or 255

	if not r then r = 255 g = 255 b = 255 end
	if not f then f = 4 end

	SetTextFont(f)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextCentre(c)

	if not n then
		SetTextDropShadow()
		SetTextOutline()
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(2, 0, 0, 0, 255)
	end

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)

end

function drawTopNotification(txt, beep)

	SetTextComponentFormat("halloufgang")
	AddTextComponentString(txt)
	if string.len(txt) > 99 and AddLongString then AddLongString(txt) end
	DisplayHelpTextFromStringLabel(0, 0, beep, -1)

end

function drawCustomNotif(txt)

	SetNotificationTextEntry("halloufgang")
	AddTextComponentString(txt)
	if string.len(txt) > 99 and AddLongString then AddLongString(txt) end
	Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", 0, 0, "mee", "qsdqsdsdqqsd", 1.0)
	DrawNotification(0, 1)

end

function createBlip(vectorPosX, vectorPosY, vectorPosZ, blipSprite, blipColor, blipText, blipText, blipScale, blipDisplay, blipAlpha)

	local blip = AddBlipForCoord(vectorPosX, vectorPosY, vectorPosZ)

	SetBlipSprite(blip, blipSprite)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, blipColor)
	SetBlipScale(blip, blipScale)
	SetBlipRoute(blip, blipText)
	SetBlipDisplay(blip, blipDisplay)
	SetBlipAlpha(blip, blipAlpha)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(blipText)
	EndTextCommandSetBlipName(blip)

	return blip

end
