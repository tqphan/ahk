Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, checked vStrafe, Strafe
Gui, Add, Checkbox, checked vCharge, Charge
Gui, Add, Radio, rad checked 1 vDPSType, 1
Gui, Add, Radio, rad, 2
Gui, Show, w60 h100 Center NoActivate
return
Alternate := false
F11::
{
  Gui, Submit, NoHide

  if(Strafe = 1)
  {
    if (Alternate)
    {
      Send {a Down}
    }
    else
    {
    Send {d Down}
    }
  }

  if(DPSType = 1)
  {
    SimulateSingleTargetPriorityDPS(Strafe, Charge)
    SetTimer, SingleTargetPriority, 250
  }
  else if(DPSType = 2)
  {
    SimulateDualTargetPriorityDPS()
    SetTimer, DualTargetPriority, 200
  }

}
return 

F11 Up::
{

  if(Strafe = 1)
  {
  if (Alternate)
  {
    Send {a Up}
  }
  else
  {
    Send {d Up}
  }
  }
  Alternate := !Alternate

  SetTimer, SingleTargetPriority, off
  SetTimer, DualTargetPriority, off
}
return

F12::
{
  SetTimer, VariousThings, 200
}
return  

F12 Up::
{
  SetTimer, VariousThings, off
}
return 

VariousThings: 
SimulateInterupt()
return 

SingleTargetPriority: 
SimulateSingleTargetPriorityDPS(Move, Charge)
return

DualTargetPriority: 
SimulateDualTargetPriorityDPS()
return

SimulateInterupt()
{
  Send {Space}
}

SimulateDualTargetPriorityDPS()
{
  Send z12t5q
}

SimulateSingleTargetPriorityDPS(Strafe, Charge)
{

  Send {1}
  sleep 75
  Send {2}
  sleep 75
  Send {3}
}

GuiEscape:
GuiClose:
exitapp
return