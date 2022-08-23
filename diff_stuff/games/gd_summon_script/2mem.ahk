#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Include %A_ScriptDir%\lib
#Include classMemory.ahk
#Persistent
if (_ClassMemory.__Class != "_ClassMemory")
{
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
    ExitApp
}
;~ _ClassMemory.setSeDebugPrivilege()
proc := "grim dawn.exe"
gd := new _ClassMemory("ahk_exe " proc, "", hProcess) 
if !isObject(gd) 
{
    msgbox failed to open a handle
    if (hProcess = 0)
        msgbox The program isn't running (not found) or you passed an incorrect program identifier parameter. In some cases _ClassMemory.setSeDebugPrivilege() may be required. 
    else if (hProcess = "")
        msgbox OpenProcess failed. If the target process has admin rights, then the script also needs to be ran as admin. _ClassMemory.setSeDebugPrivilege() may also be required. Consult A_LastError for more information.
    crit_fail(proc " opening failed")
}

aob := gd.hexStringToPattern("20 4E E6 09 F7")
if !isObject(aob)
  crit_fail("failed creating HP AOB pattern, err: " aob)
hp_base_addr := gd.modulePatternScan("grim dawn.exe", aob*) ; == gd.BaseAddress+0x36FEC8
if (hp_base_addr <= 0)
  crit_fail("HP AOB pattern not found, err: " hp_base_addr)

aob := gd.hexStringToPattern("70 F6 72 0B F7 00 00 00 04 00")
if !isObject(aob)
  crit_fail("failed creating EN AOB pattern, err: " aob)
en_base_addr := gd.modulePatternScan("Engine.dll", aob*) ; == gd.getModuleBaseAddress("engine.dll")+0x418308
if (en_base_addr <= 0)
  crit_fail("EN AOB pattern not found, err: " en_base_addr)

; tests
;~ msgbox % tohex( gd.BaseAddress+0x36FEC8 ) "`n" tohex( hp_base_addr )
;~ msgbox % tohex( gd.getModuleBaseAddress("engine.dll")+0x418308 ) "`n" tohex( en_base_addr )

hp_cur_addr := gd.getAddressFromOffsets(hp_base_addr, [0x78,0x2F0,0xC78,0xB0]*)
hp_max_addr := hp_cur_addr + 4
mana_cur_addr := gd.getAddressFromOffsets(en_base_addr, [0x3E0, 0x48, 0x2F0, 0x810, 0xB0]*)
mana_max_addr := mana_cur_addr + 4
while gd.isHandleValid()
{
	hp_cur := gd.read(hp_cur_addr,"Float")
	hp_max := gd.read(hp_max_addr,"Float")
	en_cur := gd.read(mana_cur_addr,"Float")
	en_max := gd.read(mana_max_addr,"Float")
	msg := "HP " hp_cur/hp_max*100 "`nEN " en_cur/en_max*100
  ;~ msg := "HP = " gd.read(hp_cur_addr,"Float")
  ;~ msg .= "`nHP max = " gd.read(hp_max_addr,"Float")
  ;~ msg .= "`nEN = " gd.read(mana_cur_addr,"Float")
  ;~ msg .= "`nEN max = " gd.read(mana_max_addr,"Float")
  tooltip % msg
  sleep 100
}
return

F1::
Reload
ExitApp
return

crit_fail(msg)
{
  msgbox % msg "`nError:`n" ErrorFormat(GetLastError())
  ExitApp
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