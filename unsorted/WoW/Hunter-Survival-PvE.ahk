Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, checked vEnableDPS, DPS
Gui, Add, Radio, rad checked 1 vDPSType, 1
Gui, Add, Radio, rad, 2
Gui, Show, w40 h70 Center NoActivate
return

Alternate := false
F11::
{
  Gui, Submit, NoHide
  if (Alternate)
  {
    Send {A Down}
  }
  else
  {
    Send {D Down}
  }
  if(EnableDPS = 1)
  {
    SimulateSingleTargetPriorityDPS()
    SetTimer, SingleTargetPriority, 200
  }

  SetTimer, ShortbowRotation, 250
}
Return 

F11 Up::
{
  if (Alternate)
  {
    Send {A Up}
  }
  else
  {
    Send {D Up}
  }
  Alternate := !Alternate

  SetTimer, ShortbowRotation, off
}
Return 


ShortbowRotation: 
Send 12345
Return 

GuiEscape:
GuiClose:
exitapp
return