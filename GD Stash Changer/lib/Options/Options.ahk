OptionsGUI()
{
  global
  Gui GUI_OPT:+LastFoundExist
  IfWinExist
  {
    if !ClIsVisible( WinExist() )
      Gui, GUI_OPT:Show
    WinActivate
    return
  }
  Gui, GUI_OPT:New, +hwndhwnd +OwnDialogs +owner1,% glb[ "AppName"] " Settings"
  Gui, GUI_OPT:Default
  QCSetGuiFont( "GUI_OPT" )
  Gui, Margin, 10, 10
  Gui, 1:+Disabled
  qcGui[ "opts" ] := hwnd
  if qcOpt[ "gen_noTheme" ]
    Gui,-Theme
  qcGui[ "opts_hws" ] := object() ;here we hold handles to the options windows ( hwnds )
  Gui, add, button,% "xm W" glb[ "defButW" ] " H" glb[ "defButH" ] " y" glb[ "defOptBoxH" ]+15 " gOpt_AcceptSettingsBtn", OK
  OptAddGenTab()
  Gui,GUI_OPT:Default
  Gui 1:+LastFoundExist
  WinGetPos, X, Y, W, H,% "AHK_ID " WinExist()
  WinShow( qcGui[ "opts_hws" ][ "General" ] )
  Gui,Show,% "x" . round( x + w/2 - 320 ) 
          . " y" . round( y + h/10 ) 
          . " w" ( glb[ "defOptBoxW" ] + 30 )
          . " h" ( glb[ "defOptBoxH" ] + glb[ "defButH" ] + 25 )
  return  
  
  Opt_AcceptSettingsBtn:
    qcconf.Save()
    if( A_ThisLabel = "Opt_AcceptSettingsBtn" )
      GoSub,CloseOptionsGui
    return

  ;###############################
  CloseOptionsGui:
  GUI_OPTGuiClose:
  GUI_OPTGuiEscape:
    Gui, 1:-Disabled
    Gui, GUI_OPT:Destroy
    Gui, 3:Destroy
    Gui 1:Default
    WinActivate,% "ahk_id " qcGui[ "main" ]
    return
}

