local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
[[=================     ===============     ===============   ========  ========]],
[[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
[[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
[[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
[[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
[[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
[[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
[[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
[[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
[[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
[[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
[[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
[[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
[[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
[[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
[[||.=='    _-'                                                     `' |  /==.||]],
[[=='    _-'                        N E O V I M                         \/   `==]],
[[\   _-'                                                                `-_   /]],
[[ `''                                                                      ``' ]],

    }

dashboard.section.buttons.val = {
dashboard.button("e", ">find file", ":ene! <CR>"),
dashboard.button("f", ">find file", ":Telescope find_files <CR>"),
dashboard.button("p", ">find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
dashboard.button("r", ">recent files", ":Telescope oldfiles <CR>"),
dashboard.button("s", ">scratchpad", ":e ~/documents/scratchpad <CR>"),
dashboard.button("c", ">config", ":e ~/.config/nvim/init.lua <CR>"),
dashboard.button("g", ">gitgud", ":e ~/documents/gitgud <CR>"),
dashboard.button("q", ">quit", ":qa<CR>"),
}
dashboard.section.buttons.opts = {
spacing = 0,
position = "center"
}
local function footer()
return "こんばんは\n  ニール"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
