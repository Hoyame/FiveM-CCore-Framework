fx_version 'adamant'
game 'gta5'

server_script '@mysql-async/lib/MySQL.lua'

client_scripts {
	'callback/cl_callback.lua',
	----------------------------------------------
	'core/sh_menu.lua',
	'core/sh_functions.lua',
	'core/cl_skinchanger.lua',
	'core/cl_players.lua',
	'core/cl_game.lua'
	
}

server_scripts {
	'callback/sv_callback.lua',
	----------------------------------------------
	'core/sv_players.lua',
	'core/sv_game.lua'
}