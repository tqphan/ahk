#NoEnv
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%
#Include AutoXYWH.ahk

FileRead, OutputVar, default.keyboard.html

if ErrorLevel
{
    MsgBox, 444444
}
global WB
global insizemove := False
global inhibitsizemove := False
Gui, +LastFound +AlwaysOnTop +Border +Resize +E0x08000000
Gui, Margin , 0, 0
;Gui, Add, ActiveX, vWB x0 y0 w780 h580, Shell.Explorer
Gui Add, ActiveX, vWB w800 h600, about:<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=Edge" />
WM_ENTERSIZEMOVE := 0x0231
WM_WINDOWPOSCHANGING := 0x0046
WM_EXITSIZEMOVE := 0x0232
WM_CAPTURECHANGED := 0x0215
OnMessage(WM_ENTERSIZEMOVE, "ENSM")
OnMessage(WM_EXITSIZEMOVE, "EXSM")
OnMessage(WM_CAPTURECHANGED, "CC")
;OnMessage(WM_WINDOWPOSCHANGING, "WPC")
Gui, show, Center
document := WB.Document
document.open()
document.write(OutputVar)
document.close()
; WB.Navigate("about:blank")
Loop
    Sleep 10
Until (WB.readyState=4 && WB.document.readyState="complete" && !WB.busy)
ComObjConnect(document, "Doc_")
;WB.Navigate("file:///A:/ahk/playground/test.html")
;WB.Document.Write(OutputVar)
;WB.Refresh()
return

ENSM(wParam, lParam)
{
    insizemove := True
    inhibitsizemove := False
    ;ToolTip, %insizemove%, 0, 0
}

EXSM(wParam, lParam)
{
    insizemove := False
    inhibitsizemove := False
    ;ToolTip, %insizemove%, 0, 0
}

CC(wParam, lParam)
{
    inhibitsizemove := insizemove
}
WPC(wParam, lParam, msg, hwnd)
{
    if inhibitsizemove
    {
        Static SWP_NOMOVE := 2
        Static SWP_NOSIZE := 1
        Static OffFlags := A_PtrSize + A_PtrSize + 16 ; 24 (AHK x86) | 32 (AHK x64)
        NumPut(NumGet(lParam + OffFlags, "UInt") | SWP_NOMOVE, lParam + OffFlags, "UInt")
        Return 0
    }

}
Doc_OnMouseUp(doc) {
    ;MsgBox, % doc.parentWindow.event.target.className
}
Doc_OnMouseDown(doc) {
    ;PostMessage, 0xA1, 2,,,A
    MsgBox % doc.getElementById("foo").dataset
}
Test(bb)
{
    v := 4
    hw := "toggle('foo')"
    WB.document.parentwindow.execScript(hw)
}

F3::
{
    Test(twb)

}

GuiSize:
	If (A_EventInfo = 1) ; The window has been minimized.
		Return
	AutoXYWH("wh", "WB")
return

GuiClose:
ExitApp
