Gui_Main_TlbProp_ChangeIcon( tbButtonPos )
{
  Gui, 1:Default
  Gui, +Disabled
  Gui, 12:+LastFoundExist
  WinGet, hWnd, ID
  WinGetPos, X, Y,,,% "ahk_id " qcGui[ "main_tlbprop" ]
  p := StrSplit( Toolbar_GetRect( qcGui[ "main_tlbprop" ], tbButtonPos ), A_Space )
  x := x+p[1], y := y+p[4]
  ItemID := TV_GetSelection()
  CurIco := Gui_Main_TVItem_GetIcon( itemID )
  NewIco := Gui_Main_IconsMenu( hWnd, CurIco, x, y )

  if ( NewIco = "-1" )
  {
    Gui_Main_TVItem_SetIcon( ItemID,"" )
    TV_Modify(ItemID,"Select Vis Icon" . glb[ "BlankIcoNum" ])
  }
  else if NewIco
  {
    if ( ItemIcon := TV_IL.Add( NewIco ) )
    {
      TV_Modify(ItemID,"Select Vis Icon" . ItemIcon)
      Gui_Main_TVItem_SetIcon( ItemID, NewIco )
    }
  }
  Gui_Main_TlbProp_SetIcon( itemID )
  Gui, -Disabled
  return
}

GUI_Main_TV_Add( optName = "" )
{
  Gui,1:Default
  lastID := 0
  while (n:=TV_GetNext(lastID, "Full"))
    lastID := n
  itemName := optName ? optName : "New Stash"
  itemNode := QC_AddXMLItem( { name : itemName
                            , menuID : 0
                            , afterID : qcTVItems[ lastID ] } )
  itemUID := itemNode.getAttribute( "ID" )
  if ( qcOpt["main_cur_core"] = "hc" )
    itemNode.setAttribute( "type" ) := "hc"
  else
    itemNode.setAttribute( "type" ) := "sc"
  if !QC_AddStash( itemUID )
  {
    qcconf.ItemDel( itemUID )
    return
  }
  tvid := QC_TVAdd( itemName, PID,  lastID " Select Vis Icon" . glb[ "BlankIcoNum" ], itemUID )
  GuiControl,Focus,% qcGUI[ "main_tv" ]
  if !optName
    SendMessage( qcGui[ "main_tv" ], TVM_EDITLABELW := 0x1100 + 65, 0, tvid )
  qcconf.Save()
  return tvid
}

QC_AddStash( UID )
{
  if ( qcOpt["main_cur_core"] = "hc" )
    stashPath := glb[ "gdsStashPath" ] "\" UID "\transfer.gsh"
  else
    stashPath := glb[ "gdsStashPath" ] "\" UID "\transfer.gst"
  stashDir := glb[ "gdsStashPath" ] "\" UID
  FileCreateDir,% stashDir
  f := FileOpen( stashPath, "w", "CP0" )
  if IsObject( f )
  {
    bufLen := b64Decode( qcOpt[ "gen_new_stash_type" ] = 1 ? glb[ "stash_locked" ]
                        :qcOpt[ "gen_new_stash_type" ] = 2 ? glb[ "stash_unlocked_5" ]
                        : glb[ "stash_unlocked_6" ]
              , outBuf )
    f.RawWrite( outBuf, bufLen )
  }
  f.close()
  if !IsStashExist( UID )
  {
    MsgBox,16,Failed,Could not create new stash
    return 0
  }
  return 1
}

GUI_Main_TV_Del( in_id = "" )
{
  Gui,1:Default
  Gui,+OwnDialogs
  if ( ItemID := in_id ? in_id : TV_GetSelection() )
  {
    if ( !GetKeyState( "SHIFT", "P" ) && qcOpt[ "gen_delConfirm" ] )
    {
      MsgBox,36,Delete Confirmation,Are you sure you want to delete selected stash?
      IfMsgBox,No
        return
    }
    QC_StashDel( qcTVItems[ itemID ] )
    qcconf.ItemDel( qcTVItems[ itemID ] )
    QC_TVDel( ItemID )
    qcconf.Save()
    GuiControl,Focus,% qcGui[ "main_tv" ]
    ;QC_ChangeStash( qcTVItems[ TV_GetNext(0,"Full") ] )
  }
  return
}

QC_StashDel( UID )
{
  FileRemoveDir,% glb[ "gdsStashPath" ] "\" UID, 1
}

GUI_Main_Resize( new_width, new_height )
{
  static s_width, s_height
  ;if windows was minimized/maximized - do nothing
  if ( !new_width || !new_height )
    || ( new_width = s_width && new_height = s_height )
    return
  GuiControl, -Redraw,% qcGui[ "main_tv" ]
  s_width := new_width, s_height := new_height
  Gui,1:Default
  gui_width := s_width - 10
  TV_height := s_height - 40
  GuiControl,Move,% qcGui[ "main_tv" ],% "w" gui_width " h" TV_height
  GuiControl,Move,% qcGui[ "main_donate_but" ],% "x" (gui_width - 100 ) " y5"
  GuiControl,MoveDraw,AfoSB
  ;x,y coords used by ControlMove different from GuiControl,MoveDraw, but the same as given us by ControlGetPos
  ControlGetPos,x,y,w,h,,% "ahk_id " qcGui[ "main_tv" ]
  SetTimer( "GUI_Main_Redraw", 20 )
  return
}

GUI_Main_Redraw( p* )
{
  SetTimer( A_ThisFunc, "OFF" )
  for i,hCtrl in [ qcGui[ "main_ed" ]
                  ,qcGui[ "main_lv" ]
                  ,qcGui[ "main_tg_name" ]
                  ,qcGui[ "main_svBut" ]
                  ,qcGui[ "main_tv" ] ]
  {
    if !ClIsVisible( hCtrl )
      continue
    GuiControl, -Redraw,% hCtrl
    GuiControl, +Redraw,% hCtrl
  }
  return
}

Gui_Main_GetPos()
{
  winPos := qcOpt[ "main_pos" ]
  if !winPos
    return ""
  for i,v in StrSplit( winPos, " ", A_Space A_Tab )
  {
    StringTrimLeft,v,v,1
    if ( v < 0 )
      return ""
  }
  return winPos
}

Gui_Main_SavePos()
{
  if ( winPosClient := WinGetClientPos( qcGui[ "main" ] ) )
    && ( winPos := WinGetPos( qcGui[ "main" ] ) )
    qcOpt[ "main_pos" ] := "x" winPos.x " y" winPos.y
                         . " w" winPosClient.w " h" winPosClient.h
  return
}