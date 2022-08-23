SearchBarHotkeys( state )
{
  if ( err := Hotkey( qcOpt[ "search_hotkey" ], state, "SearchBarFromHotkey" ) )
    QMsgBoxP( { title : "SearchBar hotkey error", msg : err, pic : "x" } )
  return
}

SearchBarGUI()
{
  Global SearchBar_EditCtrl, hSearchBarGui ;GUI controls must be global
         ,SearchBar_Style
         
  static last_gui_width := 0, do_resize := 1
  
  gui, 13:Default
	If !IsWindow(qcGui[ "search_bar" ])
	{
    Gui,+Lastfound +Resize +MinSize150x37
    QCSetGuiFont( 13 )
    Gui, +ToolWindow +LastFound +hwndhwndsb +0x400000 +AlwaysOnTop
    qcGui[ "search_bar" ] := hwndsb
    if qcOpt[ "gen_noTheme" ]
      Gui,-Theme
    Gui,Font,Bold
    Gui,Add,Edit,cBlack R1 x5 y5 w150 vSearchBar_EditCtrl gg_SearchBar_EditCtrl +0x800000
    Gui,Font,Normal  
  }
  MouseGetPos,X,Y
  GuiControlSet( "SearchBar_EditCtrl", "", "", 13)
  Gui, show,% "x" . X . " y" . Y . "AutoSize",% glb[ "searchBarTitle" ]
  WinActivate,% "ahk_id " qcGui[ "search_bar" ]
  GuiControl,Focus,SearchBar_EditCtrl
  return
    
  13GuiClose:
  13GuiEscape:
  SearchBarGUIHide:
    Gui,13:Default
    HideWindow( qcGui[ "search_bar" ] )
    return
    
  13GuiSize:
    Gui,13:Default
    if !do_resize
      return
    ed_pos := ControlGetPos( "SearchBar_EditCtrl", 13 )
    change := A_GuiWidth-last_gui_width
    if last_gui_width {
      ControlMove("SearchBar_EditCtrl","w" ed_pos.w+change, 13)
      SetTimer,SearchBar_AutoSize,-200
    }
    last_gui_width := A_GuiWidth
    return
    
  SearchBar_AutoSize:
    do_resize := 0
    Gui, 13:Show, AutoSize
    do_resize := 1
    return
    
  g_SearchBar_EditCtrl:
    SetTimer,SearchBar_BuildMenu,-250
    return

  SearchBar_BuildMenu:
    if !SearchBarBuildMenu(GuiControlGet( "SearchBar_EditCtrl", 13 ))
      return
    sb_pos := WinGetPos( qcGui[ "search_bar" ] )
    qcSearchMenu.objPUM.onchar := "GuiSearchOnChar"
    item := qcSearchMenu.ShowOverride( sb_pos.x+sb_pos.w, sb_pos.y, qcGui[ "search_bar" ] )
    qcSearchMenu.objPUM.onchar := ""
    if item
      GoTo,SearchBarGUIHide
    return
}

GuiSearchOnChar(t,oMenu,code){
  qcSearchMenu.EndMenu()
  Gui,13:Default
  GuiControl,Focus,SearchBar_EditCtrl
  GuiControlGet, hc, Hwnd, SearchBar_EditCtrl
  ControlSend,,% chr(code),% "ahk_id " hc
}

