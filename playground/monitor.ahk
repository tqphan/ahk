g_x := A_ScreenWidth-65

Gui, -Caption
Gui, Add, Button, gSayHello, Hello
Gui, Show, x%g_x% y10

Process, Exist
WinGet, hw_gui, ID, ahk_class AutoHotkeyGUI ahk_pid %ErrorLevel%

hw_tray := DllCall( "FindWindowEx", "uint", 0, "uint", 0, "str", "Shell_TrayWnd", "uint", 0 )

DllCall( "SetParent", "uint", hw_gui, "uint", hw_tray )
return

F12::
GuiClose:
ExitApp

SayHello:
	MsgBox, Hello, World!
return