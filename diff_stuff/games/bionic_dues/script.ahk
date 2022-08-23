#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Hotkey( "!d", 1, "dothestuff" )
Hotkey( "!x", 1, "rel" )
return

rel:
  Reload
  return

dothestuff:
  WinGetPos,,, wd, hg, A
  WinGetActiveTitle, starttitle
  xmid := wd/2
  ymid := hg/2
  dplan := [ { "coords" : [ 0,hg*3/4,wd/4,hg ], "images" : [ "menubutton.png" ], "skey" : "{Esc}" }
            ,{ "coords" : [ 0,0,xmid,hg ], "images" : [ "loadmenu.png" ], "fclick" : 1  }
            ,{ "coords" : [ 0,0,xmid,ymid ], "images" : [ "fstsave.png" ], "fclick" : 1, "clickcnt" : 2, "xoff" : 50, "yoff" : 20, "variation" : 30  }
            ,{ "coords" : [ 0,hg*3/4,wd/4,hg ], "images" : [ "menubutton.png" ] }
            ,{ "coords" : [ 0,0,wd,hg ], "images" : [ "chest.png", "chest2.png" ], "fclick" : 1, "yoff" : 20, "variation" : 40 }
            ,{ "coords" : [ xmid,0,wd,ymid ], "images" : [ "loot.png" ], "wait" : 100 }
            ,{ "coords" : [ xmid/2,0,wd,hg/8 ], "images" : [ "mk_blue.png", "mk_purp.png", "mk_orange.png" ], "fSearchOnce" : 1, "fStopIfFound" : 1, "variation" : 40, "wait" : 0 } ]
            
  While 1
  {
    for i,prm in dplan
    {
      x1 := prm["coords"][1]
      x2 := prm["coords"][3]
      y1 := prm["coords"][2]
      y2 := prm["coords"][4]
      imgs := prm["images"]
      fclick := prm["fclick"]
      clickcnt := prm["clickcnt"] ? prm["clickcnt"] : 1
      xoff := prm["xoff"] ? prm["xoff"] : 0
      yoff := prm["yoff"] ? prm["yoff"] : 0
      skey := prm["skey"]
      fSearchOnce := prm["fSearchOnce"]
      fStopIfFound := prm["fStopIfFound"]
      variation := prm["variation"] ? prm["variation"] : 20
      waitafter := prm["wait"]
      zoom := prm["zoom"]
      starttime := A_TickCount
      timeout := 5000
      while 1
      {
        WinGetActiveTitle, title
        if( title != starttitle )
        {
          tooltip % "focus lost"
          return
        }
        sleep 100
        try
        {
          for j,img in imgs
          {
            ImageSearch, x,y, x1,y1,x2,y2,% "*" variation " " img
            if !ErrorLevel
              break
          }
        }
        catch oEx
        {
          msgbox % "ImageSearch:`n" oEx.message "`n" oEx.Extra
          return
        }
        if( ErrorLevel = 1 )
        {
          if fSearchOnce
            break
          if ( A_TickCount - starttime > timeout )
            tooltip % "could not find " img
          continue
        }
        if fStopIfFound
        {
          ;tooltip % "found " img
          return
        }
        tooltip
        break
      }
      if fclick
      {
        MouseMove,% x+xoff,% y+yoff,5
        MouseClick,Left,,,% clickcnt
      }
      if( skey != "" )
        SendInput,% skey
      if waitafter
        sleep % waitafter
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