;################ ABOUT #########################
ABOUT()
{	
	static about_ok_button
	If IsWindow( qcGui[ "about" ] )
	{
		WinActivate,% "ahk_id " qcGui[ "about" ]
		return
	}
	Gui, 6:Default
	QCSetGuiFont( 6 )
	Gui, +Owner1
	Gui, 1:+Disabled
	Gui, -SysMenu +hwndhAboutGUI
	qcGui[ "about" ] := hAboutGUI
	if qcOpt[ "gen_noTheme" ]
		Gui,-Theme
	
	pGDIToken := Gdip_Startup()
	Gui, Add, Picture, x1 y1 w367 h61 0xE hwndhdrHWND
	GdipHeader( hdrHWND, 0xff283199, glb[ "appName" ] " v" glb[ "ver" ] )
	Gdip_Shutdown(pGDIToken)
	qcver := "v" glb[ "ver" ] " " glb[ "qcArch" ]
	qcweb := glb[ "urlQCHome" ]
	aphome := glb[ "urlApathyHome" ]
	appname := glb[ "appName" ]
	ahk_ver := A_IsCompiled ? "" : "( ahk " A_AhkVersion " )"
	Gui,Add,text,xm+10 y+10,Freedom to the mules!
	Gui,Add,text,xm+10 y+10,© 2019 by Apathy Softworks. All rights reserved.
	Gui, Add, Button, x132 y+10 w100 h30 gcloseaboutbox vabout_ok_button, Ok
	GuiControl,Focus,about_ok_button
	WinGetPos, X, Y, W, H,% "AHK_ID " qcGui[ "main" ]
	pos := "x" . round(x+w/2-184) . " y" . round(y+h/2-230) . " w369"
	Gui, Show,% pos,% "About " glb[ "appName" ]
	Return
	
	closeaboutbox:
		Gui, 1:-Disabled
		Gui, Destroy
		WinActivate,% "ahk_id " qcGui[ "main" ]
		return
}

/*
centaur
century
chiller
*/

GdipHeader(hwnd, Background=0x00000000, Text="", TextOptions="x0p y15p s50p Center cffffffff r5 Bold", Font="Times New Roman")
{
	ControlGetPos,,,picW, picH,,ahk_id %hwnd%
	pBrushBack := Gdip_BrushCreateSolid(Background)
	pBitmap := Gdip_CreateBitmap(picW, picH)
	G := Gdip_GraphicsFromImage(pBitmap)
	Gdip_SetSmoothingMode(G, 4)
	Gdip_FillRoundedRectangle(G, pBrushBack, 0, 0, picW, picH,10)
	Gdip_TextToGraphics(G, Text, TextOptions, Font, picW, picH)
	hBitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
	SetImage(hwnd, hBitmap)
	Gdip_DeleteBrush(pBrushBack)
	Gdip_DeleteGraphics(G)
	Gdip_DisposeImage(pBitmap)
	DeleteObject(hBitmap)
	Return
}
