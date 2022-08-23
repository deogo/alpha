#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Hotkey( "!``", 1, "dothestuff" )
;~ Hotkey( "^``", 1, "rel" )
return

rel:
  Reload
	ExitApp
  return

dothestuff:
	SoundPlay, *-1, 1
  WinGetActiveTitle, starttitle
  While True
  {
    sleep 1500
    while GetKeyState( "alt", "P" )
		{
			if GetKeyState( "1", "P" )
			{
				SoundPlay, *-1, 1
				return
			}
      sleep 300
		}
    WinGetActiveTitle, title
    if( title != starttitle )
		{
			return
		}
		for num in [1,2,3,4,5,6]
		{
			if GetKeyState( "alt" )
				break
			SendInput,% "{" num " down}"
			SendInput,% "{" num " down}"
			sleep 100
			SendInput,% "{" num " up}"
			SendInput,% "{" num " up}"
			sleep 100
		}
  }
return

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
	free(hHkls)
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

Free(byRef var)
{
  VarSetCapacity(var,0)
  return
}

Hotkey( hkey, state, label="" )
{
  hk_list := HotkeyGetVK(hkey)
  if hk_list.MaxIndex()
    for i,hk in hk_list
    {
      if( ex := _SetHotkey( hk, state, label ) )
        error .= ( error ? "`n" : "") "Hotkey wasn't set: " . HotkeyToString( hkey )
                . ";`nCode: " . hk ";`nError: " . ex.message . ";`n"
    }
  else
    error .= (error ? "`n" : "") "Hotkey wasn't set: " . HotkeyToString( hkey ) . ";`nError: The required symbol was not found on your current keyboard layouts.`n"
  if error
    msgbox % error
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

HotkeyToString( HotKS ) {
	if( HotKS = "" )
		return "None"
	StringReplace,HotKS, HotKS, +, Shift+
	StringReplace,HotKS, HotKS, #, WIN+
	StringReplace,HotKS, HotKS, ^, Ctrl+
	StringReplace,HotKS, HotKS, !, Alt+
	StringReplace,HotKS, HotKS, RButton, Right Mouse Button
	StringReplace,HotKS, HotKS, MButton, Middle Mouse Button
	StringReplace,HotKS, HotKS, XButton1, Mouse 3 button
	StringReplace,HotKS, HotKS, XButton2, Mouse 4 button
	return %HotKS%
}