fx_version 'cerulean' -- Latest recommended version for FiveM resources
game 'gta5'           -- Specifies that the script is for GTA V

author 'YourName'     -- Replace with your name or alias
description 'Waypoint Synchronization Script for Radio Channels'
version '1.0.0'

-- Shared configuration script
shared_script 'config.lua'

-- Client Scripts
client_scripts {
    'client/main.lua' -- The main client script located in the client folder
}

-- Server Scripts
server_scripts {
    'server/main.lua' -- The main server script located in the server folder
}


