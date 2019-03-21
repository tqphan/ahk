Gui +LastFound 
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,Hwnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return

ShellMessage( wParam,lParam )
{
 WinGetTitle, title, ahk_id %lParam%
 If (wParam=4 or wParam=32772) { ;HSHELL_WINDOWACTIVATED
  ToolTip WinActivated`n%Title%
 }
}