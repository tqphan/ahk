Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, checked vStrafe, Strafe
Gui, Add, Checkbox, checked vCharge, Charge
Gui, Add, Radio, rad checked 1 vDPSType, 1
Gui, Add, Radio, rad, 2
Gui, Show, w60 h100 Center NoActivate

SetTimer, AutoRun, 100

return
AutoRun := true
Alternate := false
F24::
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

F24 Up::
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
  Send i
}

SimulateDualTargetPriorityDPS()
{
  Send z12t5q
}

SimulateSingleTargetPriorityDPS(Strafe, Charge)
{

  if(Charge = 1)
  {
    Send 1
  }
    Send 234567
}

CursorCheck(AutoRunEnable)
{
  static IsNumlockDown := false
  if(AutoRunEnable = 1)
  {
    MouseGetPos, xpos, ypos
    if (ypos = 0)
    {
      if (IsNumlockDown = false)
      {
        Send {NumLock down}
        IsNumlockDown := true
      }
    }
    else 
    {
      if (IsNumlockDown = true)
      {
        Send {NumLock up}
        IsNumlockDown := false 
      }
    }
  }
}
return

AutoRun: 
CursorCheck(AutoRun)
return 

GuiEscape:
GuiClose:
exitapp
return