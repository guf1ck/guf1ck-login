fx_version "adamant"
game "gta5"
owner "guf1ck, my discord"

lua54 'yes' -- cfx escrow

ui_page "web/build/index.html"

client_script "client.lua"

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server.lua"
}

files {
    "web/build/*",
    "web/build/**/*",
}