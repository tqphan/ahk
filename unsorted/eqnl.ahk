Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
;Gui, Add, Button, vbuttonHunker x0 y0 h40 w90, Hunker
Gui, Add, Button, vbuttonZoom x0 y0 h40 w120, Zoom
Gui, Add, Button, vbuttonElevation x120 y0 h40 w120, Elevation
Gui, Add, Button, vbuttonOverwatch x240 y0 h40 w120, Overwatch

Gui, Show, w360 h40 Center NoActivate
return


~LButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    ;Send {g Down}
  }
  else if(ctrl="Button2")
  {
    ;Send {c Down}
  }
  else if(ctrl="Button3")
  {
    ;Send {y}
    ;Send {Tab}
  }
}
return

~LButton Up::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {LShift Down}
    Loop 5
    {
      ;Sleep 100
      Send {WheelUp}
    }
    Sleep 100
    Send {LShift Up}
  }
  else if(ctrl="Button2")
  {
    Loop 1
    {
      Send {WheelUp}
    }
  }
}
return

~RButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    ;Send {t Down}
  }
  else if(ctrl="Button2")
  {
    ;Send {f Down}
  }

}
return

~RButton Up::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {LShift Down}
    Loop 5
    {
      ;Sleep 100
      Send {WheelDown}
    }
    Sleep 100
    Send {LShift Up}
  }
  else if(ctrl="Button2")
  {
    Loop 1
    {
      Send {WheelDown}
    }
  }
}
return

guiclose:
exit:
{
  exitapp
}
return
 