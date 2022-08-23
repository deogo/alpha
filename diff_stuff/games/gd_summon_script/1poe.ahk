#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;~ #NoTrayIcon
#Persistent
#Include %A_ScriptDir%\lib
#Include lib.ahk
#Include FileMappingAPI.ahk
#Include POEMap.ahk

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Hotkey,Numpad1,automate
Hotkey,Numpad7,reload_script
return

automate:
  poemap := ""
  hp_used := 0
  guard_used := 0
  loop {
    if (!IsObject(poemap) || !poemap.is_alive()) {
      poemap := new CPOEMap()
    }
    hp := poemap.get_hp()
    ;~ tooltip % hp.cur . " : " . hp.max . " : "  hp.perc
    if (hp.perc < 80 && (time_diff( guard_used ) > 1000))
    {
      send_key_now("T",50)
      guard_used := A_TickCount
    }
    if (hp.perc < 60 && (time_diff( hp_used ) > 2000) )
    {
      send_key_now("5",50)
      send_key_now("4",50)
      hp_used := A_TickCount
    }
    sleep 50
  }
  return
  
reload_script:
Critical
Reload
exit_script:
ExitApp
return