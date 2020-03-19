RegisterServerEvent('corazon_character:saveSkin')
AddEventHandler('corazon_character:saveSkin', function(skin, charID)
    local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local charID = charID

	MySQL.Async.execute('UPDATE joueurs_d'..charID..'_perso SET `dataSkin` = @skin WHERE license = @license', {
		['@skin'] = json.encode(skin),
		['@license'] = license
	})
end)

RegisterServerCallback('corazon_character:getPlayerSkinOne', function(source, cb)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM joueurs_d1_perso WHERE license = @license', {
		['@license'] = license
	}, function(joueurs_d1_perso)
        local user = joueurs_d1_perso[1]
		local skin = nil

		if user.dataSkin ~= nil then
			skin = json.decode(user.dataSkin)
		end
		
		cb(skin)
	end)
end)

RegisterServerCallback('corazon_character:getPlayerSkinTwo', function(source, cb)
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM joueurs_d2_perso WHERE license = @license', {
		['@license'] = license
	}, function(joueurs_d2_perso)
        local user = joueurs_d2_perso[1]
		local skin = nil

		if user.dataSkin ~= nil then
			skin = json.decode(user.dataSkin)
		end
		
		cb(skin)
	end)
end)