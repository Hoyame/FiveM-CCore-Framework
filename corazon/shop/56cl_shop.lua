local superetteLegale = {
    Base = { Header = {"shopui_title_conveniencestore", "shopui_title_conveniencestore"}, Title = "" },
	Data = { currentMenu = "superette" },
	Events = {
		onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)
				
			--if btn.name == "~b~Sauvegarder Position" then
			--	RequestToSave()
            --end
            
            print(btn.name)
		end,
	},

	Menu = {
		["superette"] = {
			slidertime = 75,
			b = {
                { name = "Nourriture", Description = "A Manger" },
                { name = "Boissons", Description = "A Boire" },
                { name = "En Cas", Description = "A En-caser" },
                { name = "Divers", Description = "Divers" },
			}
        },

        ["nourriture"] = {
			slidertime = 75,
			b = {
                { name = "Sandwhitch", ask = "~g~2$", askX = true},
                { name = "Donnuts", ask = "~g~3$", askX = true },
                { name = "Chips", ask = "~g~1$", askX = true },
                { name = "---------------------------------------------------------------------" },
                { name = "Saumon", Description = "Saumon fait avec les pieds a APU" , ask = "~g~4$", askX = true },
                { name = "Ptit Pois", Description = "Ptit Pois fait avec les gros doigts a APU" , ask = "~g~2$", askX = true },
                { name = "BonBon", Description = "Demain il viendera te chercher a l'ecole" , ask = "~b~Offert par APU", askX = true },

			}
        },

        ["boissons"] = {
			slidertime = 75,
			b = {
                { name = "Cherenkov", ask = "~g~8$", askX = true },
                { name = "Ragga Rum", ask = "~g~9$", askX = true },			
                { name = "Bourgeoix", ask = "~g~12$", askX = true },		
                { name = "Kogo", ask = "~g~11$", askX = true },		
                { name = "---------------------------------------------------------------------" },
                { name = "Cola", ask = "~g~2$", askX = true },		
                { name = "Sprunk", ask = "~g~1$", askX = true },		
                { name = "Orang-tang", ask = "~g~2$", askX = true },		
                { name = "Granita", ask = "~g~4$", askX = true },		
            }
        },

        ["en cas"] = {
			slidertime = 75,
			b = {
                { name = "EgoChaser",  ask = "~g~2$", askX = true },		
                { name = "Meteorite", ask = "~g~1$", askX = true },		
                { name = "P's & Q's", ask = "~g~2$", askX = true },		
                { name = "Paquet de Redwoods", ask = "~g~3$", askX = true },
                { name = "Pisswasser", ask = "~g~5$", askX = true },				
			}
        },

        ["divers"] = {
			slidertime = 75,
			b = {
                { name = "Tilifune", Description = "Telephone", ask = "~g~200$" },	
                { name = "Une Carte SIM", Description = "Carte SIM pour tilifune", ask = "~g~20$" },		
                { name = "Enceinte", Description = "Pour ecouter de la zik avec les potes a la compote", ask = "~g~10$" },		
			}
        }
	}
}


local positionSuperette = {
    {x = 25.742, y = -1345.741, z = 28.497}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(positionSuperette) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionSuperette[k].x, positionSuperette[k].y, positionSuperette[k].z)

            if dist <= 2.0 then
                ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec ~b~APU")
				if IsControlJustPressed(1,51) then 
                    --mainMenu:Visible(not mainMenu:Visible())
                    --print("test")
                    CreateMenu(superetteLegale)
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_m_shopkeep_01")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.129, -1345.156, 28.497, 266.946, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)