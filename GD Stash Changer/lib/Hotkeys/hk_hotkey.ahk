; ifWin = 1 for IfWinActive, 0 for IfWinNotActive
Hotkey( hkey, state, label="", IfWin="", title="", isPersistent = False )
{
  if (hkey = "")
    return
  if state not in 0,1
    return
  hk_list := HotkeyGetVK(hkey)
  if IfWin in 0,1
    Hotkey,% "IfWin" (IfWin ? "Active" : "NotActive"),% title
  if hk_list.MaxIndex()
    for i,hk in hk_list
    {
      qcHotkeyList[ hk ] := { orig : hkey
                            , label : label
                            , ifwin : IfWin
                            , iftitle : title 
                            , state : state
                            , persistent : isPersistent }
      if( ex := _SetHotkey( hk, state, label ) )
        error .= ( error ? "`n" : "") "Hotkey wasn't set: " . HotkeyToString( hkey )
                . ";`nCode: " . hk ";`nError: " . ex.message . ";`n"
    }
  else
    error .= (error ? "`n" : "") "Hotkey wasn't set: " . HotkeyToString( hkey ) . ";`nError: The required symbol was not found on your current keyboard layouts.`n"
  Hotkey,IfWinActive
  return error
}

_SetHotkey( hk, state, label = ""  )
{
  try
    HotKey,% hk,% label,% ( state = 0 ? "OFF" : "ON" )
  catch ex
    return ex
  return
}

HotkeySetAll( state )
{
  for hk, params in qcHotkeyList
  {
    if !params.state
      continue
    if params.persistent
      continue
    if( params.ifwin != "" )
      Hotkey,% "IfWin" ( params.ifwin ? "Active" : "NotActive"),% params.iftitle
    _SetHotkey( hk, state )
    Hotkey,IfWinActive
  }
}