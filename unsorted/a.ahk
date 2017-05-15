Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
GUI, FONT, S25
Gui, Add, Button, vbuttonZoom x0 y0 h40 w90, 🔍
Gui, Add, Button, vbuttonElevation x90 y0 h40 w90, ⇑⇓
Gui, Add, Button, vbuttonOverwatch x180 y0 h40 w90, ಠ_ಠ
Gui, Add, Button, vbuttonHunker x270 y0 h40 w90, ⛊

Gui, Add, Button, vbuttonRotateLeft x0 y40 h40 w90, ↩↪
Gui, Add, Button, vbuttonRotateRight x90 y40 h40 w90, ⇐⇒
Gui, Add, Button, vbuttonReload x180 y40 h40 w90, 🔫
Gui, Add, Button, vbuttonPass x270 y40 h40 w90, ☢


global isGliding := false
Gui, Show, w360 h80 Center NoActivate
return


~LButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {NumpadAdd Down}
  }
  else if(ctrl="Button2")
  {
    Send {w Down}
  }
  else if(ctrl="Button3")
  {
    Send {f}
  }
  else if(ctrl="Button4")
  {
    Send {t Down}
  }
  else if(ctrl="Button5")
  {
    Send {q Down}
  }
  else if(ctrl="Button6")
  {
    Send {a Down}
  }
  else if(ctrl="Button7")
  {
    Send {r Down}
  }
  else if(ctrl="Button8")
  {
    if(not isGliding)
	{
	  isGliding := true
      Send {w Down}
	  sleep 500
      Send {space Down}
	  sleep 100
	  Send {space Up}
	  sleep 100
	  Send {space Down}
	}
	else
	{
	  Send {space Up}
	  Send {w Up}
	  isGliding := false
	}
  }
}
return

~LButton Up::
{
  GetKeyState, state, NumpadAdd
  if state = D
  {
    Send {NumpadAdd Up}
  }
  GetKeyState, state, q
  if state = D
  {
    Send {q Up}
  }
  GetKeyState, state, a
  if state = D
  {
    Send {a Up}
  }
  GetKeyState, state, w
  if state = D
  {
    if (not isGliding)
      Send {w Up}
  }
  GetKeyState, state, r
  if state = D
  {
    Send {r Up}
  }
  GetKeyState, state, t
  if state = D
  {
    Send {t Up}
  }
}
return

~RButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {NumpadSub Down}
  }
  else if(ctrl="Button2")
  {
    Send {s Down}
  }
  else if(ctrl="Button4")
  {
    Send {g Down}
  }
  else if(ctrl="Button5")
  {
    Send {e down}
  }
  else if(ctrl="Button6")
  {
    Send {d down}
  }
  else if(ctrl="Button7")
  {
    Send {f down}
  }
}
return

~RButton Up::
{
  GetKeyState, state, NumpadSub
  if state = D
  {
    Send {NumpadSub Up}
  }
  GetKeyState, state, s
  if state = D
  {
    Send {s Up}
  }
  GetKeyState, state, e
  if state = D
  {
    Send {e Up}
  }
  GetKeyState, state, d
  if state = D
  {
    Send {d Up}
  }
  GetKeyState, state, f
  if state = D
  {
    Send {f Up}
  }
  GetKeyState, state, g
  if state = D
  {
    Send {g Up}
  }
}
return

guiclose:
exit:
{
  exitapp
}
return
 