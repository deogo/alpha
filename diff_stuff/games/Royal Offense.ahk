#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global exe_name := "RoyalOffense.exe"
Hotkey( "!``", 1, "start" )
Hotkey( "^``", 1, "rel" )
;~ CoordMode,Mouse,Window
;~ while true
;~ {
  ;~ MouseGetPos,x,y
  ;~ tooltip % x " " y
;~ }
return

start:
if !(w_h := WinActive("ahk_exe " exe_name) )
  return
WinGetPos,,,w,h,% "ahk_id " hwnd
tt := A_Now
t_move := A_Now
f_done_building := false
pf := "`nbuilding"
CoordMode, ToolTip,Screen
while true
{
  for k in [8,6,5,4,3,7,2,1]
  {
    mSend( k, w_h )
    sleep, 200
  }
  ;~ ControlClick,% "X40 Y725",% "ahk_id " w_h
  ;~ sleep, 100
  ;~ ControlClick,% "X100 Y725",% "ahk_id " w_h
  ;~ sleep, 100
  ;~ ControlClick,% "X160 Y725",% "ahk_id " w_h
  ;~ sleep, 100
  ;~ ControlClick,% "X440 Y360",% "ahk_id " w_h
  ;~ ControlClick,% "X440 Y360",% "ahk_id " w_h
  sleep 1000
  continue
  cur := A_Now
  cur -= tt
  ;~ cur_m := A_Now
  ;~ cur_m -= t_move
  ;~ if( f_done_building && cur_m > 60 )
  ;~ {
    ;~ t_move := A_Now
    ;~ mSend( "{d down}", w_h )
    ;~ sleep,500
    ;~ mSend( "{d up}", w_h )
  ;~ }
  if( cur > 370 && f_done_building )
  {
    ;~ msgbox % "done"
    return
  }
  if( cur > 700 && !f_done_building )
  {
    pf := "`nfighting"
    f_done_building := true
    tt := A_Now
    t_move := A_Now
    mSend( "s", w_h )
  }
  tooltip, % cur . pf,0,0
}
return

mSend( k, hwnd )
{
  ControlSend,, % k,% "ahk_id " hwnd
}

Hotkey( hkey, state, label="" )
{
  if (hkey = "")
    return
  if state not in 0,1
    return
  error := ""
  hk_list := HotkeyGetVK(hkey)
  if hk_list.MaxIndex()
    for i,hk in hk_list
    {
      if( ex := _SetHotkey( hk, state, label ) )
        error .= ( error ? "`n" : "") "Hotkey wasn't set" hkey
                . ";`nCode: " . hk ";`nError: " . ex.message . ";`n"
    }
  else
    error .= (error ? "`n" : "") "Hotkey wasn't set" hkey ";`nError: The required symbol was not found on your current keyboard layouts.`n"
  if error
    msgbox % error
  return
}

_SetHotkey( hk, state, label = ""  )
{
  try
    HotKey,% hk,% label,% ( state = 0 ? "OFF" : "ON" )
  catch ex
    return ex
  return
}

HotkeyGetVK( hk )
{
	if !RegExMatch(hk,"^\s*(\^|!|\+|#)*\K\pL$",letter)
		return [hk]		;1-element array
	StringReplace, hk, hk, % letter,,1
	hkList := Array()
	for i,v in GetVKList(letter)
		hkList.insert(hk . "vk" . v)
	return hkList
}

KeyboardLayoutList()
{
	hkl_num := 20
	VarSetCapacity(hHkls,hkl_num*A_PtrSize,0)
	num := DllCall("GetKeyboardLayoutList","Uint",hkl_num,"Ptr",&hHkls)
	hkl_list := Array()
	loop,% num
		hkl_list.Insert(NumGet(hHkls,(A_index-1)*A_PtrSize,"UPtr"))
	return hkl_list
}

GetVKList( letter )
{
	SetFormat, Integer, Hex
	vk_list := Array()
	for i, hkl in KeyboardLayoutList()
	{
		retVK := DllCall("VkKeyScanExW","UShort",Asc(letter),"Ptr",hkl,"Short")
		if (retVK = -1)
			continue
		vk := retVK & 0xFF
		StringTrimLeft,vk,vk,2
		if !instr(_list,"|" vk "|")
		{
			_list .= "|" vk "|"
			vk_list.insert(vk)
		}
	}
	SetFormat, Integer, D
	return vk_list
}

rel:
Reload
ExitApp
return