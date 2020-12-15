local launch = require('awful').spawn

programs = {
    'nitrogen --restore', 
    'kitty', 
    -- 'code', 
    -- 'firefox', 
    -- 'thunar', 
    -- 'mailspring', 
    -- 'flameshot',
    -- 'picom', 
    -- 'copyq'
}
for _, program in pairs(programs) do
    launch(program)
end
