local identityMenu = {
	Base = { Title = "Mon Personnage", Blocked = true },
	Data = { currentMenu = "identité" },
	Events = {
		onSelected = function(self, _, btn)
			if btn.name == "~g~Continuer" then
				local buttons, identityData = self.Menu["identité"].b, {}
				local charID = getCharID()

				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local jourIdentity = buttons[3].slidename
				local moisIdentity = buttons[4].slidename
				local yearIdentity = buttons[5].askValue

				if not nameIdentity then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété le nom de votre personnage.") return 
				elseif not lieuIdentity then
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété le lieu de naissance de votre personnage.") return 
				elseif not yearIdentity then
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété l'année de naissance de votre personnage.") return 
                else
					TriggerServerEvent("corazon:saveIdentity", charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity)
					LoadingPrompt("Sauvegarde de votre identité en cours", 3)
					Wait(2500)
					self:CloseMenu(true)
					TriggerEvent("corazon.character:openCreationMenu")
				end
			end
		end,
	},

	Menu = {
		["identité"] = {
			slidertime = 75,
			b = {
				{ name = "Nom RP", ask = "Nom + Prénom" },
				{ name = "Lieu de naissance", Description = "Lieu de naissance de votre personnage", ask = "Blaine County" },
				{ name = "Jour de naissance", slidemax = 31 },
				{ name = "Mois de naissance", slidemax = {"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"} },
				{ name = "Année de naissance", ask = "1975" },
				{ name = "~g~Continuer" }
			}
		}
	}
}

RegisterNetEvent("corazon:createIdentity")
AddEventHandler("corazon:createIdentity", function()
	local charID = getCharID()

	CreateMenu(identityMenu)
end)


RegisterCommand("identité", function()
    TriggerEvent("corazon:createIdentity")
end)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local fakeIdentityMenu = {
	Base = { Title = "Fausse Identité" },
	Data = { currentMenu = "fausse identité" },
	Events = {
		onSelected = function(self, _, btn)	
			if btn.name == "~g~Confirmer" then
				local buttons, identityData = self.Menu["fausse identité"].b, {}
				local charID = getCharID()

				local nameIdentity = buttons[1].askValue or buttons[1].ask
				local lieuIdentity = buttons[2].askValue or buttons[2].ask
				local jourIdentity = buttons[3].slidename
				local moisIdentity = buttons[4].slidename
				local yearIdentity = buttons[5].askValue

				if not nameIdentity then 
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété le nom de votre personnage.") return 
				elseif not lieuIdentity then
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété le lieu de naissance de votre personnage.") return 
				elseif jourIdentity <= 0 then
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété le jour de naissance de votre personnage.") return 
				elseif not yearIdentity then
					ShowAboveRadarMessage("~r~Attention.~n~~w~Vous n'avez pas correctement complété l'année de naissance de votre personnage.") return 
                else
					TriggerServerEvent("corazon:saveFakeIdentity", charID, nameIdentity, lieuIdentity, jourIdentity, moisIdentity, yearIdentity, jobIdentity)
                    self:CloseMenu(true)
				end
			end
		end,
	},

	Menu = {
		["fausse identité"] = {
			slidertime = 75,
			b = {
				{ name = "Nom RP", ask = "Nom + Prénom" },
				{ name = "Lieu de naissance", Description = "Lieu de naissance de votre personnage", ask = "Blaine County" },
				{ name = "Jour de naissance", slidemax = 31 },
				{ name = "Mois de naissance", slidemax = {"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"} },
				{ name = "Année de naissance", ask = "1975" },
				{ name = "Job", ask = "Metier" },
				{ name = "~g~Confirmer" }
			}
		}
	}
}


RegisterNetEvent("corazon:createFakeIdentity")
AddEventHandler("corazon:createFakeIdentity", function()
	local charID = getCharID()

	CreateMenu(fakeIdentityMenu)
end)

