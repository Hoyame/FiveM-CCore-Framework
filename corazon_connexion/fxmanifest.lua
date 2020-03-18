fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'

client_scripts {
	'@corazon_core/callback/cl_callback.lua',
	----------------------------------------------
	'@corazon_core/core/sh_menu.lua',
	'@corazon_core/core/sh_functions.lua',
	'@corazon_core/core/cl_skinchanger.lua',
	'@corazon_core/core/cl_players.lua',
	'@corazon_core/core/cl_game.lua'
}

server_scripts {
	'@corazon_core/callback/sv_callback.lua',
	----------------------------------------------
	'@corazon_core/core/sv_players.lua',
	'@corazon_core/core/sv_game.lua'
}

client_scripts {
	'game/cl_connection.lua'
}

server_scripts {
	'game/sv_connection.lua'
}