local love = require("love")

_G.game = {
    state = {
       menu = true,
       paused = false,
       running = false, 
       ended = false,
    }}

return game