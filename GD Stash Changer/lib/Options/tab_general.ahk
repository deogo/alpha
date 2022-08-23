OptAddGenTab()
{
  global var_option1, var_option2, var_option3, var_option4, opt_iconsSize, var_new_stash_choice
  global opt_editorItem, opt_helpSub, opt_suspendSub, opt_trayIcon
  ,opt_ContextQC, opt_RunOnStartup, opt_autoUpd, opt_smenusOn, opt_cmdDelay
  ,opt_IconRelPath, opt_CmdRelPath, opt_mnem_method
  Gui, GUI_OPT_GENERAL:New,+ParentGUI_OPT -Caption +hwndhwnd 
  qcGui[ "opts_hws" ][ "General" ] := hwnd
  Gui, GUI_OPT_GENERAL:Default
  QCSetGuiFont( "GUI_OPT_GENERAL" )
  Gui,Font,Bold
  Gui,Add,GroupBox,% "ym xm w" glb[ "defOptBoxW" ] " h" glb[ "defOptBoxH" ],Settings
  Gui,Font,Normal
  Gui, Add, text,% "Section xp+15 yp+25",GD Stash file location
  Gui, Add, EDIT,% "xs y+5 vvar_option1 r1 cNavy w330 ReadOnly",% qcOpt[ "gen_stash_loc" ]
  Gui,Add,BUTTON,% "x+10 yp w30 h25 gg_option1",...
  
  Gui, Add, Checkbox,% "xs y+15 cNavy vvar_option2 W210 gg_option2 Checked" . qcOpt[ "gen_showChangeWarning" ]
     ,Show warning on stash change
  Gui, Add, Checkbox,% "xp+15 y+7 cNavy vvar_option4 W210 gg_option4 Disabled" !qcOpt[ "gen_showChangeWarning" ] " Checked" . qcOpt[ "gen_showChangeWarning_on_hotkey" ]
     ,When changed by hotkey
  Gui, Add, Checkbox,% "xs y+5 cNavy vvar_option3 W210 gg_option3 Checked" . qcOpt[ "gen_delConfirm" ]
     ,Ask confirmation when deleting the stash
  
  Gui, Add, text,% "Section xs yp+35 cNavy",New Stash
  Gui, Add, Radio,% "vvar_new_stash_choice cNavy gg_new_stash Checked" (qcOpt[ "gen_new_stash_type" ] = 1 ? 1 : 0)
      ,Locked
  Gui, Add, Radio,% "cNavy gg_new_stash Checked" (qcOpt[ "gen_new_stash_type" ] = 2 ? 1 : 0)
      ,5-tabs unlocked (Ashes)
  Gui, Add, Radio,% "cNavy gg_new_stash Checked" (qcOpt[ "gen_new_stash_type" ] = 3 ? 1 : 0)
      ,6-tabs unlocked (ForgottenGods only)
  
  Gui,GUI_OPT_GENERAL:Show,% glb[ "defOptBoxPos" ] " Hide"
  return
  
  g_option1:
    FileSelectFile, target,3,% qcOpt[ "gen_stash_loc" ], Select transfer.gst, GD STash ( *.gst )
		if FileExist( target )
    {
      qcOpt[ "gen_stash_loc" ] := PathGetDir( target )
      GuiControlSet( "var_option1", qcOpt[ "gen_stash_loc" ], "", "GUI_OPT_GENERAL" )
    }
    return
    
  g_option2:
    val := GuiControlGet( "var_option2", "GUI_OPT_GENERAL" )
    qcOpt[ "gen_showChangeWarning" ] := val
    GuiControlSet("var_option4","When changed by hotkey",val?"Enable":"Disable","GUI_OPT_GENERAL")    
    return
    
  g_option3:
    qcOpt[ "gen_delConfirm" ] := GuiControlGet( "var_option3", "GUI_OPT_GENERAL" )
    return
    
  g_option4:
    qcOpt[ "gen_showChangeWarning_on_hotkey" ] := GuiControlGet( "var_option4", "GUI_OPT_GENERAL" )
    return
    
  g_new_stash:
    Gui,Submit,NoHide
    qcOpt[ "gen_new_stash_type" ] := var_new_stash_choice
    return
}