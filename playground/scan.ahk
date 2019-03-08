Arr := [["a","b","c"],["d","e","f"],["g","h","i"]]
; MsgBox % Arr.1.1 "`n" Arr.2.1 "`n" Arr.3.1
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Color, EEAA99, FFFFFF
gui, add, Button, section vTest, First Name:
GuiControl +BackgroundFF9977, Test
; Loop, 3
; {
;     Gui, Add, Button, w50 h50 ys, %A_Index%
; }

Gui, Show, w360 h80 Center NoActivate
return


guiclose:
exit:
{
  exitapp
}
return
 