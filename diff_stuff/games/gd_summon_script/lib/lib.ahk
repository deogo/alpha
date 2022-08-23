get_health_perc()
{
  return NumGet(mapping_addr+0,offsets.hp_perc.ofs,offsets.hp_perc.type)
}

get_energy_perc()
{
  return NumGet(mapping_addr+0,offsets.en_perc.ofs,offsets.en_perc.type)
}

has_any_status( images_list )
{
  status_found := False
  for _,img in images_list
    status_found := status_found || has_status(img)
  return status_found
}

has_status( image_name )
{
  ImageSearch,xi,yi,514,876,752,980,% "*30 " image_name
  return !ErrorLevel
} 

in_party( image_name, y_start = 0 )
{
  y_start := y_start ? y_start + 10 : 42
  ImageSearch,xi,yi,2,% y_start,50,800,% "*80 " image_name
  if !ErrorLevel
    return {"x" : xi,"y":yi}
  else
    return {"x" : 0,"y":0}
}

is_skill_available( image_name )
{
  ImageSearch,xi,yi,656,1034,1099,1077,% "*20 " image_name
  return !ErrorLevel
}

is_rmb_skill_available( image_name )
{
  ImageSearch,xi,yi,1220,1035,1270,1080,% "*35 " image_name
  return !ErrorLevel
}

is_enemy()
{
  for ind,img in ["enemy_common","enemy_rare", "enemy_hero", "enemy_boss","enemy_nemesis"]
  {
    ImageSearch,xi,yi,760,50,880,83,% "*35 *TransBlack " img ".png"
    if !ErrorLevel
      return ind
  }
  return 0
}

is_main_screen()
{
  ImageSearch,xi,yi,457,1001,481,1024,% "*10 main_screen_on.png"
  return !ErrorLevel
}

is_inv_open()
{
  ImageSearch,xi,yi,1262,180,1289,207,% "*20 inv.png"
  return !ErrorLevel
}

is_inventor_open()
{
  ImageSearch,xi,yi,1436,180,1465,207,% "*20 inv.png"
  return !ErrorLevel
}

is_chat_open()
{
  ImageSearch,xi,yi,500,789,531,821,% "*20 chat_open.png"
  return !ErrorLevel
}
show_pos()
{
  MouseGetPos,xc,yc
  tooltip % xc ":" yc
  sleep 100
}

time_diff( from )
{
  return (A_TickCount - from)
}

send_key(key,hold_for,f_on_enemy=0)
{
  d_keys[key] := {"delay" : hold_for, "on_enemy" : f_on_enemy}
  return
}

send_key_now(key,hold_for=0)
{
  if hold_for
  {
    SendInput % "{"  key " down}"
    sleep % hold_for
    SendInput % "{"  key " up}"
  }
  else if (key = "rbutton")
  {
    lmb_down := GetKeyState("LButton","P")
    if lmb_down
      SendInput % "{LButton up}"
    SendInput % "{RButton down}"
    sleep % 300
    SendInput % "{RButton up}"
    if lmb_down
      SendInput % "{LButton down}"
  }
  else
  {
    SendInput % "{"  key "}"
    sleep 30
  }
  return
}

find_greens(x1,y1,x2,y2)
{
  for _,img in ["greens_main","greens_main1","greens_main2","greens_bag"]
  {
    ImageSearch,xi,yi,x1,y1,x2,y2,% "*35 *TransBlack " img ".png"
    if !ErrorLevel
      return {x : xi, y : yi}
  }
  return 0
}

is_automation_allowed()
{
  return NumGet(mapping_addr+0,offsets.auto_allowed.ofs,offsets.auto_allowed.type)
}

get_cur_enemy_type()
{
  return NumGet(mapping_addr+0,offsets.enemy_type.ofs,offsets.enemy_type.type)
}

mem_is_ui_opened()
{
  return NumGet(mapping_addr+0,offsets.ui_opened.ofs,offsets.ui_opened.type)
}

is_game_running() {
  return NumGet(mapping_addr+0,offsets.game_running.ofs,offsets.game_running.type)
}

is_allowed_proc()
{
  return !( mem_is_ui_opened()
          || is_chat_open()
          || !is_main_screen())
}

tlp(msg,delay,x="",y="",num=1)
{
  tooltip,% msg,% x,% y,% num
  SetTimer,tlp_off,-%delay%
  return
  
  tlp_off:
  tooltip,,,,% num
  return
}

GetLastError()
{
	return ToHex(A_LastError < 0 ? A_LastError & 0xFFFFFFFF : A_LastError)
}

;converting decimal to hex value
ToHex(num)
{
	if num is not integer
		return num
	oldFmt := A_FormatInteger
	SetFormat, integer, hex
	num := num + 0
	SetFormat, integer,% oldFmt
	return num
}

;And this function returns error description based on error number passed. ;
;Error number is one returned by GetLastError() or from A_LastError
ErrorFormat(error_id)
{
	VarSetCapacity(msg,8,0)
	if !(len := DllCall("FormatMessageW"
        ; FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS | FORMAT_MESSAGE_ALLOCATE_BUFFER
				,"UInt",0x00001000 | 0x00000200 | 0x00000100	;dwflags
				,"Ptr",0		;lpSource
				,"UInt",error_id+0	;dwMessageId
				,"UInt",0			;dwLanguageId
				,"Ptr",&msg		;lpBuffer
				,"UInt",8))			;nSize
		return
	return strget(NumGet(&msg)+0,len)
}

crit_fail(msg)
{
  msgbox % msg "`nError: " (gle:=GetLastError()) "`n" ErrorFormat(gle)
  ExitApp
}

check_exit_condition(ppid)
{
  Process,Exist,% ppid ; parent check
  if !ErrorLevel
    ExitApp
}

check_job_condition( d_conditions, last_used ) {
  if !d_conditions
    return 1
  or_result := 0
  for _,d_ands in d_conditions
  {
    and_result := 1
    for name,value in d_ands
    {
      if (name = "enemy")
        and_result &= get_cur_enemy_type() >= value
      if (name = "timer")
        and_result &= time_diff( last_used ) >= value
      if (name = "health_lower_than")
        and_result &= get_health_perc()<value
      if (name = "no_status")
        and_result &= !has_any_status(value)
      if (name = "not_in_party")
      {
        found := 0
        for _,img in value
          if in_party(img).x
          {
            found := 1
            break
          }
        and_result &= !found
      }
      if (name = "not_in_party_twice")
      {
        found := 0
        for _,img in value
        {
          ret1 := in_party(img)
          if ret1.y
            break
        }
        if ret1.x
        {
          for _,img in value
            if (ret2 := in_party(img,ret1.y)).y
            {
              found := 1
              break
            }
        }
        and_result &= !found
      }
    }
    or_result |= and_result
    if or_result
      break
  }
  return or_result
}