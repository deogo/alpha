CheckMenuNode( xmlNode )
{
  if ( xmlNode = "main" )
    xmlNode := qcconf.GetMenuNode()
  if !qcconf.IsMenu( xmlNode )
    ShowExc( "Node is not a menu" )
  return xmlNode
}

ExitQC(wParam, lParam, msg, hwnd)
{
  ExitApp
  return
}

QCLoadLibs()
{
  DllCall( "LoadLibraryW", "Wstr", "msi.dll", "UPtr" )
  DllCall( "LoadLibraryW", "Wstr", "Shlwapi.dll", "UPtr" )
  DllCall( "LoadLibraryW", "Wstr", "msvcrt.dll", "UPtr" )
  DllCall( "LoadLibraryW", "Wstr", "Gdi32.dll", "UPtr" )
  DllCall( "LoadLibraryW", "Wstr", "Comctl32.dll", "UPtr" )
}

GDSRestart( fNoNotify = True )
{
  if fNoNotify
    glb[ "fExitNoNotify" ] := 1
  Reload
  ExitApp
}

OpenItemLocation( ItemUID )
{
  path := qcconf.GetItemCmdByID( ItemUID )
  if !FileExist( path )
    path := PathRemoveArgs( path )
  if path
  {
    path := "explorer /select," path
    RunCommand( { cmd : path, nolog : True , noctrl : True , noshift : True } )
  }
  return
}

ProcessCustomHotkey( hotk )
{
  for i,hk in HotkeyFromVK( hotk )
    if ( itemID := qcCustomHotkeys[ hk ] )
      if ( item := qcconf.GetNodeByID( itemID ) )
      {
        QC_ChangeStash( itemID, True )
        break
      }
  return
}

RegGetMyDocLoc()
{
  RegRead,data,HKCU,Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders,Personal
  return data
}

GDSCheckGDSaves()
{
  if !qcOpt[ "gen_stash_loc" ]
  {
    qcOpt[ "gen_stash_loc" ] := RegGetMyDocLoc() "\My Games\Grim Dawn\save"
    qcconf.Save()
  }
  if !PathIsDir( qcOpt[ "gen_stash_loc" ] )
  {
    qcOpt[ "gen_stash_loc" ] := PathGetDir( qcOpt[ "gen_stash_loc" ] )
    qcconf.Save()
  }
  if !FileExist( qcOpt[ "gen_stash_loc" ] )
    msgbox,16,Could not find save dir,% "Could not find GD save dir`n" qcOpt[ "gen_stash_loc" ] "`nYou can set location manually from settings"
}