#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global vh_exe := "VanHelsing_x64_11.exe"
Hotkey( "!``", 1, "dothestuff" )
Hotkey( "^``", 1, "rel" )
Hotkey( "!a", 1, "test" )
plan := { 5 : "dismember.png"
				, 6 : "orni_patrol.png"
				, 3 : "", 4 : "" }
				;~ , 1 : "", 2 : "" }
return

test:
for hk,img in plan
	if ( img != "" && VHImgSearch( img ) )
	{
		tooltip % img " found"
		sleep 1000
	}
	else
	{
		tooltip % img " not found"
		sleep 1000
	}
tooltip
return

rel:
  Reload
	ExitApp
  return

dothestuff:
  While True
  {
    sleep 500
		if !VHCheckActive()
			continue
		for hk,img in plan
		{
			if !VHCheckActive()
				break
			fImgFound := False
			if ( img != "" && IsObject(img) )
			{
				for i,imgsub in img
				{
					if VHImgSearch( imgsub )
					{
						fImgFound := True
						break
					}
				}
			}
			else if ( img != "" && VHImgSearch( img ) )
				fImgFound := True
			if ( img != "" && !fImgFound )
				mSend( hk, 100 )
			else if ( img == "" )
			;~ else if ( img == "" && GetKeyState( "RButton", "P" ) )
				mSend( hk, 100 )
		}
  }
return

VHCheckActive()
{
	return ( WinActive( "ahk_exe " vh_exe ) && VHImgSearch( "is_in_game.png", 4, 3, 25 ) 
					&& !GetKeyState( "Alt", "P" ) && !GetKeyState( "ctrl", "P" ) )
}

mSend( key, long=0 )
{
  if long
  {
    Send % "{" key " down}"
    sleep % long
    Send % "{" key " up}"
  }
  else
  {
    Send % key
    sleep 100
  }
}

VHImgSearch( imgName, wstart = 2, hstart =3, vari = 25 )
{
  if not WinActive("ahk_exe " vh_exe)
    return 0
  WinGetPos,wx,wy,ww,wh,% "ahk_exe " vh_exe
  ImageSearch,px,py,% ww/wstart,% wh/hstart,% ww,% wh,% "*" . vari . " " . imgName
  if ( Errorlevel == 0 )
    return { "x" : px, "y" : py }
  return 0
}

mClick( x,y, cnt = 1 )
{
  MouseMove,% x,% y,% mspd
  sleep 200
  MouseClick,Left,% x,% y,% cnt,% mspd
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