#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

while 1
{
  for _,k in [1,2,3,4,5,6,7,8,9,0]
  {
    Process, Exist,Grim Dawn.exe
    if !ErrorLevel
      break
    WinActivate,% "ahk_exe Grim Dawn.exe"
    if !WinActive("ahk_exe Grim Dawn.exe")
    {
      sleep 500
      continue
    } 
    ;~ ControlSend,,% k,grim dawn.exe
    SendInput % k
    sleep 100
  }
}
return