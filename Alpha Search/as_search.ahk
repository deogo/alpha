DoJob( mode )
{
	global LVResults, job_in_progress, JobProgressBar
	global CBptrns, CBhw, PBhandle
	global RegEx, MatchCase,CheckFilenames
	Gui,1:Default
	search_string := GuiControlGet("SchStr")
	replace_string := GuiControlGet("ReplaceED")
	GUi,ListView,LVResults
	if (mode ~= "replace")
	{
		LV_ModifyCol(3,"40 Integer","#!")
		LV_ModifyCol(4,300,"New Line" ( mode = "replace_preview" ? " (preview)" : "" ))
		LV_ModifyCol(5,300,"Old Line")
	}
	else
	{
		LV_ModifyCol(3,"300 Text Left","Line")
		LV_ModifyCol(4,0)
		LV_ModifyCol(5,0)
	}
	GuiControl, +Hdr, LVResults
	Gui,Submit,NoHide							;getting controls values
	StringCaseSense,% MatchCase ? "On" : "Off"
	if (search_string = "")							;if empty query
	{
		Tooltip % "Error! Empty search query!"
		SetTimer,DTP,-1500		
		return
	}
	ControlGetText, CurPattern,, ahk_id %CBptrns%		;getting current pattern
	if CurPattern										
		CheckCBList(CBptrns,CurPattern)
	else
	{
		Tooltip % "Please specify at least one pattern!"
		SetTimer,DTP,-1500
		return
	}
	ControlGetText, SrchDir,, ahk_id %CBhw%		;getting search directory
	if SrchDir									;if SrchDir empty - consider relative searching
	{
		IfNotExist,% SrchDir
			return
		CheckCBList(CBhw,SrchDir)
		SrchDir .= "\"
	}
	;Start searching
	LV_Delete()
	GuiControlSet("DoJobButton","Stop")
	GuiControlSet("ResText"," ")
	job_in_progress := 1							;indicates that job in progress
	StringSplit,ptrn,CurPattern,`,,%A_Space%%A_Tab%	;getting all entered patterns
	;determining amount of files to track progress properly
	cnt =
	loop,%ptrn0%
		Loop,% SrchDir . ptrn%A_Index%,0,1
			cnt++
	
	if CheckFilenames
	{
		Loop,% SrchDir . "*",0,1
		{
			rel_path := StrReplace(A_LoopFileFullPath, SrchDir, "") ;making relative path out of full
			if RegEx
			{
				try
				{
					if RegExMatch(A_LoopFileName,(MatchCase ? "" : "i)") . search_string)
					{
						if (mode ~= "replace")
							LV_Add("",rel_path,0,0,A_LoopFileName )
						else
							LV_Add("",rel_path,0,A_LoopFileName )
					}
				}
				catch e
				{
					if (mode ~= "replace")
						LV_Add("",rel_path,0,0,"RegEx error: " e.message " " e.extra,A_LoopFileName )
					else
						LV_Add("",rel_path,0,"RegEx error: " e.message " " e.extra )
					Goto,StopSearch
				}
			}
			else
			{
				if instr(A_LoopFileName ,search_string,MatchCase)
				{
					if (mode ~= "replace")
						LV_Add("",rel_path,0,0,A_LoopFileName )
					else
						LV_Add("",rel_path,0,A_LoopFileName )
				}
			}
		}
	}
	SendMessage( PBhandle, PBM_SETRANGE32 := 0x400 + 6, 0, cnt )	;set range for progress bar control
	GuiControl,,JobProgressBar, 0								;reset progress bar to 0
	start_time := A_TickCount
	loop,%ptrn0%
		Loop,% SrchDir . ptrn%A_Index%,0,1
		{
			if !job_in_progress
				Goto,StopSearch
			files_cnt++
			GuiControl,,JobProgressBar,% files_cnt
			f_path := A_LoopFileFullPath
			rel_path := StrReplace(f_path, SrchDir, "") ;making relative path out of full
			f := FileOpen(f_path,"r")
			if !IsObject(f)
			{
				LV_Add("",f_path,"","Couldn't open file!")
				continue
			}
			encoding := f.encoding
			is_bom := f.pos != 0
			out_encoding := encoding ~= "UTF-8|UTF-16" && is_bom ? encoding
										: encoding ~= "UTF-8|UTF-16" && !is_bom ? encoding "-RAW"
										: encoding
			file_content := f.Read()
			f.Close()
			if file_content
			{
				if (mode = "replace")
				{
					replacements_made := false
					temp_path := A_LoopFileFullPath ".temp"
					while FileExist(temp_path)
						temp_path := A_LoopFileFullPath ".temp" A_Index
					file_out := FileOpen(temp_path,"w",out_encoding)
					if !IsObject(file_out)
					{
						LV_Add("",temp_path,"","Couldn't open file!")
						continue
					}
				}
				Loop,Parse,file_content,`n
				{
					lines_cnt++
					if !job_in_progress
						Goto,StopSearch
					if (A_LoopField = "") ; current line
						continue
					print_line := Trim(A_LoopField)
					if (print_line = "")
						continue
					if RegEx
					{
						try
						{
							if (mode ~= "replace")
							{
								new_str := RegExReplace(A_LoopField, (MatchCase ? "" : "i)") . search_string, replace_string, repl_cnt)
								if repl_cnt
								{
									replacements_made := true
									LV_Add("",rel_path,A_Index,repl_cnt,new_str,print_line )
								}
								if (mode = "replace")
									file_out.WriteLine(repl_cnt ? new_str : A_LoopField)
							}
							else if RegExMatch(A_LoopField  ,(MatchCase ? "" : "i)") . search_string)
								LV_Add("",rel_path,A_Index,print_line )
						}
						catch e
						{
							LV_Add("",rel_path,A_Index,"RegEx error: " e.message " " e.extra )
							Goto,StopSearch
						}
					}
					else
					{
						if (mode ~= "replace")
						{
							new_str := StrReplace(A_LoopField, search_string, replace_string, repl_cnt)
							if repl_cnt
							{
								replacements_made := true
								LV_Add("",rel_path,A_Index,repl_cnt,new_str,print_line )
							}
							if (mode = "replace")
								file_out.WriteLine(repl_cnt ? new_str : A_LoopField)
						}
						else if instr(A_LoopField ,search_string,MatchCase)
						{
							LV_Add("",rel_path,A_Index,print_line)
						}
					}
				}
			}
			if (mode = "replace")
			{
				file_out.close()
				if replacements_made
				{
					n := 0
					while (++n < 20)
					{
						try
						{
							FileMove,% temp_path,% f_path, 1
							break
						}
						sleep 50
					}
					if (n=20)
						msgbox % "Fail moving file " temp_path " to " f_path
				}
				else
				{
					try
						FileDelete,% temp_path
					catch e
						msgbox % "Error deleting file " temp_path ": " e.message " " e.extra
				}
			}
		}
StopSearch:
	if (mode = "replace" && IsObject(file_out))
	{
		file_out.close()
		FileDelete,% temp_path
	}
	time_dif := Round((A_TickCount - start_time)/1000,3)
	if LV_GetCount()
	{
		LV_ModifyCol(2)
		LV_ModifyCol(3)
		if (mode ~= "replace")
		{
			LV_ModifyCol(4,300)
			LV_ModifyCol(5)
		}			
	}
	GuiControlSet("ResText","Found lines: " LV_GetCount() "`t`tFiles Searched: " files_cnt "`tLines Count: " lines_cnt "`tSearch Time: " time_dif)
	GuiControlSet("DoJobButton","Start!")
	job_in_progress := 0
	return
}