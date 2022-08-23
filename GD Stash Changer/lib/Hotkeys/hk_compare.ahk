HotkeysCompare( atGui = "", showErrMsg = 1 )
{
  hotkeys_log := ""
  G := object()
  H := object()
  ident := "     "  
  nodes := qcconf.GetMenuNode().selectNodes( ".//item[ @hotkey != '' ]" )	;getting nodes with non-empty hotkey attr
    while ( node := nodes.nextNode )
    H.insert( { hk : node.getAttribute( "hotkey" ), descr : qcconf.GetItemPath( node ) } )
  
  for i,props in H
  {
    if ( "" == ( hk := props.hk ) )
      continue
    descr := props.descr
    j := i
    While !( ++j > H.MaxIndex() )
    {
      if ( "" == ( hk_next := H[ j ].hk ) )
        continue
      if ( hk = hk_next )
        hotkeys_log .= "`n'" descr "' hotkey is the same as for '" H[ j ].descr "':`n" ident HotkeyToString( hk )
    }
  }
  
  if hotkeys_log
    output .= "Hotkeys errors:" hotkeys_log
  if ( output && showErrMsg )
    QMsgBoxP( { title : "Using of similar hotkeys"
          , msg : "Some of your hotkeys/mouse gestures are the same:`n`n" output
          , butons : "OK", pic : "!", modal : 1
          , pos : atGui, editbox : 1, rsz : 1 }, atGui )
  return output
}