SearchBarBuildMenu(search_string)
{
  if qcPUM.IsMenuShown
    qcSearchMenu.EndMenu()

  nodes := Array()
  tokens := StrSplit(Trim(search_string)," "," `n`t")
  if !tokens.Length()
    return 0
  SearchBarGetNodes( "main", tokens, nodes )
  ;~ msgbox % "nodes " nodes.Length()
  
  menuTColor := NodeGetColor( "mtcolor", qcconf.GetMenuNode() )
  menuBGColor := NodeGetColor( "mbgcolor", qcconf.GetMenuNode() )
  menuParams := { iconssize : toInt( qcOpt[ "aprns_iconsSize" ] )
                ,tcolor    : menuTColor
                ,bgcolor   : menuBGColor
                ,textoffset : glb[ "menuIconsOffset" ]
                ,noicons   : qcOpt[ "aprns_lightMenu" ]
                ,nocolors  : qcOpt[ "aprns_lightMenu" ]
                ,notext    : 0
                ,ymargin   : 3 + toInt( qcOpt[ "aprns_heightAdjust" ] ) }
  qcSearchMenu.Destroy()
  objMenu := qcPUM.CreateMenu( menuParams )
  if !objMenu.handle
    ShowExc( "Unable create a new menu" )
  
  for i, xmlItemNode in nodes {
    if qcconf.IsMenu( xmlItemNode )
      ShowExc( "Should not be menu here" )

    ItemID := xmlItemNode.getAttribute( "ID" )
    ItemIcon := xmlItemNode.getAttribute( "icon" )
    ItemHotkey := xmlItemNode.getAttribute( "hotkey" )
    ItemName := xmlItemNode.getAttribute( "name" )
    ItemIsBold := xmlItemNode.getAttribute( "bold" )
    ItemTColor := xmlItemNode.getAttribute( "tcolor" )
    ItemBGColor := xmlItemNode.getAttribute( "bgcolor" )
    ItemSubmenu := 0
    
    ;check for FolderMenu
    if ( substr(ItemName,0) = "*" && !ItemSubmenu )
    {
      icoSize := qcOpt[ "fm_iconssize" ] = "global" ? qcOpt[ "aprns_iconsSize" ] 
                                          : qcOpt[ "fm_iconssize" ]
      ItemSubmenu := qcPUM.CreateMenu( { iconssize : toInt( icoSize )
                                ,textoffset : glb[ "menuIconsOffset" ]
                                ,tcolor : menuTColor
                                ,bgcolor : menuBGColor
                                ,noicons   : !qcOpt[ "fm_showicons" ]
                                ,nocolors  : qcOpt[ "aprns_lightMenu" ]
                                ,notext    : 0
                                ,FolderMenu : qcconf.GetItemCmdByID( ItemID )
                                ,FM_Root : True
                                ,ymargin   : 3 + toInt( qcOpt[ "aprns_heightAdjust" ] )} )
    }
    
    ItemParams := { name  : ItemName
                  ,issep : ItemIsSep
                  ,icon  : ItemIcon
                  ,uid   : ItemID
                  ,bold  : ItemIsBold
                  ,submenu : ItemSubmenu
                  ,tcolor : ItemTColor
                  ,bgcolor : ItemBGColor
                  ,break : 0 }
    
    objMenu.Add( ItemParams )
  }
  
  qcSearchMenu := objMenu
  return 1
}

SearchBarGetNodes( xmlMenuNode, search_tokens, arr_nodes ) {
  xmlMenuNode := CheckMenuNode( xmlMenuNode )
  Loop
  {
    xmlItemNode := ( A_Index = 1 ) ? xmlMenuNode.firstChild : xmlItemNode.nextSibling
    if !xmlItemNode
      break
    if ( xmlItemNode.nodeName != "item" )	;it may be a 'command' sometimes
      continue
    if (xmlItemNode.getAttribute( "issep" ))
      continue
    if qcconf.IsMenu( xmlItemNode ) {
      SearchBarGetNodes( xmlItemNode, search_tokens, arr_nodes )
      continue
    }
    ItemName := xmlItemNode.getAttribute( "name" )
    cmds := qcconf.GetItemCmdArray( xmlItemNode )
    all_found := True
    for i,token in search_tokens {
      f_found := False
      if InStr(ItemName, token)
        f_found := True
      
      for j,cmd in cmds
        if InStr(cmd, token)
          f_found := True
        
      all_found &= f_found
    }
    if all_found {
      arr_nodes.Push( xmlItemNode )
    }
  }
}