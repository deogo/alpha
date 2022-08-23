;############################### SET ITEM PROPERTIES
QC_ItemSet( item, params )
{
	static params_list := {	name:0,issep:0,icon:0,bold:0
												,bgcolor:0,tcolor:0,mbgcolor:0,mtcolor:0,hotkey:0}	;list of possible parameters for menu item
	if !isObject( params )
		throw Exception( "Wrong parameter: " params "`n" CallStack() )
	item := qcconf.ItemResolve( item )
	for key, value in params
		if params_list.HasKey( key )
			qcconf.ItemSetAttr( item, key, value, 1 )
	if params.HasKey( "cmd" )
		qcconf.ItemSetCmd( item, params.cmd )
}
;############################### ADD XML ITEM
QC_AddXMLItem( params )
{
	Gui, 1:Default
	if !IsObject( params )
		throw Exception( "Not an object passed`n" CallStack() )
	menuNode := params.menuNode ? params.menuNode
								: params.menuID ? qcconf.GetNodeByID( params.menuID )	;any menu
								: qcconf.GetNodeByID( 0 )	;top menu
	beforeItemNode := params.afterNode ? params.afterNode.nextSibling
										: params.afterID ?  qcconf.GetNodeByID( params.afterID ).nextSibling
										: 0							; will add to the end of menu
										;~ : menuNode.firstChild		;item will be added to the top of the list
	newItemNode := qcconf.CreateItemNode( menuNode, beforeItemNode )
	QC_ItemSet( newItemNode, params )
	return newItemNode
}
;############################### MOVE ITEM
GUI_Main_TV_Move( id, tid, pid = "" )	;tid can be target id, after which moved item will be placed (0 for top), or U or D letter for move
{
	if !id
		return
	Gui,1:Default
	GuiControl,Focus,% qcGUI[ "main_tv" ]
	GuiControl, -Redraw,% qcGui[ "main_tv" ]
	if ( pid = "" )
		pid := TV_GetParent( id )
	if tid in U,D	;in case we move item with arrows
	{
		dir := tid
		tid :=  dir = "U" ? TV_GetPrev( id )
				: dir = "D" ? TV_GetNext( id ) : ""
		if !tid		;means item at the beginning or at the end of menu
			return
		if ( dir = "D" )								;getting item before which moved one should be
			tid := TV_GetNext( tid )
	}
	else if !IsInteger( tid )	;can be integer if passed from DragnDrop
		throw Exception( "invalid tid: " tid "`n" CallStack() )
	; XML CHANGES
	itemNode := qcconf.GetNodeByID( qcTVItems[ id ] )
	itemNode := itemNode.parentNode.removeChild( itemNode )
	parentNode := qcconf.GetNodeByID( qcTVItems[ pid ] )
	if ( tid && ( beforeNode := qcconf.GetNodeByID( qcTVItems[ tid ] ) ) )
		parentNode.insertBefore( itemNode, beforeNode )
	else
		parentNode.appendChild( itemNode )
	; TV CHANGES
	isAutorun := qcTVAutorunItems[ id ]
	hasHotkey := qcTVHKItems[ id ]
	props := QC_TVDelProps( id )
	tid_prev := TV_GetPrev( tid )
	prevID := tid ? ( tid_prev ? tid_prev : "First" ) : 0	;determining item after which moved one will be inserted
	newTVID := QC_TVAdd( props.name, PID, prevID " " props.options, itemNode.getAttribute( "ID" ) )
	qcTVAutorunItems[ newTVID ] := isAutorun
	qcTVHKItems[ newTVID ] := hasHotkey
	if props.hasChilds
		QC_BuildTV( newTVID, itemNode, False )
	sleep 1							; for some reason next line require small sleep to be successful :/
	TV_Modify( newTVID, "Select Vis" )
	if ( TV_GetParent( newTVID ) = PID )
		QC_ArrangeTVColors( PID )
	GuiControl, +Redraw,% qcGui[ "main_tv" ]

	return newTVID
}

TVGetIDbyUID( in_uid )
{
	for tvid,uid in qcTVItems
		if( uid = in_uid )
			return tvid
}

; this functions opens QCEditor and selects target item inside it
QCEditItem( item, fActivate = True )
{
  if IsObject( item )
    item_uid := item.uid
	else
		item_uid := item
  GDSMainGui( fActivate )
  Gui,1:Default
	tvid := TVGetIDbyUID( item_uid )
	if( tvid )
	{
		if fActivate
			WinWaitActive,% "ahk_id " qcGui[ "main" ],,3
		TV_Modify( tvid, "Select Vis" )
		return
	}
  DTP( "Shortcut not found!" )
  return
}

