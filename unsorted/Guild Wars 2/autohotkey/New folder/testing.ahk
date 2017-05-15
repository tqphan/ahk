Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, checked vStrafe, Strafe
;Gui, Add, Checkbox, checked vHeal, Auto Healing 
Gui, Add, Radio, rad checked 1 vAction, Attack (Single)
Gui, Add, Radio, rad, Attack (AoE)
Gui, Add, Radio, rad, Jump

Gui, Add, DropDownList, vClassChoice, Archer|Barb|
Gui, Show, w200 h100 Center NoActivate
return

Alternate := false
F9::
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

  if(Action = 1)
  {
    if(ClassChoice = "Archer")
    {
        SetTimer, ArcherAttack, 250
    }
    else if(ClassChoice = "Bow")
    {
      SetTimer, BowAttack, 250
    }
  }
  else if(Action = 2)
  {
    Send {Space}
  }
  else if(Action = 3)
  {
    Send {Space}
  }
}
Return 

F9 Up::
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
  
  SetTimer, ArcherAttack, off
  SetTimer, BowAttack, off
}
Return 

F10::
{
  if(Action = 1)
  {
    SimulateInterupt()
    SetTimer, Interupt, 100
  }
  else if(Action = 2)
  {
    Send {Space}
  }
  else if(Action = 3)
  {
    Send {Space}
  }
}
return

F10 Up::
{
  if(Action = 1)
  {
  }
  else if(Action = 2)
  {
  }
  else if(Action = 3)
  {
  }
  SetTimer, Interupt, off
}
return

ArcherAttack: 
SimulateArcherAttack()
return

SimulateArcherAttack()
{
  Send 123
}
return

BowAttack: 
SimulateBowAttack()
return

SimulateBowAttack()
{
  Send 5214
}
return

Interupt: 
SimulateInterupt()
return

SimulateInterupt()
{
  Send 5
}
return
GuiEscape:
GuiClose:
exitapp
return