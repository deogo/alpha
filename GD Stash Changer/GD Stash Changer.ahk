#SingleInstance OFF
#MaxThreadsPerHotkey 3
#MaxThreads 30
#NoEnv
#Persistent
#NoTrayIcon
#InstallKeybdHook
#InstallMouseHook
#MaxMem 100
;~ #Warn, All, StdOut 
if A_OSVersion in WIN_NT4,WIN_95,WIN_98,WIN_ME,WIN_2000
{
  MsgBox % "This programm requires Windows 2003/XP or later."
  ExitApp
}
;////////////////////////////   StartUp init
global DBG_SHOW_ERRORS := 0
global glb := Object()                     ; this is globals store of constants/states
global sysargs := Object()                 ; object contains all arguments passed to the programm
; getting parameters passed
loop,%0%
  sysargs[ A_Index ] := %A_Index%
sysargs[ 0 ] := sysargs.MaxIndex() ? sysargs.MaxIndex() : 0  ;first element contains whole number of parameters

SendMode Input                                 ; recommended mode for send commands
Thread, Interrupt, 0,0
SetTitleMatchMode,RegEx
SetBatchLines, -1                               ;better performance
SetWorkingDir, %A_ScriptDir%        ; ensures working dir is script dir
OnExit, ExitProcessing                      ; this sub will be called whenever QC exits
Process, priority,,H                        ; high priority for the script to avoid problems running applications under heavy CPU load
FileEncoding, UTF-16                        ; all files by default in UTF-16
ComObjError( 1 )                               ; switch to turn ON/OFF COM elements errors
CoordMode, Mouse, Screen           ; default coordinates for mouse and
CoordMode, Menu, Screen              ; menu commands are relative to screen
#Include %A_ScriptDir%\lib\!Includes.ahk
;//////////////////////////
;initialization
OnMessage( 0x200, "ShowTooltip" )
GDS_Init()
GDSMainGui()
GDSCheckGDSaves()
return

; Debug labels
restart:
GDSRestart( False )
return

;Open/Show main gui
MainGui:
GDSMainGui()
return

;################ ABOUT #########################
ABOUT:
About()
return
;################ EXIT ##########################
ExitProcessing:				;OnExit sub
EXIT:
  If !glb[ "fExitNoNotify" ]
  {
    qcconf.Backup()
    qcconf.Save() ;may cause xml corruption?
  }
  ExitApp
  return
  
MG_ShowProps:
  Gui_Main_TlbProp_ShowGUI()
  return
