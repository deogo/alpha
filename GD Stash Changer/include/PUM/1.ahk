#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include PUM_API.ahk
#Include PUM.ahk
 
PUMobj:=new PUM()
f:=PUMobj.CreateMenu()
FileRead,a,% A_AhkPath

loop 50000
{
  s:=f.add({name:"a",Ahk:a,date:A_Now})
  s.Destroy()
}
f.add({name:2})
f.Show()
MsgBox
PUMobj:=f:=s:=""
exitapp