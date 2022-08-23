Gui_Main()
{
	global
	
	Menu, AboutMenu, Add, I need some Help, fakesub
	Menu, AboutMenu, Add
	Menu, AboutMenu, Add, Check for Update..., fakesub
	Menu, AboutMenu, Add
	Menu, AboutMenu, Add, About, fakesub
	
	Menu, SettingsMenu, Add, &Options.., fakesub
	Menu, SettingsMenu, Add
	Menu, SettingsMenu, Add, &Presets, fakesub
	
	Menu, LineContextMenu, Add, Open File Location, fakesub
	Menu, LineContextMenu, Add, File Context Menu.., fakesub
	Menu, LineContextMenu, Add, Copy, CopyListContent
	
	Menu, GuiMenuBar, Add, &Settings, :SettingsMenu
	Menu, GuiMenuBar, Add, &About, :AboutMenu
	Gui, Menu, GuiMenuBar
	
	Gui,Add,Text,,Directory :
	Gui,Add,ComboBox,% "x+5 hwndCBhw Section vSearchDir w" . (def_width-105)
	Gui,Add,Button,x+5 w30 yp gSelectDir,...
	Gui,Add,Text,xm,Patterns :
	Gui,Add,ComboBox,% "xs yp hwndCBptrns vPatterns w" (def_width-105)
	ControlSetText,,% def_pattern, ahk_id %CBptrns%
	Gui,Add,Text,xm y+15,Search :
	Gui,Add,ComboBox,% "xs yp vSchStr -WantReturn w" (def_width-105)
	Gui,Add,Button,x+5 w22 yp +0x00000040 gExpandSrhBT
	Gui,Add,Text,xm, Replace :
	Gui,Add,ComboBox,% "xs yp vReplaceED -WantReturn w" (def_width-105)
	Gui,Add,Button,x+5 w22 yp +0x00000040
	
	Gui,Add,Progress,% "xm h20 vJobProgressBar hwndPBhandle -Smooth w"  . (def_width-20),0
	Gui,Add,Radio,Group xm y+10 vRadioJobMode Checked, Search
	Gui,Add,Radio,x+5 yp, Replace
	Gui,Add,Radio,x+5 yp, Replace Preview
	
	Gui,Add,Button,xm w100 y+10 gDoJob vDoJobButton Default, Start!
	
	Gui,Add,CheckBox,xm vRegEx,RegEx
	Gui,Add,CheckBox,x+15 yp vMatchCase,MatchCase
	Gui,Add,CheckBox,x+15 yp vCheckFilenames,Search in filenames
	Gui,Add,Text,vEditorTypeLbl x+230 yp,Open in
	Gui,Add,DropDownList,x+5 yp-3 w120 vEditorTypeSW AltSubmit Choose3 gEditorTypeChanged,Scite4Autohotkey|Notepad++|Notepad|WingIDE


	Gui,Add,ListView,xm vLVResults w%def_width% r15 gLVEvents hwndLV_Handle AltSubmit -Hdr,File|#|col3|col4|col5
	Gui,Add,Text,vResText xm w%def_width%
	Gui, Add, ListView,% "vPresetsLV ys w150 h145 AltSubmit x" (def_width ), Presets
	
	Gui, ListView, PresetsLV
	LV_ModifyCol(1,"AutoHdr")
	Gui, ListView, LVResults
	LV_ModifyCol(1,100)
	LV_ModifyCol(2,"40 Integer")
	GetCFG()
	GuiControl,Focus,SchStr
	Gui,+Resize MinSize575x400
	Gui,Show,,Alpha Search
	return
	
	CopyListContent:
		Gui, ListView,% LV_Handle
		text_out := ""
		Loop,% LV_GetCount()
		{
			row_num := A_Index
			loop,3
			{
				LV_GetText( tt, row_num, A_Index )
				text_out .= tt "`t"
			}
			StringTrimRight,text_out,text_out,1
			text_out .= "`n"
		}
		clipboard := text_out
		return
	
	ExpandSrhBT:
		ExpandSrh()
		return
	
	fakesub:
		return
	
	EditorTypeChanged:
		value := GuiControlGet("EditorTypeSW")
		if (value = 1)	;scite
			CheckScitePath()
		if (value = 2)	;notepad++
			CheckNPPPath()
		return

	GuiSize:
		GuiResize(A_GuiWidth,A_GuiHeight)
		return

	SelectDir:
		Gui,+OwnDialogs
		BF := ComObjCreate("Shell.Application")
		if !IsObject(BF)
			msgbox % "Oh No!`nSomething wrong with that object!"
		Gui,+LastFoundExist
		hw := WinExist()
		fol := BF.BrowseForFolder(ComObjParameter(A_PtrSize = 4 ? 0x13 : 0x15, hw),"Select folder for search",0x00000040 | 0x00000010 | 0x00000080 | 0x00008000) ;BIF_NEWDIALOGSTYLE | BIF_EDITBOX | BIF_BROWSEINCLUDEURLS | BIF_SHAREABLE
		if IsObject(fol)
			ControlSetText,,% fol.Self.Path, ahk_id %CBhw%
		fol =
		return
	
	LineContextOpen:
		Menu, LineContextMenu, Show
		return
	
	LVEvents:
		GUi,ListView,LVResults
		if (A_GuiEvent = "DoubleClick")
		{
			LV_GetText(lineNum,LV_GetNext(),2)
			LV_GetText(FilePath,LV_GetNext(),1)
			ControlGetText, current_dir,, ahk_id %CBhw%
			FilePath = %current_dir%\%FilePath%
			FilePath := API_PathQualify(FilePath)
			FilePath = "%FilePath%"
			EditorType := GuiControlGet("EditorTypeSW")
			OpenLine(FilePath,lineNum,EditorType)
		}
		else If (A_GuiEvent = "K")
		{
			If GetKeyState("Del", "P")
			{
				if (LV_GetCount() = LV_GetNext())
					sLine := lineNum-1
				else
					sLine := lineNum
				LV_Delete(LV_GetNext())
				LV_Modify(sLine,"Select")
			}
		}
		else if (A_GuiEvent = "ColClick")
			LV_SortArrow(LV_Handle, A_EventInfo)
		else if (A_GuiEvent = "RightClick")
			if LV_GetNext()
				SetTimer, LineContextOpen, -1
		return

	DoJob:
		if job_in_progress
		{
			GuiControlSet("DoJobButton","Start!", "", 1)
			job_in_progress := 0
			GuiControl,,JobProgressBar, 0
			return
		}
		Gui,Submit,NoHide
		SetTimer,JobSub,-1
		return
	JobSub:
		DoJob(RadioJobMode = 1 ? "search" 
		: RadioJobMode = 2 ? "replace" 
		: RadioJobMode = 3 ? "replace_preview" 
		: "unknown")
		return
		
	GuiEscape:
	GuiClose:
		Gui,Submit
		GoSub,JExit
		return
}

GuiResize(w,h)
{
	work_width := w-20
	GuiControlSet("LVResults|ResText","","w" . work_width,1,0 )
	GuiControlSet("LVResults","","h" . h-255,1,0 )
	GuiControlSet("ResText","","y" . h-15,1,0)
	return
}