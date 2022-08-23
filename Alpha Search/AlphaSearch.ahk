#Persistent
#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
FileEncoding,UTF-8

#Include as_common.ahk
#Include as_search.ahk
#Include as_opening.ahk
#Include as_gui.ahk
#Include as_gui_common.ahk

CFG_Path := "as.cfg"
def_pattern := "*.ahk"
def_width := 400

Gui_Main()
return

JExit:
	SaveCFG()
	ExitApp
	return
	
DTP:
	tooltip
	return