#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinSet, Style, -0xC40000, A
WinMove,A,,0,0,% A_ScreenWidth,% A_ScreenHeight
WinSet,Redraw,,A
return