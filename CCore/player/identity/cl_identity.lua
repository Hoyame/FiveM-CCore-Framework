Corazon.Identity = {}
Corazon.FakeIdentity = {}

RMenu.Add('identity', 'main', RageUI.CreateMenu(translate('my_personnage'), translate('my_personnage')))

RMenu:Get('identity', 'main'):SetSubtitle(translate('my_personnage'))
RMenu:Get('identity', 'main').Closed = function()
    -- TODO Perform action
end;

RageUI.CreateWhile(1.0, true, function()
	if RageUI.Visible(RMenu:Get('identity', 'main')) then
		
		RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
			
			RageUI.Button(translate('identity_nomrp'), translate('identity_nomrp'), { RightLabel = Corazon.Identity.Name }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.Identity.Name = KeyboardInput("", "Name", 25)
				end
			end)
	
			RageUI.Button(translate('identity_lieudn'), translate('identity_lieudn'), { RightLabel = Corazon.Identity.Lieu }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.Identity.Lieu = KeyboardInput("", "Blaine County", 25)
				end
			end)
	
			RageUI.Button(translate('identity_jourdn'), translate('identity_jourdn'), { RightLabel = Corazon.Identity.Jour }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.Identity.Jour = KeyboardInput("", "03", 25)
				end
			end)

			RageUI.Button(translate('identity_moisdn'), translate('identity_moisdn'), { RightLabel = Corazon.Identity.Mois }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.Identity.Mois = KeyboardInput("", "12", 25)
				end
			end)

			RageUI.Button(translate('identity_annedn'), translate('identity_annedn'), { RightLabel = Corazon.Identity.Anne }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.Identity.Anne = KeyboardInput("", "1999", 25)
				end
			end)
	
			RageUI.Button(translate('identity_continue'), translate('identity_continue'), { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
				if (Selected) then
					local charID = getCharID()
	
					local nameIdentity = Corazon.Identity.Name
					local lieuIdentity = Corazon.Identity.Lieu
					local jourIdentity = Corazon.Identity.Jour
					local moisIdentity = Corazon.Identity.Mois
					local yearIdentity = Corazon.Identity.Anne
	
					if not nameIdentity then 
						ShowAboveRadarMessage(translate('error_identity_creator')) return 
					elseif not lieuIdentity then
						ShowAboveRadarMessage(translate('error_identity_creator')) return 
					elseif not yearIdentity then
						ShowAboveRadarMessage(translate('error_identity_creator')) return 
					else
						TriggerServerEvent("corazon:saveIdentity", charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)
						LoadingPrompt("Sauvegarde de votre identité en cours", 3)
						Wait(2500)
						RageUI.CloseAll()
						TriggerEvent("corazon.character:openCreationMenu")
					end
				end
			end)
        end, function()
            ---Panels
        end)
    end
end, 1)


RegisterNetEvent("corazon:createIdentity")
AddEventHandler("corazon:createIdentity", function()
	local charID = getCharID()

	RageUI.Visible(RMenu:Get('identity', 'main'), not RageUI.Visible(RMenu:Get('identity', 'main')))
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RMenu.Add('fakeidentity', 'main', RageUI.CreateMenu(translate('fake_identity'), translate('fake_identity')))

RMenu:Get('fakeidentity', 'main'):SetSubtitle(translate('fake_identity'))
RMenu:Get('fakeidentity', 'main').Closed = function()
    -- TODO Perform action
end;

RageUI.CreateWhile(1.0, true, function()
	if RageUI.Visible(RMenu:Get('fakeidentity', 'main')) then
		
		RageUI.DrawContent({ header = true, glare = true, instructionalButton = true }, function()
			
			RageUI.Button(translate('identity_nomrp'), translate('identity_nomrp'), { RightLabel = Corazon.Identity.Name }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.FakeIdentity.Name = KeyboardInput("", "Name", 25)
				end
			end)
	
			RageUI.Button(translate('identity_lieudn'), translate('identity_lieudn'), { RightLabel = Corazon.Identity.Lieu }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.FakeIdentity.Lieu = KeyboardInput("", "Blaine County", 25)
				end
			end)
	
			RageUI.Button(translate('identity_jourdn'), translate('identity_jourdn'), { RightLabel = Corazon.Identity.Jour }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.FakeIdentity.Jour = KeyboardInput("", "02", 25)
				end
			end)

			RageUI.Button(translate('identity_moisdn'), translate('identity_moisdn'), { RightLabel = Corazon.Identity.Mois }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.FakeIdentity.Mois = KeyboardInput("", "12", 25)
				end
			end)

			RageUI.Button(translate('identity_annedn'), translate('identity_annedn'), { RightLabel = Corazon.Identity.Anne }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.FakeIdentity.Anne = KeyboardInput("", "1999", 25)
				end
			end)

			RageUI.Button(translate('occupation'), translate('occupation'), { RightLabel = Corazon.Identity.Anne }, true, function(Hovered, Active, Selected)
				if Selected then
					Corazon.FakeIdentity.Anne = KeyboardInput("", "Job", 25)
				end
			end)
	
			RageUI.Button(translate('identity_continue'), translate('identity_continue'), { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
				if (Selected) then
					local charID = getCharID()
	
					local nameIdentity = Corazon.FakeIdentity.Name
					local lieuIdentity = Corazon.FakeIdentity.Lieu
					local jourIdentity = Corazon.FakeIdentity.Jour
					local moisIdentity = Corazon.FakeIdentity.Mois
					local yearIdentity = Corazon.FakeIdentity.Anne
					local jobIdentity  = Corazon.FakeIdentity.Anne

	
					if not nameIdentity then 
						ShowAboveRadarMessage(translate('error_identity_creator')) return 
					elseif not lieuIdentity then
						ShowAboveRadarMessage(translate('error_identity_creator')) return 
					elseif not yearIdentity then
						ShowAboveRadarMessage(translate('error_identity_creator')) return 
					else
						TriggerServerEvent("corazon:saveFakeIdentity", charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, jobIdentity)
						self:CloseMenu(true)
					end
				end
			end)
        end, function()
            ---Panels
        end)
    end
end, 1)

RegisterNetEvent("corazon:createFakeIdentity")
AddEventHandler("corazon:createFakeIdentity", function()
	local charID = getCharID()

	RageUI.Visible(RMenu:Get('fakeidentity', 'main'), not RageUI.Visible(RMenu:Get('fakeidentity', 'main')))
end)

RegisterCommand("identity", function()
	RageUI.Visible(RMenu:Get('identity', 'main'), not RageUI.Visible(RMenu:Get('identity', 'main')))
end)