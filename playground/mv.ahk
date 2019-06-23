Gui, +HwndMyGuiHwnd +LastFound +AlwaysOnTop +Border +Resize +E0x08000000
Gui, Margin , 0, 0
global insizemove := False
global inhibitsizemove := False
; WM_ENTERSIZEMOVE := 0x0231
; WM_WINDOWPOSCHANGING := 0x0046
; WM_EXITSIZEMOVE := 0x0232
; WM_CAPTURECHANGED := 0x0215

OnMessage(0x0200, "WM_MOUSEMOVE" ) 
OnMessage(0x0231, "WM_ENTERSIZEMOVE")
OnMessage(0x0232, "WM_EXITSIZEMOVE")
OnMessage(0x0215, "WM_CAPTURECHANGED")
OnMessage(0x0046, "WM_WINDOWPOSCHANGING")
Gui, show, w400 h400 NoActivate Center
Return

WM_MOUSEMOVE( wparam, lparam, msg, hwnd )
{
	if wparam = 1 ; LButton
		PostMessage, 0xA1, 2,,,ahk_id %hwnd%   ; WM_NCLBUTTONDOWN
}

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
        NumPut(NumGet(lParam + OffFlags, "UInt") | SWP_NOSIZE|SWP_NOMOVE, lParam + OffFlags, "UInt")
        Return 0
    }
}
GuiClose:
ExitApp
