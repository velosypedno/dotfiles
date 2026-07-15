-- --- Browsers ---
hl.window_rule({
    name = "browser-opacity",
    match = { class = "^(firefox|Brave-browser)$" },
    opacity = "0.90 0.90"
})

hl.window_rule({
    name = "chrome-full-opacity",
    match = { class = "^(Google-chrome)$" },
    opacity = "1.0 1.0"
})

-- --- Development & Terminal ---
hl.window_rule({
    name = "vscode-transparency",
    match = { class = "^(code-oss|[Cc]ode|code-url-handler|code-insiders-url-handler|zeditor)$" },
    opacity = "1.0 1.0"
})

hl.window_rule({
    name = "terminal-transparency",
    match = { class = "^(kitty)$" },
    opacity = "1.0 1.0"
})

-- --- File Managers & Tools ---
hl.window_rule({
    name = "file-manager-opacity",
    match = { class = "^(org.kde.dolphin|org.kde.ark)$" },
    opacity = "1.0 1.0"
})

hl.window_rule({
    name = "appearance-tools-opacity",
    match = { class = "^(nwg-look|qt5ct|qt6ct|kvantummanager)$" },
    opacity = "1.0 1.0"
})

-- --- System & Audio Controls ---
hl.window_rule({
    name = "system-dialogs-opacity",
    match = { class = "^(org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor)$" },
    opacity = "1.0 1.0"
})

hl.window_rule({
    name = "auth-agents-opacity",
    match = { class = "^(org.kde.polkit-kde-authentication-agent-1|polkit-gnome-authentication-agent-1)$" },
    opacity = "0.80 0.70"
})

hl.window_rule({
    name = "portal-desktop-opacity",
    match = { class = "^(org.freedesktop.impl.portal.desktop.gtk|org.freedesktop.impl.portal.desktop.hyprland)$" },
    opacity = "0.80 0.70"
})

-- --- Media & Gaming ---
hl.window_rule({
    name = "steam-opacity",
    match = { class = "^([Ss]team|steamwebhelper)$" },
    opacity = "0.70 0.70"
})

hl.window_rule({
    name = "obs-studio-opacity",
    match = { class = "^(com.obsproject.Studio)$" },
    opacity = "0.80 0.80"
})

-- --- Social & Communication ---
hl.window_rule({
    name = "communication-apps-opacity",
    match = { class = "^(vesktop|discord|WebCord|ArmCord|Signal)$" },
    opacity = "0.80 0.80"
})

-- --- System & Virtualization ---
hl.window_rule({
    name = "virtualization-tools-opacity",
    match = { class = "^(gnome-boxes|app.drey.Warp|io.missioncenter.MissionCenter)$" },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "flatpak-management-opacity",
    match = { class = "^(com.github.tchx84.Flatseal|io.github.flattool.Warehouse)$" },
    opacity = "0.80 0.80"
})

-- --- Gaming Tools ---
hl.window_rule({
    name = "gaming-utilities-opacity",
    match = { class = "^(hu.kramo.Cartridges|net.davidotek.pupgui2|yad)$" },
    opacity = "0.80 0.80"
})

-- --- GTK Productivity & Utilities ---
hl.window_rule({
    name = "productivity-tools-opacity-1",
    match = { class = "^(io.github.alainm23.planify|io.gitlab.theevilskeleton.Upscaler)$" },
    opacity = "0.80 0.80"
})

hl.window_rule({
    name = "productivity-tools-opacity-2",
    match = { class = "^(com.github.unrud.VideoDownloader|io.gitlab.adhami3310.Impression)$" },
    opacity = "0.80 0.80"
})

-- --- File Operations (Dolphin & Ark) ---
hl.window_rule({
    name = "dolphin-dialogs-float",
    match = {
        class = "^(org.kde.dolphin)$",
        title = "^(Progress Dialog — Dolphin|Copying — Dolphin)$"
    },
    float = false
})

hl.window_rule({
    name = "ark-float",
    match = { class = "^(org.kde.ark)$" },
    float = true
})

-- --- Browsers (Firefox Popups) ---
hl.window_rule({
    name = "firefox-popups-float",
    match = {
        class = "^(firefox)$",
        title = "^(About Mozilla Firefox|Picture-in-Picture|Library)$"
    },
    float = true
})

-- --- Terminal System Monitors ---
hl.window_rule({
    name = "kitty-monitors-float",
    match = {
        class = "^(kitty)$",
        title = "^(top|btop|htop)$"
    },
    float = true
})

-- --- System & Settings Tools ---
hl.window_rule({
    name = "system-tools-float",
    match = { class = "^(kvantummanager|qt5ct|qt6ct|nwg-look)$" },
    float = true
})

-- --- Network & Audio Controls ---
hl.window_rule({
    name = "communication-controls-float",
    match = { class = "^(org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor)$" },
    float = true
})

-- --- Authentication ---
hl.window_rule({
    name = "auth-agent-float",
    match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
    float = true
})

-- --- Media & Graphics ---
hl.window_rule({
    name = "image-viewer-float",
    match = { class = "^(eog)$" },
    float = true
})

hl.window_rule({
    name = "video-tools-float",
    match = { class = "^(com.github.rafostar.Clapper|com.github.unrud.VideoDownloader)$" },
    float = true
})

-- --- Social & Productivity ---
hl.window_rule({
    name = "signal-float",
    match = { class = "^(Signal)$" },
    float = true
})

hl.window_rule({
    name = "productivity-tools-float",
    match = { class = "^(io.github.alainm23.planify|io.gitlab.theevilskeleton.Upscaler)$" },
    float = true
})

-- --- System Utilities ---
hl.window_rule({
    name = "system-monitors-float",
    match = { class = "^(io.missioncenter.MissionCenter)$" },
    float = true
})

hl.window_rule({
    name = "system-installers-float",
    match = { class = "^(app.drey.Warp|io.gitlab.adhami3310.Impression)$" },
    float = true
})

hl.window_rule({
    name = "gaming-helper-float",
    match = { class = "^(net.davidotek.pupgui2|yad)$" },
    float = true
})

-- --- Common Modals & System Dialogs (Open/Save/Portals) ---
hl.window_rule({
    name = "system-dialogs-float",
    match = {
        title = "^(Open|Open Folder|Choose Files|Save As|Confirm to replace files|File Operation Progress)$",
        class = "^(xdg-desktop-portal-gtk)$"
    },
    float = false,
    center = false
})

-- Rofi Launcher
hl.layer_rule({
    name = "rofi-effects",
    match = { namespace = "^(rofi)$" },
    blur = true
})

-- Notifications (Standard & SwayNC)
hl.layer_rule({
    name = "notifications-effects",
    match = { namespace = "^(notifications|swaync-notification-window)$" },
    blur = false
})

-- SwayNC Control Center
hl.layer_rule({
    name = "swaync-ui-effects",
    match = { namespace = "^(swaync-control-center)$" },
    blur = true
})

-- Logout Dialog
hl.layer_rule({
    name = "logout-dialog-effects",
    match = { namespace = "^(logout_dialog)$" },
    blur = true
})

-- SwayNC Control Center
hl.layer_rule({
    name = "no_anim_for_hyprpicker",
    match = { namespace = "hyprpicker" },
    no_anim = true
})

-- Logout Dialog
hl.layer_rule({
    name = "no_anim_for_selection",
    match = { namespace = "selection" },
    no_anim = true
})
