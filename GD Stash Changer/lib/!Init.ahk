IfNotExist,% glb[ "qcDataPath" ]
  FileCreateDir,% glb[ "qcDataPath" ]
;----------------------------------------------------------
;Super-global variables/constants/objects
glb[ "hIcoNone" ] := IconExtract( glb[ "icoNone" ], 24 )
global qcconf
global oGuiTooltip  := new GuiTooltip()
global qcOpt          := new QC_Options()
global qcPUM        := new PUM()
global qcCustomHotkeys := object()
global qcGui := object() ;stored gui handles
global qcTVItems := object() ;maps TV items IDs to QC items IDs, like { TVItem_ID : QCItem_ID }
global qcNAItems := object()
global qcTVHKItems := object() ;contains TV items with defined hotkey
;TreeView Icon List
global TV_IL    ;main gui TreeView ImageList
global TV_CL    ;main gui TreeView color list
global qcHotkeyList := object() ;list of all currently active hotkeys

GDS_Init()
{
  QCLoadLibs()
  qcconf := new XMLManager()
  Menu, tray, UseErrorLevel
  Menu, tray, Tip,% "Hello there"
  Menu, Tray, Click, 1
  Menu, Tray, Icon,,,1				;disabling changing to "S" icon
  Menu, Tray,% qcOpt[ "gen_trayIcon" ] ? "Icon" : "NoIcon"
  if !A_IsCompiled		;if not compiled instance runned, - add debug hotkeys
  {
    Hotkey("!r",1,"Restart","","",True)
  }                             ;checking SMenu registry settings
  
  gdsver := glb[ "ver" ]
  return
}