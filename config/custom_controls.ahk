#Requires AutoHotkey v2.0
#SingleInstance
InstallKeybdHook

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

; Hotkeys (for ease of configuration)
SUPR := "*+^!"
HYPR := "*#+^!"
DISPLAY_OFF                := SUPR . "q"
EXT_DISPLAY_BRIGHTNESS_UP  := SUPR . "u"
EXT_DISPLAY_BRIGHTNESS_DN  := SUPR . "z"
TOGGLE_DISPLAY_MODE        := SUPR . "y"
TOGGLE_DCR                 := SUPR . "i"
SURROUND_PASTE             := HYPR . "c"
SURROUND_SELECTION         := HYPR . "h"


; ---------------------
; MONITOR
; ---------------------

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

DisplayOff(hk) {
	sleep 600
	SendMessage(0x0112, 0xF170, 2,, "Program Manager")
}

ToggleDisplayMode(hk) {
	internal_display_on := RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\UnitedVideo\CONTROL\VIDEO\{B73DB8E2-F2C1-11EA-8B0E-806E6F6E6963}\0001", "Attach.ToDesktop")
	Run('DisplaySwitch.exe ' . (internal_display_on ? '/external' : '/extend'))
}

; ---------------------
; ETC
; ---------------------

KeyWaitAny() {
    ih := InputHook("L1 T2")
    ih.KeyOpt("{All}", "")
    ih.Start()
    ih.Wait()
    return ih.Input
}

GetPair(k) {
	pairs := Map("{", "}", "[", "]", "(", ")", "<", ">")
	return pairs.Has(k) ? pairs[k] : k
}

PasteSurround(hk) {
	got_key := KeyWaitAny()
	if (got_key = "") {
        return
    }	
	SendText got_key . A_Clipboard . GetPair(got_key)
}

SurroundSelected(hk) {
	ClipSaved := ClipboardAll()
	
	got_key := KeyWaitAny()
	if (got_key = "") {
        return
    }	
	Send "^x"
	SendText got_key . A_Clipboard . GetPair(got_key)
	
	A_Clipboard := ClipSaved
}
	

; ---------------------
; HOTKEYS
; ---------------------
 
Hotkey DISPLAY_OFF               , DisplayOff
Hotkey EXT_DISPLAY_BRIGHTNESS_UP , ExternalBrightness
Hotkey EXT_DISPLAY_BRIGHTNESS_DN , ExternalBrightness
Hotkey TOGGLE_DCR                , DcrOn
Hotkey TOGGLE_DISPLAY_MODE       , ToggleDisplayMode
Hotkey SURROUND_PASTE            , PasteSurround
Hotkey SURROUND_SELECTION        , SurroundSelected