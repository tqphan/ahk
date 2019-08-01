#NoEnv
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%
#Include AutoXYWH.ahk
FileEncoding, UTF-8
FileRead, OutputVar, test.html

if ErrorLevel
{
    MsgBox, 444444
    ExitApp
}
global WB
global insizemove := False
global inhibitsizemove := False
Gui, +HwndMyGuiHwnd +LastFound +AlwaysOnTop +Border +Resize +E0x08000000
Gui, Margin , 0, 0
;Gui, Add, ActiveX, vWB x0 y0 w780 h580, Shell.Explorer
Gui Add, ActiveX, vWB hwndATLWinHWND w900 h300, about:<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=Edge" />
WM_ENTERSIZEMOVE := 0x0231
WM_WINDOWPOSCHANGING := 0x0046
WM_EXITSIZEMOVE := 0x0232
WM_CAPTURECHANGED := 0x0215
OnMessage(0x0231, "WM_ENTERSIZEMOVE")
OnMessage(0x0232, "WM_EXITSIZEMOVE")
OnMessage(0x0215, "WM_CAPTURECHANGED")
;OnMessage(0x0046, "WM_WINDOWPOSCHANGING")
Gui, show, NoActivate Center
WB.silent := true
document := WB.Document
doc := WB.doc
document.open()
document.write(OutputVar)
document.close()
; WB.Navigate("about:blank")
While WB.readystate != 4 or WB.busy
    Sleep 10
ComObjConnect(document, doc_events)
;WB.Navigate("file:///A:/ahk/playground/test.html")
;WB.Document.Write(OutputVar)
;WB.Refresh()
return

WM_ENTERSIZEMOVE(wParam, lParam)
{
    insizemove := True
    inhibitsizemove := False
    ;ToolTip, %insizemove%, 0, 0
}

WM_EXITSIZEMOVE(wParam, lParam)
{
    insizemove := False
    inhibitsizemove := False
    ;ToolTip, %insizemove%, 0, 0
}

WM_CAPTURECHANGED(wParam, lParam)
{
    inhibitsizemove := insizemove
}

WM_WINDOWPOSCHANGING(wParam, lParam, msg, hwnd)
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

Class doc_events
{
	; ondblclick(doc) {
	; 	doc.parentWindow.event.preventDefault()
    ;     ToolTip, tn, 0, 0
	; }
	oncontextmenu(doc) {
		doc.parentWindow.event.preventDefault()
	}

    OnMouseDown(doc) {
        bt := doc.parentWindow.event.button
        id := doc.parentWindow.event.target.id
        cn := doc.parentWindow.event.target.className
        c := "def"
        abc := doc.parentWindow.event.target.classList.contains(c)
        at := doc.parentWindow.event.target.getAttribute("data-vk")
        tn := doc.parentWindow.event.target.tagName
        ToolTip, bt: %bt%`n id: %id%`ncn: %cn%`nvk: %at%`ntn: %tn%`nabc: %abc%`nh: %MyGuiHwnd%, 0, 0
    }
    ; OnMouseUp(doc) {
    ;     tn := doc.parentWindow.event.target.tagName
    ;     ToolTip, tn: %tn%, 0, 0

    ; }

	OnClick(doc) {
        ; id := doc.parentWindow.event.target.id
        ; cn := doc.parentWindow.event.target.className
        ; c := "def"
        ; abc := doc.parentWindow.event.target.classList.contains(c)
        ; at := doc.parentWindow.event.target.getAttribute("data-vk")
        ; tn := doc.parentWindow.event.target.tagName
        ; ToolTip, id: %id%`ncn: %cn%`nvk: %at%`ntn: %tn%`nabc: %abc%`nh: %MyGuiHwnd%, 0, 0
        ;MsgBox, Right click disabled.
	    ; if doc.parentWindow.event.srcElement.name in username,password
	    ; 	doc.parentWindow.event.srcElement.value := doc.parentWindow.event.srcElement.name
	}
}

Doc_OnMouseUp(doc) {
    ;MsgBox, % doc.parentWindow.event.target.className
}

Doc_OnMouseDown(doc) {
    ;PostMessage, 0xA1, 2,,,A
    ;MsgBox % doc.getElementById("foo").getAttribute("data-vk")
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

   ;// if there is a resize event lets resize the browser
;    WinMove, % "ahk_id " . ATLWinHWND, , 0,0, A_GuiWidth, A_GuiHeight
	AutoXYWH("wh", "WB")
return

GuiClose:
ExitApp
