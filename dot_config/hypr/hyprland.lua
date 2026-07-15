require("keybindings")
require("windowrules")

local home = os.getenv("HOME")
local scr_path = home .. "/.config/hypr/scripts"

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto"
})


hl.on("hyprland.start", function()
    hl.exec_cmd(scr_path .. "/resetxdgportal.sh")
    hl.exec_cmd(scr_path .. "/polkitkdeauth.sh")
    hl.exec_cmd("waybar")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("udiskie --no-automount --smart-tray")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd(scr_path .. "/batterynotify.sh")

    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")

    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Inter 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name 'Inter 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaCove Nerd Font Mono 9'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting 'slight'")
end)


hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 15,
        border_size      = 1,
        layout           = "scrolling",
        resize_on_border = true,

        col              = {
            active_border = 0xffff3333,
            inactive_border = 0xff313244,
            nogroup_border = 0xffffaaff,
            nogroup_border_active = 0xffff00ff

        }
    },

    decoration = {
        rounding = 2,
        dim_special = 0.3,

        shadow = {
            enabled = false
        },

        blur = {
            enabled = true,
            size = 10,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
            special = true
        }
    },

    animations = {
        enabled = true,
        workspace_wraparound = false
    },

    input = {
        kb_layout = "us, ua",
        kb_options = "grp:alt_shift_toggle",
        follow_mouse = 1,
        sensitivity = 0,
        force_no_accel = true,
        numlock_by_default = true,

        touchpad = {
            natural_scroll = true
        }
    },

    dwindle = {
        preserve_split = true
    },

    scrolling = {
        column_width = 1.0,
        fullscreen_on_one_column = true,
        explicit_column_widths = "0.5, 1.0",

        focus_fit_method = 1,
        follow_focus = true,
        wrap_focus = true,
        direction = "right"
    },

    misc = {
        vrr = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        background_color = "0xff212121"
    },

    xwayland = {
        force_zero_scaling = true
    }
})


hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1.0 } } })
hl.curve("liner", { type = "bezier", points = { { 1.0, 1.0 }, { 1.0, 1.0 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "winIn", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner", style = "once" })
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "wind", style = "slidevert" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind", style = "slidevert" })