GUI_Main_TV_Event()
{
  static lastItemID
  if glb[ "TVMenuBuildState" ]
    return
  guiEvent := A_GuiEvent
  eventInfo := A_EventInfo
  Gui,1:Default
  if (guiEvent == "D")
    TVDragDrop(eventInfo)
  if (guiEvent == "K")
  {
    GetKeyState, DelH, Del, P
		GetKeyState, F2H, F2, P
    if ( DelH == "D" )
      GUI_Main_TV_Del()
		if ( F2H == "D" )
			SendMessage( qcGui[ "main_tv" ], TVM_EDITLABELW := 0x1100 + 65, 0, eventInfo )
    if ( eventInfo = 93 ) ;context menu call
    {
      if GetKeyState( "SHIFT", "P" )
        eventInfo := 0
      SetTimer, MG_ShowProps, -30
    }
  }
  else if guiEvent in S,RightClick
  {
    if isEmpty( eventInfo )
      return
    if ( guiEvent = "RightClick" )
    {
      if GetKeyState( "SHIFT", "P" )
        eventInfo := 0
      SetTimer, MG_ShowProps, -30
    }
    if ( ( !eventInfo || guiEvent = "RightClick" ) && lastItemID != eventInfo )
      SendMessage( qcGui[ "main_tv" ], 0x110B, 0x9, eventInfo )	;selects item
    SendMessage( qcGui[ "main_tv" ], 0x110B, 0x8, eventInfo )		; Show a focus independent selection over item; TVM_SELECTITEM := 0x110B,	TVGN_DROPHILITE := 0x8
    if ( lastItemID != eventInfo )
      Gui_Main_UpdControls( eventInfo )
    lastItemID := eventInfo
    HideFocus(1)						;removes focus border from selected item so it could look pretty
  }
  else if ( guiEvent == "e" && qcTVItems[ eventInfo ] ) ; second check is for case when user deletes items which is being edited
  {
    TV_GetText(ItemNewName, eventInfo)
		if qcconf.ItemGetAttr( qcTVItems[ eventInfo ], "disabled" )
			TV_Modify( eventInfo, "", qcconf.ItemGetAttr( qcTVItems[ eventInfo ], "name" ) )
		else
		{
			qcconf.ItemSetAttr( qcTVItems[ eventInfo ], "name", ItemNewName )
			qcconf.Save()
		}
    Gui_Main_UpdControls( eventInfo )
  }
  else if (guiEvent=="DoubleClick" && eventInfo)
	{
    QC_ChangeStash( qcTVItems[ eventInfo ] )
	}
	else if ( guiEvent ~= "\+|\-" ) ;item expanded/collapsed
		GUI_Main_TV_Redraw()
  return
}

QC_MakeBackUp( UID )
{
	stashPath := glb[ "gdsStashPath" ] "\" UID
  if !qcconf.GetNodeByID( UID )
    return 1
	if !FileExist( stashPath )
	{
    msgbox,16,Could not save stash,% "Could not save stash`nError making backup`nPath not found`n" stashPath
		return 0
	}
  Loop,%stashPath%\*.bak*,0,0	;getting files only
  {
		highest = 0
		num := SubStr( A_LoopFileExt, StrLen( A_LoopFileExt )-1, 1 )+0
		if (num > highest)
			highest := num
	}
	if (highest == glb[ "maxBackups" ])
	{
		if ( qcOpt["main_cur_core"] = "hc" )
			FileDelete,% stashPath "\transfer.gsh.bak" highest
		else
			FileDelete,% stashPath "\transfer.gst.bak" highest
	}
	loop,% glb[ "maxBackups" ]
	{
		ind := glb[ "maxBackups" ]-A_Index
		if (ind == 0)
			break
		if ( qcOpt["main_cur_core"] = "hc" )
			exPath := stashPath "\transfer.gsh.bak" ind
		else
			exPath := stashPath "\transfer.gst.bak" ind
		if !FileExist( exPath )
			continue
		indNext := glb[ "maxBackups" ]-A_Index+1
		if ( qcOpt["main_cur_core"] = "hc" )
			FileMove,% stashPath "\transfer.gsh.bak" ind,% stashPath "\transfer.gsh.bak" indNext,1
		else
			FileMove,% stashPath "\transfer.gst.bak" ind,% stashPath "\transfer.gst.bak" indNext,1
  }
	if ( qcOpt["main_cur_core"] = "hc" )
		FileMove,% stashPath "\transfer.gsh",% stashPath "\transfer.gsh.bak1",1
	else
		FileMove,% stashPath "\transfer.gst",% stashPath "\transfer.gst.bak1",1
	return 1
}	

