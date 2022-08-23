#NoEnv
#Include, 2.ahk
 
; =================================
;        界面
; =================================
Gui, +HwndHGUI +AlwaysOnTop
Gui, Add, Edit, w300 HwndHEdit1, 
Gui, Add, Edit, w300 HwndHEdit2, 这里不接受拖拽
Gui, Add, Edit, w300 HwndHEdit3, 
Gui, Show,, 拖拽高亮
 
GuiDropFiles.config(HGUI, "GuiDropFiles_Begin", "GuiDropFiles_End")
Return
 
; =================================
;        开始拖拽
; =================================
GuiDropFiles_Begin:
    CoverControl(HEdit1 "," HEdit3)
Return
 
; =================================
;        拖拽结束
; =================================
GuiDropFiles_End:
    CoverControl()
 
    If GuiDropFiles_FileName {
        MouseGetPos,,,, hwnd, 2
        If hwnd in %HEdit1%,%HEdit3%
            GuiControl,, %hwnd%, % GuiDropFiles_FileName
    }
Return
 
; =================================
;        退出
; =================================
GuiClose:
ExitApp
 
; ===============================================================================================
CoverControl(hwnd_CsvList = "") {
    static handler := {__New: "test"}
    static _ := new handler
    static HGUI2
    If !HGUI2 {
        Gui, New, +LastFound +hwndHGUI2 -Caption +E0x20 +ToolWindow +AlwaysOnTop
        Gui, Color, 00FF00
        Gui, 1:Default
        WinSet, Transparent, 50
    }
 
    If (hwnd_CsvList = "") {
        Gui, %HGUI2%:Cancel
        Return
    }
 
    static lastHwnd
 
    MouseGetPos,,,, hwnd, 2
 
    If hwnd not in %hwnd_CsvList%
    {
        Gui, %HGUI2%:Cancel
        lastHwnd := ""
        Return
    }
    If (hwnd = lastHwnd)
        Return
 
    WinGetPos, x, y, w, h, ahk_id %hwnd%
    Gui, %HGUI2%:Show, X%x% Y%y% w%w% h%h% NA
 
    lastHwnd := hwnd
}