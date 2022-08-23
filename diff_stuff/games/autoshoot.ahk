#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
while true
{
  if ( GetKeyState( "LButton", "P" ) || GetKeyState( "RButton", "P" ))
  {
    Send % "{XButton1 down}"
    sleep 50
    Send % "{XButton1 up}"
  }
  else
    sleep 100
}
return

!z::
Reload