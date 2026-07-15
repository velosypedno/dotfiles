local modifier = "SUPER"
local alt_mod  = "ALT"

local term     = "kitty"
local editor   = "zeditor"
local file     = "thunar"
local browser  = "firefox"

local home     = os.getenv("HOME")
local scr_path = home .. "/.config/hypr/scripts"


hl.bind(modifier .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Color Picker" })
hl.bind(modifier .. " + Q", hl.dsp.window.close())
hl.bind(modifier .. " + Delete", hl.dsp.exit())
hl.bind(modifier .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(modifier .. " + G", hl.dsp.group.toggle())
hl.bind(alt_mod .. " + Return", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(modifier .. " + L", hl.dsp.exec_cmd("swaylock"))
hl.bind(modifier .. " + Backspace", hl.dsp.exec_cmd(home .. "/.config/rofi/powermenu.sh"))



hl.bind(modifier .. " + T", hl.dsp.exec_cmd(term))
hl.bind(modifier .. " + E", hl.dsp.exec_cmd(file))
hl.bind(modifier .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(modifier .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(modifier .. " + B", hl.dsp.exec_cmd("flatpak run me.timschneeberger.GalaxyBudsClient"))



hl.bind(modifier .. " + A",
    hl.dsp.exec_cmd("pkill -x rofi || rofi -show drun -theme " .. home .. "/.config/rofi/config.rasi"))
hl.bind(modifier .. " + V",
    hl.dsp.exec_cmd("pkill -x rofi || cliphist list | rofi -dmenu -theme " ..
        home .. "/.config/rofi/clipboard.rasi | cliphist decode | wl-copy"))



hl.bind("F10", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -o m"), { locked = true })
hl.bind("F11", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -o d"), { repeating = true, locked = true })
hl.bind("F12", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -o i"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -o m"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -i m"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -o d"),
    { repeating = true, locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scr_path .. "/volumecontrol.sh -o i"),
    { repeating = true, locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scr_path .. "/brightnesscontrol.sh i"),
    { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scr_path .. "/brightnesscontrol.sh d"),
    { repeating = true, locked = true })

hl.bind(modifier .. " + CTRL + H", hl.dsp.group.prev())
hl.bind(modifier .. " + CTRL + L", hl.dsp.group.next())

hl.bind(modifier .. " + P", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))
hl.bind(modifier .. " + CTRL + P", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | swappy -f -]]))


hl.bind(modifier .. " + CTRL + left", hl.dsp.focus({ direction = "l" }))
hl.bind(modifier .. " + CTRL + right", hl.dsp.focus({ direction = "r" }))

hl.bind(modifier .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(modifier .. " + down", hl.dsp.focus({ direction = "d" }))
hl.bind(alt_mod .. " + Tab", hl.dsp.focus({ direction = "d" }))

for i = 1, 10 do
    local key = tostring(i % 10)

    hl.bind(modifier .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(modifier .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(modifier .. " + " .. alt_mod .. " + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(modifier .. " + CTRL + up", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(modifier .. " + CTRL + down", hl.dsp.focus({ workspace = "r+1" }))

hl.bind(modifier .. " + CTRL + " .. alt_mod .. " + up", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(modifier .. " + CTRL + " .. alt_mod .. " + down", hl.dsp.window.move({ workspace = "r+1" }))

hl.bind(modifier .. " + CTRL + " .. alt_mod .. " + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(modifier .. " + CTRL + " .. alt_mod .. " + right", hl.dsp.window.move({ direction = "r" }))

hl.bind(modifier .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(modifier .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(modifier .. " + " .. alt_mod .. " + S", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(modifier .. " + S", hl.dsp.workspace.toggle_special())

hl.bind(modifier .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(modifier .. " + SHIFT + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(modifier .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(modifier .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })


local function move_active_window(dir, x, y)
    local handle = io.popen([[hyprctl activewindow -j]])
    if not handle then return end

    local result = handle:read("*a")
    handle:close()

    local is_floating = result:match([["floating":%s*(true)]]) == "true"

    if is_floating then
        hl.dispatch(hl.dsp.window.move({ x = x, y = y, relative = true }))
    else
        hl.dispatch(hl.dsp.window.move({ direction = dir }))
    end
end

hl.bind(modifier .. " + SHIFT + CTRL + left", function() move_active_window("l", -30, 0) end,
    { description = "Move activewindow left" })
hl.bind(modifier .. " + SHIFT + CTRL + right", function() move_active_window("r", 30, 0) end,
    { description = "Move activewindow right" })
hl.bind(modifier .. " + SHIFT + CTRL + up", function() move_active_window("u", 0, -30) end,
    { description = "Move activewindow up" })
hl.bind(modifier .. " + SHIFT + CTRL + down", function() move_active_window("d", 0, 30) end,
    { description = "Move activewindow down" })

hl.bind(modifier .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(modifier .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(modifier .. " + Z", hl.dsp.window.drag(), { mouse = true })
hl.bind(modifier .. " + X", hl.dsp.window.resize(), { mouse = true })

hl.bind(modifier .. " + SHIFT + space", hl.dsp.layout("colresize +conf"))
