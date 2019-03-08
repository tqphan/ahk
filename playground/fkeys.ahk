Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
GUI, FONT, S25
Gui, Add, Button, x0 y0 h40 w90, f24
Gui, Add, Button, x90 y0 h40 w90, f23
Gui, Add, Button, x180 y0 h40 w90, f22
Gui, Show, w360 h80 Center NoActivate
return

~LButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {F24 Down}
  }
  if(ctrl="Button2")
  {
    Send {F23 Down}
  }
  if(ctrl="Button3")
  {
    Send {F22 Down}
  }
}
return

~LButton Up::
{
  GetKeyState, state, F24
  if state = D
  {
    Send {F24 Up}
  }
  GetKeyState, state, F23
  if state = D
  {
    Send {F23 Up}
  }
  GetKeyState, state, F22
  if state = D
  {
    Send {F22 Up}
  }
}
return

; ~RButton::
; {
;   MouseGetPos,,,,ctrl
;   if(ctrl="Button1")
;   {
;     Send {g Down}
;   }
;   else if(ctrl="Button2")
;   {
;     Send {f Down}
;   }
;   else if(ctrl="Button5")
;   {
;     Send {e}
;   }
; }
; return

; ~RButton Up::
; {
;   GetKeyState, state, g
;   if state = D
;   {
;     Send {g Up}
;   }
;   GetKeyState, state, f
;   if state = D
;   {
;     Send {f Up}
;   }
; }
; return

guiclose:
exit:
{
  exitapp
}
return
 