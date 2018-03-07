#SingleInstance force
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;OnMessage replaced with a custom WndProc

hGui := WinExist()
pWndProc := RegisterCallback("WndProc", "")
;GWL_WNDPROC := -4
vSfx := (A_PtrSize=8) ? "Ptr" : ""
pWndProcOld := DllCall("SetWindowLong" vSfx, Ptr, hGui, Int,-4, Ptr, pWndProc, Ptr)

Gui, Show, w820 h80 xCenter y-90 NoActivate
return

WndProc(hWnd, uMsg, wParam, lParam)
{
	global pWndProcOld
	if (uMsg = 0x201)
	{
		result := DllCall("SetCapture", "UInt", hWnd)
		Send, {Space Down}
	}
	else if (uMsg = 0x202)
	{
		Send, {Space Up}
		result := DllCall("ReleaseCapture")
	}
	else if (uMsg = 0x204)
	{
		SetTimer, rclick1, -1
	}
	else if (uMsg = 0x205)
	{

	}
	return DllCall("CallWindowProc", Ptr, pWndProcOld, Ptr, hWnd, UInt, uMsg, UPtr, wParam, Ptr, lParam)
}
rclick1:
	Send {Space}
	Sleep, 200
	Send {Space}
	Sleep, 200
	Send {F3}
	Sleep, 200
	Send {Space}
return
GuiClose:
ExitApp