QC_ChangeStash( UID, by_hotkey = false )
{
	cur_stash_uid := qcOpt["main_cur_core"] = "hc" ? qcOpt[ "cur_stash_uid_hc" ] : qcOpt[ "cur_stash_uid" ]
	if ( cur_stash_uid == UID)
		return
	stashNameNew := qcconf.ItemGetAttr( UID, "name" )
	stashNamePrev := qcconf.ItemGetAttr( cur_stash_uid, "name" )
	if ( qcOpt[ "gen_showChangeWarning" ] )
	{
		if (by_hotkey && !qcOpt[ "gen_showChangeWarning_on_hotkey" ])
			DTP( stashNamePrev " => " stashNameNew,2500 )
		else
		{
			a := QMsgBoxP( { title : "Warning", msg : "Make sure you've closed the in-game stash window!`nYou may do it right now`n`n" stashNamePrev " => " stashNameNew 
							, buttons : "It Closed!|Cancel", pic : "i", "modal" : 1, pos : qcGui[ "main" ], "ontop" : 1, "nosysmenu" : 1 } )
			if (a = "Cancel")
				return
		}
	}
	if QC_IsStashDiff( cur_stash_uid )
	{
		if !QC_MakeBackUp( cur_stash_uid )
			return
		if !QC_SaveStashToVault( cur_stash_uid )
			return
	}
	if !QC_RestoreStashFromVault( UID )
		return
	QC_SetStashAsCurrent( UID )
	return
}

QC_IsStashDiff( UID )
{
	if ( qcOpt["main_cur_core"] = "hc" )
	{
		saveTo := glb[ "gdsStashPath" ] "\" UID "\transfer.gsh"
		saveFrom := qcOpt[ "gen_stash_loc" ] "\transfer.gsh"
	}
	else
	{
		saveTo := glb[ "gdsStashPath" ] "\" UID "\transfer.gst"
		saveFrom := qcOpt[ "gen_stash_loc" ] "\transfer.gst"
	}
	sha256From := Crypt.Hash.FileHash(saveFrom,4)
	sha256To := Crypt.Hash.FileHash(saveTo,4)
	if ( sha256From = sha256To )
		return 0
	return 1
}

QC_SaveStashToVault( UID )
{
  if !qcconf.GetNodeByID( UID )
    return 1
	if ( qcOpt["main_cur_core"] = "hc" )
	{
		saveTo := glb[ "gdsStashPath" ] "\" UID "\transfer.gsh"
		saveFrom := qcOpt[ "gen_stash_loc" ] "\transfer.gsh"
	}
	else
	{
		saveTo := glb[ "gdsStashPath" ] "\" UID "\transfer.gst"
		saveFrom := qcOpt[ "gen_stash_loc" ] "\transfer.gst"
	}
  sha256From := Crypt.Hash.FileHash(saveFrom,4)
	if !FileExist( saveFrom )
	{
    msgbox,16,Could not save stash,% "Could not save stash`nSource file not found`n" saveFrom
		return 0
	}
	FileCopy,% saveFrom,% saveTo, 1
	sha256To := Crypt.Hash.FileHash(saveTo,4)
	if (sha256From != sha256To)
	{
    msgbox,16,Could not save stash,% "Could not save stash`nHASH mismatch"
		return 0
	}
	return 1
}

QC_RestoreStashFromVault( UID )
{
	if ( qcOpt["main_cur_core"] = "hc" )
	{
		saveFrom := glb[ "gdsStashPath" ] "\" UID "\transfer.gsh"
		saveTo := qcOpt[ "gen_stash_loc" ] "\transfer.gsh"
	}
	else
	{
		saveFrom := glb[ "gdsStashPath" ] "\" UID "\transfer.gst"
		saveTo := qcOpt[ "gen_stash_loc" ] "\transfer.gst"
	}
	sha256From := Crypt.Hash.FileHash(saveFrom,4)
	if !FileExist( saveFrom )
	{
    msgbox,16,Could not restore stash,% "Could not restore stash`nSource file not found`n" saveFrom
		return 0
	}
	FileCopy,% saveFrom,% saveTo, 1
	sha256To := Crypt.Hash.FileHash(saveTo,4)
	if (sha256From != sha256To)
	{
    msgbox,16,Could not save stash,% "Could not save stash`nHASH mismatch"
		return 0
	}
	return 1
}

QC_SetStashAsCurrent( UID )
{
	Gui,1:Default
	if ( qcOpt["main_cur_core"] = "hc" )
		qcOpt[ "cur_stash_uid_hc" ] := UID
	else
		qcOpt[ "cur_stash_uid" ] := UID
	for k,v in qcTVItems
		if (v == UID)
		{
			tvid := k
			break
		}
	nid := 0
	while (nid:=TV_GetNext( nid, "Full" ))
		TV_Modify( nid, "-Bold" )
	TV_Modify( tvid, "+Bold Select" )
	qcconf.Save()
}