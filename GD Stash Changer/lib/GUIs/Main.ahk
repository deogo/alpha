GDSMainGui( fActivate = True )
{
  global
  static mg_static_var, mg_core_var
  Gui, 1:Default
  If IsWindow( qcGui[ "main" ] )
  {
    if !IsWindowVisible( qcGui[ "main" ] )
      GoSub,ReEnableMainGui
    ShowWindow( qcGui[ "main" ] )
    if fActivate
      while( !WinActive( "ahk_id " qcGui[ "main" ] ) && IsWindowVisible( qcGui[ "main" ] ) )
      {
        ShowWindow( qcGui[ "main" ] )
        WinActivate,% "ahk_id " qcGui[ "main" ] ;the window won't activate sometimes
        sleep 200
      }
    return
  }
  Gui, +OwnDialogs +LabelMainGui
  if qcOpt[ "gen_noTheme" ]
    Gui,-Theme
  Gui, 1:+LastFound
  qcGui[ "main" ] := WinExist() + 0
  QCSetGuiFont( 1 )
  
  ; menus
  Menu, Help, Delete
  Menu, Settings, Delete
  
  Menu, Settings, Add, &Options..., OptionsGui
  Menu, Settings, Add, List Custom &Hotkeys..., CustomHotkey_OpenGui
  Menu, Settings, Add
  Menu, Settings, Add, View..., GUI_TV_Options_Show
  
  Menu, Help, Add, &Feedback, FeedbackSub
  Menu, Help, Add
  Menu, Help, Add, Donate, DonateLNK
  Menu, Help, Add
  Menu, Help, Add, &About, About
  
  Menu, GuiMenuBar, Add, &Settings, :Settings
  Menu, GuiMenuBar, Add, &Help, :Help
  Gui, Menu, GuiMenuBar
  
  ; gui controls
  hMainTbImageList := IL_CreateNew(16, 16, 7, 1 )
  loop,% glb[ "icoMainCnt" ]
  {
    ico := glb[ "iconListPath" ] . glb[ "icoMainInd" ]+(A_Index-1)
    IL_AddIcon(hMainTbImageList,IconExtract( ico,16))
  }
  hMainGuiToolbar := Toolbar_Add( qcGui[ "main" ], "GUI_Main_TlbTop_Handler","LIST FLAT NODIVIDER TOOLTIPS",hMainTbImageList, "x10 y5")
  ;DO NOT change IDs since they are hardly linked with events
  btns = 
  (LTrim
  New Stash,1,,,1
  --
  Delete Selected Item,8,,,6
  --
  Hints,9,,,8
  )
  Toolbar_Insert( hMainGuiToolbar, btns )
  Toolbar_AutoSize( hMainGuiToolbar )
  Gui,Add,Button,hwndhwnd h20 w100 hidden gMAIN_GUI_DONATE_BUT,% "Like " glb["appNameShort"] "?"
  qcGui[ "main_donate_but" ] := hwnd
  ;~ if ( ( !qcOpt["gen_donated"] && QCGetDaysUsing() > 7 ) || !A_IsCompiled )
    ;~ ClShow( qcGui[ "main_donate_but" ] )
    
  Gui,Add,Radio,% "x200 y5 gMAIN_GUI_CHANGE_CORE vmg_core_var Checked" ( qcOpt["main_cur_core"] = "sc" ? 1 : 0 ),sc
  Gui,Add,Radio,% "x245 y5 gMAIN_GUI_CHANGE_CORE Checked" ( qcOpt["main_cur_core"] = "hc" ? 1 : 0 ),hc 
  
  Gui, Add, TreeView, AltSubmit Section x5 y30 w470 h290 -ReadOnly -Buttons gGUI_Main_TV_Event HWNDTV_hwnd -0x2 +0x1 +0x1000 ;+0x200	;+TVS_TRACKSELECT -TVS_HASLINES +TVS_HASBUTTONS
  qcGui[ "main_tv" ] := TV_hwnd
  Gui, +Resize +MinSize300x330 ;+0x02000000
  Gui_Main_TlbProp_ShowGUI( False )
  GuiControl,Focus,% qcGui[ "main_tv" ]
  QCTVSetFont() ;set font settings to tree view
  Gui, Show,% Gui_Main_GetPos(),% glb[ "appName" ]
  SendMessage( qcGui[ "main_tv" ], 0x1100 + 44, 0x0004, 0x0004 )			; TVM_SETEXTENDEDSTYLE to TVS_EX_DOUBLEBUFFER
  QC_BuildTV( 0 )
  return
  
  MAIN_GUI_CHANGE_CORE:
    Gui,Submit,NoHide
    if (mg_core_var = 1)
      qcOpt["main_cur_core"] := "sc"
    else
      qcOpt["main_cur_core"] := "hc"
    qcconf.Save()
    QC_BuildTV( 0 )
    return
  
  MAIN_GUI_DONATE_BUT:
    GUIDonation()
    return
  
  MainGuiSize:
    GUI_Main_Resize(A_GuiWidth,A_GuiHeight)
    return
  
  CustomHotkey_OpenGui:
    CustomHotkeysGui_Show()
    return
  
  ReEnableMainGui:
    Gui, 1:Default
    QC_BuildTV( 0 )
    TV_Modify( TV_GetNext( 0, "Full" ), "Select" )
    GuiControl,Focus,% qcGui[ "main_tv" ]
    return

  GUI_TV_Options_Show:
    GUI_TV_Options()
    return
  
  DonateLNK:
    Run,% glb[ "urlDonate" ],,UseErrorLevel
    return
  
  FeedbackSub:
    SendFeedback( "", 1 )
    return
    
  fakesub:
    return

  ;#################################################	
  OptionsGui:
    OptionsGUI()
    return

  ;#################################################
  MainGuiClose:
    Gui,+OwnDialogs
    Gui_Main_SavePos()
    sleep 10
    qcconf.Save()
    sleep 50
    ExitApp
  return
  ;############################### SET TARGETS
}