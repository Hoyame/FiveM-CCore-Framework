print("^0======================================================================^7")
print("^0[^4Auteur^0] ^7:^0 ^0NOS^7")
print("^0[^2Menu By^0] ^7:^0 ^5Cora^7")
print("^0======================================================================^7")

local interactionApu = {
    Base = { Title = "Shop" },
    Data = { currentMenu = "apu" },
    Events = {
        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentMenu, currentSlt, result)

            --if btn.name == "~b~Sauvegarder Position" then
			--	RequestToSave()
            --end
            
            print(btn.name)
        end, 
    },

    Menu = {
        
        ["apu"] = {
            slidertime = 75,
            b = {
                { name = "Nouriture" },
                { name = "Divers" }
            }
        },

        ["nouriture"] = {
            slidertime = 75,
            b = {
                { name = "~r~                                    NOS_SHOP"},
                { name = "---------------------------------------------------------------------" },
                { name = "~b~Eau ", Description = "eau de qualité", ask = "~g~3$", askX = true },
                { name = "~b~Pain ", Description = "pain de qualité", ask = "~g~5$", askX = true },
                { name = "---------------------------------------------------------------------" },
                { name = "~o~barre de céreales", ask = "~g~7$", askX = true },
            }

        },

        ["divers"] = {
            slidertime = 75,
            b = {
                { name = "~r~                                    NOS_SHOP"},
                { name = "---------------------------------------------------------------------" },
                { name = "~b~briquet ", Description = "BIC", ask = "~g~7$", askX = true },
                { name = "~b~wilson ", Description = "paquet de cigarette", ask = "~g~10$", askX = true },
                { name = "---------------------------------------------------------------------" },
                { name = "~o~Bonbon         ~b~Offert par Apu", Description = "Haribo", ask = "~g~7$", askX = true },
            }
        }
    }
}

local positionApu = {
    {x = 25.742, y = -1345.741, z = 28.497}
}



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(positionApu) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionApu[k].x, positionApu[k].y, positionApu[k].z)

            if dist <= 2.0 then
                ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour parler avec ~b~Apu")
				if IsControlJustPressed(1,51) then 
                    --mainMenu:Visible(not mainMenu:Visible())
                    --print("test")
                    CreateMenu(interactionApu)
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

   

    ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.04, -1345.78, 29.5,  true, true)

    --ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_shopkeep_01", 24.04, -1345.78, 29.5,true, true)

    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)

end)