GUI_Main_TlbTop_Handler( Hwnd, Event, Txt, Pos, Id )
{
  global hMainGuiToolbar
  static staticID, staticPos
  static cmd
  if Event not in click,menu
    return 0
  staticID := id,staticPos := Pos
  cmd := id = 1 ? "addItem"
                : id = 6 ? "del"
                : id = 8 ? "hints"
                : Exception( "What the shit passed> " id "" )
  SetTimer, lbl_TlbTop, -1
  return 1
  
  ;using another thread to avoid messages processing troubles
  lbl_TlbTop:
    Gui,1:Default
    ret := cmd = "del"            ? GUI_Main_TV_Del()
        : cmd = "addItem"   ? GUI_Main_TV_Add()
        : cmd = "hints" ? GUI_Main_TlbTop_ShowHints() : ""
    cmd =
    return
}

GUI_Main_TlbTop_ShowHints()
{
    Gui,1:+OwnDialogs
  TV_hints = 
  (LTrim
  - Double Click items to set it as current stash. Make sure your in-game stash window is closed
  - You can Drag&Drop items in the list
  - Press F2 to rename
  - Right Click to show additional options where you can also assign a hotkey to any stash
  )
  Msgbox, 64, Hints, % TV_hints
  return
}

Gui_Main_TlbProp_Handler(Hwnd, Event, Txt, Pos, Id)
{
  static staticID,staticPos
  if Event not in menu,click
    return 0
  staticID := id,staticPos := Pos
  if (id = 3)
    SetTimer,Gui_Main_TVItem_ChangeHotkey,-1
  else if (id = 1)
    Gui_Main_TlbProp_ChangeIcon( pos )
  else if (id = 4)
    Gui_Main_TVItem_ChangeColorMenu( "t", Pos )
  else if (id = 5)
    Gui_Main_TVItem_ChangeColorMenu( "bg", Pos )
  else if (id = 7)
    Gui_Main_TVItem_SortMenu( Pos )
  else if (id = 6)
    Gui_Main_TVItem_SetMenuRandColors()
  return 1
}

ShowMenu(menu_name,x="",y="")
{
  CoordMode,Menu,Relative
  Menu,% menu_name, Show,% x,% y
  return
}

Gui_Main_TlbProp_Update( isMenu, isSep, isItem )
{
  static s_set
  new_set := isMenu isSep isItem
  if ( s_set = new_set )
    return
  s_set := new_set
  TB_Enable( qcGui[ "main_tlbprop" ],"1|2|3|4|5|6|7|8|9|10|11|12",1)
  if isItem
    TB_Enable( qcGui[ "main_tlbprop" ],"6|7|8|9",0)
  else if isSep
    TB_Enable( qcGui[ "main_tlbprop" ],"1|2|3|4|5|6|7|8|9|10|11|12",0)
  else if ( isMenu = 2 )	;means it is main menu, and itemID = 0
    TB_Enable( qcGui[ "main_tlbprop" ],"1|2|3|10|11|12",0)
  else if ( isMenu = 1 )
    {}
  return
}

Gui_Main_TlbProp_SetIcon( itemID )
{
  hi := TV_IL.Get( TV_GetIconIndex( qcGui[ "main_tv" ], itemID ) )
  if ( itemID && hi )
    IL_AddIcon( qcGui[ "main_tlbprop_IL" ], hi, 0)
  else
    IL_AddIcon( qcGui[ "main_tlbprop_IL" ], glb[ "hIcoNone" ], 0, 0 )
}

Gui_Main_TlbProp_SetHotkey( itemID )
{
  if ( itemID && ( ItemHotkey := GetCustomHotkey( itemID ) ) )
  {
    Toolbar_SetButtonText(  qcGui[ "main_tlbprop" ], 3, HotkeyToString( ItemHotkey ) )
    qcTVHKItems[ itemID ] := 1
  }
  else
  {
    Toolbar_SetButtonText( qcGui[ "main_tlbprop" ], 3, "None")
    qcTVHKItems.Delete( itemID )
  }
}

Gui_Main_TlbProp_SetItemName( name )
{
  GuiControlSet( "props_item_label", name, "", qcGui[ "main_props" ] )
  return
}

Gui_Main_UpdControls( itemID )
{
  Gui,1:Default
  if ( qcTVItems[ itemID ] = "" ) ;check that item in the array, in rare cases it may not be there, idk why :(
    return False
  TV_GetText( CurItemName, itemID )
  if !itemID
    CurItemName := "Main Menu"
  isMenu := TV_GetChild( itemID ) || itemID = 0 ? ( ItemID ? 1 : 2 ) : 0
  isSep := 0
  isItem := !( isMenu || isSep )

  Gui_Main_TlbProp_Update( isMenu, isSep, isItem )
  Gui_Main_TlbProp_SetIcon( itemID )
  Gui_Main_TlbProp_SetHotkey( itemID )
  Gui_Main_TlbProp_SetItemName( CurItemName " (id:" qcTVItems[ itemID ] ")" )
  
  Toolbar_AutoSize( qcGui[ "main_tlbprop" ], 2 )
  return True
}