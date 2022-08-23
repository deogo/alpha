#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global exe_name := "RoyalHeroes.exe"
Hotkey( "!``", 1, "start" )
Hotkey( "^``", 1, "rel" )
fin_time := 24000
miss_coord := "X519 Y435"
sub_coord := "X785 Y302"
spell_coords := [ "X670 Y433", "X662 Y602", "X662 Y177" ]
SetKeyDelay, 0, 10
CoordMode,Mouse,Window
return

~LControl & F1::
loop
{
  MouseGetPos,x,y
  tooltip % x " " y
  sleep,100
}
return

start:
if !(w_h := WinActive("ahk_exe " exe_name) )
  return
CoordMode, ToolTip,Screen
loop
{
  if(  Mod(A_Index, 10) == 0 )
  {
    tooltip, % A_Index " menu...",0,0
    loop,5
    {
      mSend( "{Esc}", w_h )
      sleep,500
    }
    ControlClick,% "X638 Y490",% "ahk_id " w_h
    sleep,1000
    ControlClick,% "X653 Y386",% "ahk_id " w_h
    sleep,2000
  }
  tooltip, % A_Index " starting...",0,0
  loop,2
  {
    ControlClick,% "X577 Y533",% "ahk_id " w_h
    sleep,200
  }
  ControlClick,% miss_coord,% "ahk_id " w_h
  sleep, 1000
  ControlClick,% sub_coord,% "ahk_id " w_h
  sleep, 400
  ControlClick,% "X715 Y450",% "ahk_id " w_h
  tt := A_TickCount
  tooltip, % A_Index . " in battle init...",0,0
  sleep, 4000
  tooltip, % A_Index . " executing spells...",0,0
  for i,crd in spell_coords
  {
    loop,2
      ControlClick,% crd,% "ahk_id " w_h
    sleep, 300
    for k in [1,2,3,4,5,6]
    {
      mSend( k, w_h )
      sleep, 100
    }
    sleep, 2000
  }
  while true
  {
    cur := A_TickCount - tt
    tooltip, % cur,0,0
    if( cur > fin_time )
    {
      tooltip, % cur . " finished, exiting to map",0,0
      loop,8
      {
        ControlClick,,% "ahk_id " w_h
        sleep,500
      }
      break
    }
    sleep, 100
  }
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