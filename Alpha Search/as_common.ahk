/*
Alpha Search String functions
CheckCBList(cbHwnd,string) - search list box control of ComboBox for "string" and add one if not found
OpenLine() - opens selected line using choosen text editor
SaveCFG() - save program parameters into cfg file
GetCFG() - restore program parameters from cfg file
*/

CheckCBList(cbHwnd,string)
{
	MAX_ITEMS := 7												;determine maximum amount of items in the list
	ControlGet, num, FindString,% string,, ahk_id %cbHwnd%		;getting index of item match to "string"
	if !num														;if such item not found
		Control, Add,% string,, ahk_id %cbHwnd%				;add new item to the CB list
	count := SendMessage( cbHwnd, CB_GETCOUNT  := 0x0146, 0, 0 )	;getting items count of CB list
	if (count > MAX_ITEMS)
		Control, Delete, 1,, ahk_id %cbHwnd%					;delete first item from CB list
	return
}

/*
editorType:
1 - Scite4Autohotkey
2 - Notepad++
3 - Notepad
*/


SaveCFG()
{
	global
	ControlGetText, current_dir,, ahk_id %CBhw%
	ControlGet, dir_list, List,,, ahk_id %CBhw%
	dir_list := StrReplace(dir_list, "`n", "|")
	ControlGetText, current_pattern,, ahk_id %CBptrns%
	ControlGet, patterns_list, List,,, ahk_id %CBptrns%
	patterns_list := StrReplace(patterns_list, "`n", "|")
	cfg .= dir_list . "`n"
	cfg .= current_dir . "`n"
	cfg .= patterns_list . "`n"
	cfg .= current_pattern . "`n"	
	cfg .= RegEx . "`n"
	cfg .= MatchCase . "`n"
	cfg .= SchStr . "`n"
	cfg .= EditorTypeSW . "`n"
	cfg .= SciteExePath . "`n"
	cfg .= NPPExePath . "`n"
	fl := FileOpen(CFG_Path,"w")
	fl.Write(cfg)
	fl.close()
}

GetCFG()
{
	global
	fl := FileOpen(CFG_Path,"r")
	if !isObject(fl)
		return
	GuiControlSet("SearchDir","|" . Trim(fl.ReadLine(),"`t`n "), "", 1)
	ControlSetText,,% Trim(fl.ReadLine(),"`t`n "), ahk_id %CBhw%
	GuiControlSet("Patterns","|" . Trim(fl.ReadLine(),"`t`n "), "", 1)
	ControlSetText,,% Trim(fl.ReadLine(),"`t`n "), ahk_id %CBptrns%
	GuiControlSet("RegEx",Trim(fl.ReadLine(),"`t`n "), "", 1)
	GuiControlSet("MatchCase",Trim(fl.ReadLine(),"`t`n "), "", 1)
	GuiControlSet("SchStr",Trim(fl.ReadLine(),"`t`n "), "", 1)
	GuiControl, Choose, EditorTypeSW,% Trim(fl.ReadLine(),"`t`n ")
	SciteExePath := % Trim(fl.ReadLine(),"`t`n ")
	NPPExePath := % Trim(fl.ReadLine(),"`t`n ")
	fl.close()
}

CheckScitePath()
{
	global SciteExePath
	Gui,1:+Owndialogs
	if (!SciteExePath || !FileExist(SciteExePath))
	{
		Msgbox,68,Scite path required,It seems like Scite executable path didn't specified or invalid.`nDo you want to point to it now?
		IfMsgBox,Yes
		{
			FileSelectFIle,sct,3,::{20d04fe0-3aea-1069-a2d8-08002b30309d},Select Scite.exe,scite.exe
			if sct
				SciteExePath := sct
		}
	}	
	return
}

CheckNPPPath()
{
	global NPPExePath
	Gui,1:+Owndialogs
	if (NPPExePath && !FileExist(NPPExePath))
	{
		Msgbox,67,Notepad++ path required,It seems like Notepad++ executable path didn't specified or invalid.`nDo you want to point to it now?`nClick "Cancel" to reset path to default "notepad++.exe"
		IfMsgBox,Yes
		{
			FileSelectFIle,sct,3,::{20d04fe0-3aea-1069-a2d8-08002b30309d},Select Notepad++.exe,Notepad++.exe
			if sct
				NPPExePath := sct
		}
		IfMsgBox,Cancel
			NPPExePath =
	}		
	return
}

/*
Standard Functions:

GuiControlGet(Control_Name,Gui="") - get value of control by it's variable name
GuiControlSet(Control_Name,Value="",Options="",Pos="",Gui="") - set control's value or options by it's name. Possible to use on many control by dividing controls nams with "|"
API_PathQualify(path) - qualify relative path to full path
API_ShellExecute(target,args = "", work_dir = "",verb = "") - run shell command
SendMessage( hWnd, Msg, wParam, lParam ) - similar to sendMessage ahk function
*/
GuiControlGet(Control_Name,Gui="")	{
	if (Gui = "")
		if A_Gui
			Gui := A_Gui
		else
			Gui := 1
	GuiControlGet,value,%Gui%:,%Control_Name%
	return value
}

