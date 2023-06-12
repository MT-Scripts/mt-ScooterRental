fx_version 'cerulean'
author 'Marttins'
description 'Simple electric scooter rental script'
game 'gta5'
lua54 'yes'

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

escrow_ignore {
    'server.lua',
    'client.lua',
    'config.lua',
}