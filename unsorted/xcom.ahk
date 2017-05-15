Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
GUI, FONT, S25
Gui, Add, Button, vbuttonZoom x0 y0 h40 w90, 🔍
Gui, Add, Button, vbuttonElevation x90 y0 h40 w90, ⇑⇓
Gui, Add, Button, vbuttonOverwatch x180 y0 h40 w90, ಠ_ಠ
Gui, Add, Button, vbuttonHunker x270 y0 h40 w90, ⛊

Gui, Add, Button, vbuttonRotateLeft x0 y40 h40 w90, ↩↪
Gui, Add, Button, vbuttonRotateRight x90 y40 h40 w90, 🚹
Gui, Add, Button, vbuttonReload x180 y40 h40 w90, 🔫
Gui, Add, Button, vbuttonPass x270 y40 h40 w90, ☢


Gui, Show, w360 h80 Center NoActivate
return

F9::
{
  Send {Tab down}
  Sleep 50
  Send {Tab up}
}
return

F10::
{
  Send {q}
}
return

F11::
{
  Send {e}
}
return

F6::
{
  Loop, 21
  {
    Send {Enter}
    Send {Down}
  }
}
return

~LButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {t Down}
  }
  else if(ctrl="Button2")
  {
    Send {c Down}
  }
  else if(ctrl="Button3")
  {
    Send {y}
    Send {Tab}
  }
  else if(ctrl="Button4")
  {
    Send {k}
    Send {Space}
  }
  else if(ctrl="Button5")
  {
    Send {q}
  }
  else if(ctrl="Button6")
  {
    Send {F1}
  }
  else if(ctrl="Button7")
  {
    Send {r}
    Send {Tab}
  }
  else if(ctrl="Button8")
  {
    Send {Esc}
  }
}
return

~LButton Up::
{
  GetKeyState, state, t
  if state = D
  {
    Send {t Up}
  }
  GetKeyState, state, c
  if state = D
  {
    Send {c Up}
  }
}
return

~RButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {g Down}
  }
  else if(ctrl="Button2")
  {
    Send {f Down}
  }
  else if(ctrl="Button5")
  {
    Send {e}
  }
}
return

~RButton Up::
{
  GetKeyState, state, g
  if state = D
  {
    Send {g Up}
  }
  GetKeyState, state, f
  if state = D
  {
    Send {f Up}
  }
}
return

guiclose:
exit:
{
  exitapp
}
return
 