GuiControlSet(Control_Name,Value="",Options="",Gui="",CanBeEmptyValue=1)	{	;if few control, separate them with |
	if (Gui = "")
		if A_Gui
			Gui := A_Gui
		else
			Gui := 1
	Loop, Parse, Control_Name, |, %A_Tab%%A_Space%
	{
		if (Value != "" || CanBeEmptyValue)
			GuiControl,%GUI%:,%A_Loopfield%,%Value%
		if Options
		{
			GuiControl,% GUI ": " Options, %A_Loopfield%
			GuiControl,% GUI ": MoveDraw", %A_Loopfield%,% Options
		}
	}
	return
}

API_PathQualify(path)
{
	VarSetCapacity(q_path,260*2+1)
	ret_val := DllCall("Shlwapi\PathSearchAndQualifyW","str",path,"str",q_path,"UInt",260)
	if ret_val
		return q_path
	else
		return path
}

API_ShellExecute(target,args = "", work_dir = "",verb = "")
{
	return DllCall("shell32\ShellExecuteW", "Ptr", 0, "str", verb, "str", target, "str", args, "str", work_dir, "int", 1)
}

SendMessage( hWnd, Msg, wParam, lParam )
{
   static SendMessageW

   If not SendMessageW
      SendMessageW := LoadDllFunction( "user32.dll", "SendMessageW" )

   ret := DllCall( SendMessageW, "Ptr", hWnd, "UInt", Msg, "UInt", wParam, "UInt", lParam )
   return ret
}

LoadDllFunction( file, function ) {
    if !hModule := DllCall( "GetModuleHandleW", "str", file, "Ptr" )
        hModule := DllCall( "LoadLibraryW", "str", file, "Ptr" )
	
    ret := DllCall("GetProcAddress", "Ptr", hModule, "AStr", function, "Ptr")
	return ret
}

GetShellExecuteError(err_code)
{
	if (err_code = 0)
		err_descr = The operating system is out of memory or resources.
	else if (err_code = 2)
		err_descr = The specified file was not found.
	else if (err_code = 3)
		err_descr = The specified path was not found.
	else if (err_code = 11)
		err_descr = The .exe file is invalid (non-Win32 .exe or error in .exe image).
	else if (err_code = 5)
		err_descr = The operating system denied access to the specified file.
	else if (err_code = 27)
		err_descr = The file name association is incomplete or invalid.
	else if (err_code = 30)
		err_descr = The DDE transaction could not be completed because other DDE transactions were being processed.
	else if (err_code = 29)
		err_descr = The DDE transaction failed.
	else if (err_code = 28)
		err_descr = The DDE transaction could not be completed because the request timed out.
	else if (err_code = 32)
		err_descr = The specified DLL was not found.
	else if (err_code = 31)
		err_descr = There is no application associated with the given file name extension. This error will also be returned if you attempt to print a file that is not printable.
	else if (err_code = 8)
		err_descr = There was not enough memory to complete the operation.
	else if (err_code = 26)
		err_descr = A sharing violation occurred.
	else
		err_descr = error code %err_code%
	return err_descr
}

; LV_SortArrow by Solar. http://www.autohotkey.com/forum/viewtopic.php?t=69642
; h = ListView handle
; c = 1 based index of the column
; d = Optional direction to set the arrow. "asc" or "up". "desc" or "down".
LV_SortArrow(h, c, d="") {
   static ptr, ptrSize, lvColumn, LVM_GETCOLUMN, LVM_SETCOLUMN
   if (!ptr)
      ptr := A_PtrSize ? ("ptr", PtrSize := A_PtrSize) : ("uint", PtrSize := 4)
      ,LVM_GETCOLUMN := A_IsUnicode ? (4191, LVM_SETCOLUMN := 4192) : (4121, LVM_SETCOLUMN := 4122)
      ,VarSetCapacity(lvColumn, PtrSize + 4), NumPut(1, lvColumn, 0, "uint")
   c -= 1, DllCall("SendMessage", ptr, h, "uint", LVM_GETCOLUMN, "uint", c, ptr, &lvColumn)
   if (fmt := NumGet(lvColumn, 4, "int") & 1024) {
      if (d && d = "asc" || d = "up")
         Return
      NumPut(fmt & ~1024 | 512, lvColumn, 4, "int")
   } else if (fmt & 512) {
      if (d && d = "desc" || d = "down")
         Return
      NumPut(fmt & ~512 | 1024, lvColumn, 4, "int")
   } else {
      Loop % DllCall("SendMessage", ptr, hHD := DllCall("SendMessage", ptr, h, "uint", 4127), "uint", 4608)
         if ((i := A_Index - 1) != c)
            DllCall("SendMessage", ptr, h, "uint", LVM_GETCOLUMN, "uint", i, ptr, &lvColumn)
            ,NumPut(NumGet(lvColumn, 4, "int") & ~1536, lvColumn, 4, "int")
            ,DllCall("SendMessage", ptr, h, "uint", LVM_SETCOLUMN, "uint", i, ptr, &lvColumn)
      NumPut(fmt | (d && d = "desc" || d = "down" ? 512 : 1024), lvColumn, 4, "int")
   }
   return DllCall("SendMessage", ptr, h, "uint", LVM_SETCOLUMN, "uint", c, ptr, &lvColumn)
}