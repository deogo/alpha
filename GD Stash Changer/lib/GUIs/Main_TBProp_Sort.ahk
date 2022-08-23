Gui_Main_TVItem_SortMenu( tbButtonPos )
{
	static s_menuCreated
	if !s_menuCreated
	{
		Menu, QCMenuSort, add, Alpha, QCSortAlpha
		Menu, QCMenuSort, add, Random, QCSortRandom
		Menu, QCMenuSort, add, Alpha Rev, QCSortRev
	}
	ControlGetPos,x,y,w,h,,% "ahk_id " qcGui[ "main_tlbprop" ]
	p := StrSplit(Toolbar_GetRect( qcGui[ "main_tlbprop" ], tbButtonPos ),A_Space)
	CoordMode,Menu,Relative
	Menu,QCMenuSort,Show,% x+p[1],% y+p[4]+p[2]
	return
	
	QCSortAlpha:
	QCSortRandom:
	QCSortRev:
		Gui,1:Default
		TVID := 0
		atl := A_ThisLabel
		sortType := atl = "QCSortAlpha" 			? "F QCSort_Alpha"
							: atl = "QCSortRev" 				? "F QCSort_AlphaRev"
							: "Random"
		
		TV_Modify( TVID, "Expand Select" )
		ids := GetMenuIDs( TVID )
		Sort, ids,% sortType
		SetMenuIDs( TVID, ids )
		QC_BuildTV( TVID, -1 )
		qcconf.Save()
		return
}

GetMenuIDs( menuID )
{
	xmlNode := qcconf.ItemResolve( qcTVItems[ menuID ] )
	for item in ( items := xmlNode.selectNodes( "item" ) )
		if !qcconf.IsSeparator( item )	;exclude separators from the list
			ids .= ( ids ? "`n" : "" ) item.getAttribute( "ID" )
	return ids
}

SetMenuIDs( menuID, ids )
{
	xmlNode := qcconf.ItemResolve( qcTVItems[ menuID ] )	;getting xml node from ID
	nodes := object()
	separs := object()
	ind := 0
	for node in ( nodesSelection := xmlNode.selectNodes( "item" ) )	;selecting all items from the node
	{
		if !qcconf.IsSeparator( node )
			nodes[ node.getAttribute( "ID" ) ] := node.cloneNode( True )	;saving nodes to array by ID
		else
			separs[ ind ] := node.cloneNode( True )	;saving separatos and their position(index)
		ind++
	}
	nodesSelection.removeAll()	;deleting all selected items
	;append nodes back in sorted order
	for i,id in StrSplit( ids, "`n", A_Space A_Tab "`r" )
		if id
			xmlNode.appendChild( nodes[ id ] )
	;inserting separators back to the same place where they was
	for i,node in separs
	{
		if ( beforeNode := xmlNode.selectSingleNode( "item[" i+1 "]" ) )
			xmlNode.insertBefore( node, beforeNode )
		else
			xmlNode.appendChild( node )
	}
}

QCSort_Alpha( item1, item2 )
{
	name1 := qcconf.ItemResolve( item1 ).getAttribute( "name" )
	name2 := qcconf.ItemResolve( item2 ).getAttribute( "name" )
	return name1 > name2 ? 1 : name1 = name2 ? 0 : -1
}

QCSort_AlphaRev( item1, item2 )
{
	name1 := qcconf.ItemResolve( item1 ).getAttribute( "name" )
	name2 := qcconf.ItemResolve( item2 ).getAttribute( "name" )
	return name1 > name2 ? -1 : name1 = name2 ? 0 : 1
}