Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
Gui, Add, Button, vbutton x0 y0 h40 w120, Zoom
Gui, Add, Button, vbuttonElevation x120 y0 h40 w120, Rotate
Gui, Add, Button, vbuttonOverwatch x240 y0 h40 w120, Escape
Gui, Show, w360 h40 Center NoActivate
return

Alternate := false

~LButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {WheelDown}
  }
  else if(ctrl="Button2")
  {
    Send {e Down}
  }
  else if(ctrl="Button3")
  {
    Send {Esc}
  }
}
return

~LButton Up::
{
  if(GetKeyState("g","p"))
  {
    Send {g Up}
  }
  if(GetKeyState("e","p"))
  {
    Send {e Up}
  }
}
return

~RButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {WheelUp}
  }
  else if(ctrl="Button2")
  {
    Send {q Down}
  }

}
return

~RButton Up::
{
  if(GetKeyState("t","p"))
  {
    Send {t Up}
  }
  if(GetKeyState("q","p"))
  {
    Send {q Up}
  }
}
return

guiclose:
exit:
{
  exitapp
}
return

F9::
{
  send {Space down}
}
return

F9 up::
{
  send {Space up}
}
return
 

MouseWheelSimulation: 
  if (Alternate)
  {
    Send {WheelDown}
  }
  else
  {
    Send {WheelUp}
  }
Return