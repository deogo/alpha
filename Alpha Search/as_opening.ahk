OpenLine(filePath,lineNum,editorType)
{
	global
	local ret
	if (editorType = 1)	;Scite4Autohotkey
	{
		CheckScitePath()
		if ((ret := API_ShellExecute(SciteExePath,FilePath)) <= 32)
		{
			Msgbox,64,Error opening file,% GetShellExecuteError(ret)
			return
		}
		WinWaitActive,ahk_class SciTEWindow
		sleep 200
		scHwnd := WinExist("A")
		ControlGet,scintHwnd,Hwnd,,Scintilla1,ahk_id %scHwnd%
		SendMessage( scintHwnd, SCI_GOTOLINE := 2024, lineNum-1, 0 )		
	}
	if (editorType = 2)	;Notepad++
	{
		CheckNPPPath()
		if ((ret := API_ShellExecute(NPPExePath ? NPPExePath : "notepad++.exe",FilePath . " -n" . lineNum)) <= 32)
		{
			Msgbox,64,Error opening file,% GetShellExecuteError(ret)
			return
		}
	}
	if (editorType = 3)	;Notepad
	{
		if ((ret := API_ShellExecute("notepad.exe",FilePath)) <= 32)
		{
			Msgbox,64,Error opening file,% GetShellExecuteError(ret)
			return
		}
		WinWaitActive,ahk_class Notepad
		npHwnd := WinExist()
		ControlGet,editHwnd,Hwnd,,Edit1,ahk_id %npHwnd%
		crs := SendMessage( editHwnd, EM_LINEINDEX := 0x00BB, lineNum-1, 0 )
		line_len := SendMessage( editHwnd, EM_LINELENGTH := 0x00C1, crs, 0 )
		SendMessage( editHwnd, EM_SETSEL := 0x00B1, crs, crs+line_len )
		SendMessage( editHwnd, EM_LINESCROLL  := 0x00B6, 0, lineNum-5 )		
	}
	if (editorType = 4)	;Wing IDE
	{
		ppath := "D:\Wing IDE 6\bin\wing.exe"
		if ((ret := API_ShellExecute(ppath,FilePath ":" lineNum " --reuse" )) <= 32)
		{
			Msgbox,64,Error opening file,% GetShellExecuteError(ret)
			return
		}
	}
	return
}