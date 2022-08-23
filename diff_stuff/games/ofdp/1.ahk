#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
Process, Priority, , High
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
global exe_name := "One Finger Death Punch.exe"
Hotkey( "!``", 1, "start" )
Hotkey( "^``", 1, "rel" )
return

;~ start:
;~ while 1
;~ {
  ;~ MouseGetPos,x,y,hwnd
  ;~ WinGetPos,x,y,w,h,% "ahk_id " hwnd
  ;~ tooltip % w ":" h
;~ }

start:
if !(w_h := WinActive("ahk_exe " exe_name) )
  return
WinGetPos,,,w,h,% "ahk_id " hwnd
if !( w == 1292 && h == 757 )
  WinMove,% "ahk_exe " exe_name,,,,1292,757
while true
{
  if (isLB := lb_search())
  {
    mSend( "LButton" )
  }
  if (isRB := rb_search())
  {
    mSend( "RButton" )
  }
  if ( isLB || isRB )
    continue
}
return

cr_l_search()
{
  if ImgSearchCC( "crown1.png", 280, 331, 560, 338, 40 )
    return 1
  if ImgSearchCC( "crown2.png", 280, 331, 560, 338, 40 )
    return 1
  if ImgSearchCC( "crown3.png", 320, 226, 602, 239, 40 )
    return 1
  if ImgSearchCC( "crown4.png", 320, 226, 602, 239, 40 )
    return 1
  return 0
}

cr_r_search()
{
  if ImgSearchCC( "crown1.png", 690, 331, 990, 338, 40 )
    return 1
  if ImgSearchCC( "crown2.png", 690, 331, 990, 338, 40 )
    return 1
  if ImgSearchCC( "crown3.png", 670, 226, 990, 239, 40 )
    return 1
  if ImgSearchCC( "crown4.png", 670, 226, 990, 239, 40 )
    return 1
  return 0
}

mSendCC( key )
{
  Send % "{" key " down}"
  sleep 40
  Send % "{" key " up}"
}

lb_search()
{
  static lb_coords,lb_coords2
  static img := "lb2.png",img2 := "lb.png"
  if !lb_coords
  {
    cc := ImgSearchCC( img, 595, 370, 620, 390, 60 )
    if cc
    {
      lb_coords := cc
      return 1
    }
    return 0
  }
  else if !lb_coords2
  {
    cc := ImgSearchCC( img2, 375, 343, 417, 385, 60 )
    if cc
    {
      lb_coords2 := cc
      return 1
    }
    return 0
  }
  else if ImgSearchCC( img, lb_coords["x"]-1, lb_coords["y"]-1, lb_coords["x"]+10, lb_coords["y"]+10, 60 )
    return 1
  else if ImgSearchCC( img2, lb_coords2["x"]-1, lb_coords2["y"]-1, lb_coords2["x"]+10, lb_coords2["y"]+10, 60 )
    return 1
  return 0
}

rb_search()
{
  static rb_coords,rb_coords2
  static img := "rb2.png",img2 := "rb.png"
  if !rb_coords
  {
    cc := ImgSearchCC( img, 665, 365, 690, 390, 60 )
    if cc
    {
      rb_coords := cc
      return 1
    }
    return 0
  }
  else if !rb_coords2
  {
    cc := ImgSearchCC( img2, 862, 343, 904, 384, 60 )
    if cc
    {
      rb_coords2 := cc
      return 1
    }
    return 0
  }
  else if ImgSearchCC( img, rb_coords["x"]-1, rb_coords["y"]-1, rb_coords["x"]+10, rb_coords["y"]+10, 60 )
    return 1
  else if ImgSearchCC( img2, rb_coords2["x"]-1, rb_coords2["y"]-1, rb_coords2["x"]+10, rb_coords2["y"]+10, 60 )
    return 1
  return 0
}

mSend( key, long=0, isShoot = False )
{
  Send % "{" key " down}"
  if long
    sleep % long
  else 
    sleep 50
  Send % "{" key " up}"
  sleep 40
  if isShoot
  {
    if !ImgSearchCC( "is_active_shoot.png", 632, 379, 663, 385, 50 )
      sleep 100
  }
  tooltip
}

ImgSearchCC( imgName, x, y, x2, y2, vari = 25 )
{
  if not WinActive("ahk_exe " exe_name)
    return 0
  ImageSearch,px,py,% x,% y,% x2,% y2,% "*" . vari . " " . imgName
  if ( Errorlevel == 0 )
    return { "x" : px, "y" : py }
  return 0
}

ImgSearchHR( imgName, vari = 25 )
{
  if not WinActive("ahk_exe " exe_name)
    return 0
  WinGetPos,wx,wy,ww,wh,% "ahk_exe " exe_name
  ImageSearch,px,py,% ww*0.5,% wh*0.4,% ww*0.6,% wh*0.6,% "*" . vari . " " . imgName
  if ( Errorlevel == 0 )
    return { "x" : px, "y" : py }
  return 0
}

ImgSearch( imgName, vari = 25 )
{
  if not WinActive("ahk_exe " exe_name)
    return 0
  WinGetPos,wx,wy,ww,wh,% "ahk_exe " exe_name
  ImageSearch,px,py,% ww*0.4,% wh*0.4,% ww*0.6,% wh*0.6,% "*" . vari . " " . imgName
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

rel:
Reload
ExitApp
return