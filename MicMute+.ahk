#SingleInstance Force
global MUTE_SOUND := A_WinDir "\Media\Windows Hardware Remove.wav"
global UNMUTE_SOUND := A_WinDir "\Media\Windows Hardware Insert.wav"
global MUTED_ICON_PATH := A_ScriptDir "\icons\isMuted.ico"
global UNMUTED_ICON_PATH := A_ScriptDir "\icons\unMuted.ico"
global CONFIG_FILE := A_ScriptDir "\config.ini"
global MIC_DEVICE := LoadMicDevice()
LoadMicDevice() {
    if FileExist(CONFIG_FILE) {
        if device := IniRead(CONFIG_FILE, "Settings", "MicDevice", "") {
            return device
        }
    }
    device := InputBox(
        "Enter the name of your microphone device.`n"
        "Tip: You can check the exact name in the system sound settings.`n"
        "Example:'有线麦克风'",
        "Setting up the microphone device"
    )
    if device.Result = "Cancel" {
        MsgBox("No microphone device name is set, the default value will be used:'有线麦克风'")
        device.Value := "有线麦克风"
    }
    IniWrite(device.Value, CONFIG_FILE, "Settings", "MicDevice")
    return device.Value ? device.Value : "有线麦克风"
}
InitTray()
UpdateMicStatus()
InitTray() {
    A_TrayMenu.Delete
    A_TrayMenu.Add("get mic status", UpdateMicStatus)
    A_TrayMenu.Add()
    A_TrayMenu.Add("exit", (*) => ExitApp())
    A_TrayMenu.ClickCount := 2
    A_TrayMenu.Add()
    OnMessage(0x404, TrayDoubleClick)
}
TrayDoubleClick(wParam, lParam, *) {
    if lParam = 515 { ; WM_LBUTTONDBLCLK
        ToggleMicMute()
    }
}
ToggleMicMute() {
    try {
        SoundSetMute(-1, , MIC_DEVICE)
        isMuted := SoundGetMute(, MIC_DEVICE)
        SetTrayIcon(isMuted)
        PlaySound(isMuted)
    } catch Error as e {
        MsgBox("toggle mic mute failed: " e.Message)
    }
}
UpdateMicStatus(*) {
    try {
        isMuted := SoundGetMute(, MIC_DEVICE)
        SetTrayIcon(isMuted)
        ShowToolTip(isMuted ? "mic off" : "mic on")
    } catch Error as e {
        MsgBox("update mic status failed: " e.Message)
    }
}
SetTrayIcon(isMuted) {
    if FileExist(isMuted ? MUTED_ICON_PATH : UNMUTED_ICON_PATH) {
        TraySetIcon(isMuted ? MUTED_ICON_PATH : UNMUTED_ICON_PATH)
    } else {
        TraySetIcon("shell32.dll", isMuted ? 234 : 233)
    }
}
PlaySound(isMuted) {
    soundFile := isMuted ? MUTE_SOUND : UNMUTE_SOUND
    defaultSound := isMuted ? "*-1" : "*16"
    SoundPlay(FileExist(soundFile) ? soundFile : defaultSound)
}
ShowToolTip(text) {
    ToolTip(text)
    SetTimer () => ToolTip(), -1000
}
^!m::ToggleMicMute()
