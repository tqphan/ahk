#NoEnv
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%
#Include AutoXYWH.ahk
FileEncoding, UTF-8
FileRead, OutputVar, scanner.html

if ErrorLevel
{
    MsgBox, 444444
    ExitApp
}

global insizemove := False
global inhibitsizemove := False
Gui, +HwndMyGuiHwnd +LastFound +AlwaysOnTop +Border +Resize -MaximizeBox +E0x08000000
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
OnMessage(0x0046, "WM_WINDOWPOSCHANGING")
Gui, show, NoActivate Center
WB.silent := true
document := WB.Document
; doc := WB.doc
document.open()
document.write(OutputVar)
document.close()
; WB.Navigate("about:blank")
While WB.readystate != 4 or WB.busy
    Sleep 10
ComObjConnect(document, doc_events)

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
	; 	doc.parentWindow.event.target.classList.add("pressed")
	; }
    
	oncontextmenu(doc) {
		doc.parentWindow.event.preventDefault()
	}

    OnMouseEnter(doc) {
        ToolTip, jjj
        ; doc.parentWindow.event.target.classList.add("enter")
    }
    OnMouseLeave(doc) {
        ; doc.parentWindow.event.target.classList.remove("enter")
    }

    OnMouseDown(doc) {
        doc.parentWindow.event.target.setCapture()
		doc.parentWindow.event.target.classList.add("pressed")
    ;     bt := doc.parentWindow.event.button
    ;     id := doc.parentWindow.event.target.id
    ;     cn := doc.parentWindow.event.target.className
    ;     c := "def"
    ;     abc := doc.parentWindow.event.target.classList.contains(c)
    ;     at := doc.parentWindow.event.target.getAttribute("data-vk")
    ;     tn := doc.parentWindow.event.target.tagName
    ;     ToolTip, bt: %bt%`n id: %id%`ncn: %cn%`nvk: %at%`ntn: %tn%`nabc: %abc%`nh: %MyGuiHwnd%, 0, 0
    }

    OnMouseUp(doc) {
		doc.parentWindow.event.target.classList.remove("pressed")
        doc.parentWindow.event.target.releaseCapture()
    }

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

GuiSize:
	If (A_EventInfo = 1) ; The window has been minimized.
		Return

	AutoXYWH("wh", "WB")
return

GuiClose:
ExitApp
