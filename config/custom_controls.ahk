#Requires AutoHotkey v2.0
#SingleInstance

; Requires Nir Sofer's ControlMyMonitor:
; https://www.nirsoft.net/utils/control_my_monitor.html
; Either add it to PATH or edit the CMM_PATH variable.
CMM_PATH := 'ControlMyMonitor.exe'

; Monitor-specific constants, must get from ControlMyMonitor
EXT_DISPLAY_CODE := '"LEN66ED"'
VCP_DCR          := 'EA'
VCP_BRIGHTNESS   := '10'

; User configs
BRIGHTNESS_MOD_BASE      := 5
BRIGHTNESS_MOD_INCREMENT := 5
POINTER_SPEED            := 60

; Hotkeys (for ease of configuration)
SUPR := "+^!"
DISPLAY_OFF                := SUPR . "q"
EXT_DISPLAY_BRIGHTNESS_UP  := SUPR . "u"
EXT_DISPLAY_BRIGHTNESS_DN  := SUPR . "z"
TOGGLE_DISPLAY_MODE        := SUPR . "y"
TOGGLE_DCR                 := SUPR . "i"
TOGGLE_THEME               := SUPR . "p"


moveMouse(dir) {
	sp := POINTER_SPEED
	if GetKeyState("RShift") {
		sp *= 3
	} else if GetKeyState("RCtrl") {
		sp /= 3
	}
	
	h := v := 0
	switch dir {
		case "l": h := -sp
		case "d": v :=  sp
		case "u": v := -sp
		case "r": h :=  sp
	}
	
	MouseMove(h, v, 0, "R")
}

+^!#t::moveMouse("l")
+^!#r::moveMouse("d")
+^!#s::moveMouse("u")
+^!#n::moveMouse("r")

+^!#m::WheelDown
+^!#l::WheelUp


ControlMyMonitor(command, vcp, value:='') {
	return Run(CMM_PATH . ' /' . command . ' ' . EXT_DISPLAY_CODE . ' ' . vcp . ' ' . value)
}

; start with DCR off
ControlMyMonitor('SetValue', VCP_DCR, dcr_on := 0)


brightness_mod      := BRIGHTNESS_MOD_BASE
last_brightness_hk  := ''

ExternalBrightness(hk) {
	global brightness_mod, last_brightness_hk, dcr_on
	
	ResetBrightnessMod() {
		SetTimer(ResetBrightnessMod, 0)
		brightness_mod := BRIGHTNESS_MOD_BASE
		last_brightness_hk := ''
	}
	
	if (dcr_on) {
		ControlMyMonitor('SetValue', VCP_DCR, dcr_on := 0)
		return
	} 
	
	if (hk != last_brightness_hk) {
		ResetBrightnessMod()
		last_brightness_hk := hk
	} else {
		brightness_mod += BRIGHTNESS_MOD_INCREMENT		
		SetTimer ResetBrightnessMod, 50
	}
	
	ControlMyMonitor('ChangeValue', VCP_BRIGHTNESS, brightness_mod * (hk=EXT_DISPLAY_BRIGHTNESS_UP ? 1 : -1))
}

DcrOn(hk) {
	global dcr_on
	ControlMyMonitor('SetValue', VCP_DCR, dcr_on := 1)
	dcr_on := 1
}
																												   
ToggleTheme(hk) {
	current_theme := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")
	RegWrite(!current_theme, "REG_DWORD", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "SystemUsesLightTheme")
	RegWrite(!current_theme, "REG_DWORD", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize", "AppsUseLightTheme")
}

ToggleDisplayMode(hk) {
	internal_display_on := RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\UnitedVideo\CONTROL\VIDEO\{B73DB8E2-F2C1-11EA-8B0E-806E6F6E6963}\0001", "Attach.ToDesktop")
	Run('DisplaySwitch.exe ' . (internal_display_on ? '/external' : '/extend'))
}

DisplayOff(hk) {
	sleep 600
	SendMessage(0x0112, 0xF170, 2,, "Program Manager")
}

GetDeepLTranslation() {
	Send "+{Tab}"
	Send "^a"
	Send "^{c 2}"
	sleep 1000
	Click 800, 300
	Send "^a"
	Send "^c"
	Send "!{Tab}"
	sleep 150
	Send "{Tab}"
	Send "^v"
	}

#f::GetDeepLTranslation()

Hotkey DISPLAY_OFF               , DisplayOff
Hotkey EXT_DISPLAY_BRIGHTNESS_UP , ExternalBrightness
Hotkey EXT_DISPLAY_BRIGHTNESS_DN , ExternalBrightness
Hotkey TOGGLE_DCR                , DcrOn
Hotkey TOGGLE_DISPLAY_MODE       , ToggleDisplayMode
Hotkey TOGGLE_THEME              , ToggleTheme