#Persistent
#SingleInstance Force
SetBatchlines -1
#Include Rectangle.ahk
#Include HotkeyOutputMode.ahk
#Include HotkeyOutput.ahk

topko := new HotkeyOutput
topko.AddKeysArray({keys: ["7"], mode: HotkeyOutputMode.HOM_SINGLE_ACTIVATE})

leftko := new HotkeyOutput
leftko.AddKeysArray({keys: ["8"], mode: HotkeyOutputMode.HOM_SINGLE_ACTIVATE})

bottomko := new HotkeyOutput
bottomko.AddKeysArray({keys: ["9"], mode: HotkeyOutputMode.HOM_SINGLE_ACTIVATE})

rightko := new HotkeyOutput
rightko.AddKeysArray({keys: ["0"], mode: HotkeyOutputMode.HOM_SINGLE_ACTIVATE})

topRect := new Rectangle(0,0,1920,2)
leftRect := new Rectangle(0,0,2,1080)
bottomRect := new Rectangle(0,1080,1920,2)
rightRect := new Rectangle(1920,0,2,1080)
global rects := {topRect: topko, leftRect: leftko, bottomRect: bottomko, rightRect: rightko}
OnExit, UnHook

; http://msdn.microsoft.com/en-us/library/windows/desktop/ms644990.aspx , WH_MOUSE_LL

hHookMouse := DllCall("SetWindowsHookEx", "int", 14, "Uint", RegisterCallback("Mouse", "Fast"), "Uint", 0, "Uint", 0)
Return

UnHook:
DllCall("UnhookWindowsHookEx", "Uint", hHookMouse)
ExitApp

Mouse(nCode, wParam, lParam)
{
	Critical
	point := new Point2D(NumGet(lParam+0, 0, "int"), NumGet(lParam+0, 4, "int"))
	
	For key, value in rects
	{
		k := %key%
		;v := %value%
		if(k.intersect(point))
			value.Activate(1)
		else
			value.Deactivate()
	}
	Return DllCall("CallNextHookEx", "Uint", 0, "int", nCode, "Uint", wParam, "Uint", lParam)
}

Esc::
ExitApp