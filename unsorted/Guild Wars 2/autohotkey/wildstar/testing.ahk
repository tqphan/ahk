Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, section checked vStrafe, Strafe
;Gui, Add, Checkbox, section checked vHeal, Heal 

Gui, Add, Radio, section checked 1 vAction, 1
Gui, Add, Radio,, 2
Gui, Add, Radio,, 3

Gui, Add, Radio, ys checked 1 vAction2 Group, 1
Gui, Add, Radio,, 2
Gui, Add, Radio,, 3

Gui, Add, Radio, ys checked 1 vAction3 Group, 1
Gui, Add, Radio,, 2
Gui, Add, Radio,, 3

Gui, Add, DropDownList, xs vClassChoice, Warrior||Esper|Spellslinger|Stalker|Medic|Engineer
Gui, Show, w140 h100 Center NoActivate
return

Alternate := false
F9::
{
  Gui, Submit, NoHide
  Send v
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

  if(ClassChoice = "Warrior")
  {
    if(Action = 1)
    {
      SetTimer, WarriorSingleAttack, 250
    }
    else if(Action = 2)
    {
      SetTimer, WarriorMultipleAttack, 250
    }
    else if(Action = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Esper")
  {
    if(Action = 1)
    {
      SetTimer, EsperSingleAttack, 250
    }
    else if(Action = 2)
    {
      SetTimer, EsperMultipleAttack, 250
    }
    else if(Action = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Spellslinger")
  {
    if(Action = 1)
    {
      SetTimer, SpellslingerSingleAttack, 250
    }
    else if(Action = 2)
    {
      SetTimer, SpellslingerMultipleAttack, 250
    }
    else if(Action = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Stalker")
  {
    if(Action = 1)
    {
      SetTimer, StalkerSingleAttack, 250
    }
    else if(Action = 2)
    {
      SetTimer, StalkerMultipleAttack, 250
    }
    else if(Action = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Medic")
  {
    if(Action = 1)
    {
      SetTimer, MedicSingleAttack, 250
    }
    else if(Action = 2)
    {
      SetTimer, MedicMultipleAttack, 250
    }
    else if(Action = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Engineer")
  {
    if(Action = 1)
    {
      SetTimer, EngineerSingleAttack, 250
    }
    else if(Action = 2)
    {
      SetTimer, EngineerMultipleAttack, 250
    }
    else if(Action = 3)
    {
      SimulateJump()
    }
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
  
  SetTimer, WarriorSingleAttack, off
  SetTimer, WarriorMultipleAttack, off
  SetTimer, EsperSingleAttack, off
  SetTimer, EsperMultipleAttack, off
  SetTimer, SpellslingerSingleAttack, off
  SetTimer, SpellslingerMultipleAttack, off
  SetTimer, StalkerSingleAttack, off
  SetTimer, StalkerMultipleAttack, off
  SetTimer, MedicSingleAttack, off
  SetTimer, MedicMultipleAttack, off
  SetTimer, EngineerSingleAttack, off
  SetTimer, EngineerMultipleAttack, off
}
Return 

F10::
{
  if(ClassChoice = "Warrior")
  {
    if(Action2 = 1)
    {
      SimulateGapCloser()
    }
    else if(Action2 = 2)
    {
      SimulateInterrupt()
    }
    else if(Action2 = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Esper")
  {
    if(Action2 = 1)
    {
      
    }
    else if(Action2 = 2)
    {
      
    }
    else if(Action2 = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Spellslinger")
  {
    if(Action2 = 1)
    {
      
    }
    else if(Action2 = 2)
    {
      
    }
    else if(Action2 = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Stalker")
  {
    if(Action2 = 1)
    {
      
    }
    else if(Action2 = 2)
    {
      
    }
    else if(Action2 = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Medic")
  {
    if(Action2 = 1)
    {
      
    }
    else if(Action2 = 2)
    {
      
    }
    else if(Action2 = 3)
    {
      SimulateJump()
    }
  }
  else if(ClassChoice = "Engineer")
  {
    if(Action2 = 1)
    {
      
    }
    else if(Action2 = 2)
    {
      
    }
    else if(Action2 = 3)
    {
      SimulateJump()
    }
  }
}
Return 

F10 Up::
{
  
}
Return 

F11::
{
  Send {LShift down}
}
Return 

F11 Up::
{
  Send {LShift up}
}
Return 

~LButton::
{
  
}
Return

~LButton Up::
{
}
Return

WarriorSingleAttack: 
SimulateWarriorSingleAttack()
return

SimulateWarriorSingleAttack()
{
  Send 21
}
return

WarriorMultipleAttack: 
SimulateWarriorMultipleAttack()
return

SimulateWarriorMultipleAttack()
{
  Send 31
}
return

EsperSingleAttack: 
SimulateEsperSingleAttack()
return

SimulateEsperSingleAttack()
{
  Send 5214
}
return

EsperMultipleAttack: 
SimulateEsperMultipleAttack()
return

SimulateEsperMultipleAttack()
{
  Send 5214
}
return

SpellslingerSingleAttack: 
SimulateSpellslingerSingleAttack()
return

SimulateSpellslingerSingleAttack()
{
  Send 415
}
return

SpellslingerMultipleAttack: 
SimulateSpellslingerMultipleAttack()
return

SimulateSpellslingerMultipleAttack()
{
  Send 415
}
return

StalkerSingleAttack: 
SimulateStalkerSingleAttack()
return

SimulateStalkerSingleAttack()
{
  Send 2351
}
return

StalkerMultipleAttack: 
SimulateStalkerMultipleAttack()
return

SimulateStalkerMultipleAttack()
{
  Send 2351
}
return

MedicSingleAttack: 
SimulateMedicSingleAttack()
return

SimulateMedicSingleAttack()
{
  Send 2431
}
return

MedicMultipleAttack: 
SimulateMedicMultipleAttack()
return

SimulateMedicMultipleAttack()
{
  Send 2431
}
return

EngineerSingleAttack: 
SimulateEngineerSingleAttack()
return

SimulateEngineerSingleAttack()
{
  Send 3421
}
return

EngineerMultipleAttack: 
SimulateEngineerMultipleAttack()
return

SimulateEngineerMultipleAttack()
{
  Send 3421
}
return

Jump: 
SimulateJump()
return

SimulateJump()
{
  Send {Space Down}
  Sleep 50
  Send {Space Up}
}
return

Interrupt: 
SimulateInterrupt()
return

SimulateInterrupt()
{
  Send 6
}
return

GapCloser: 
SimulateGapCloser()
return

SimulateGapCloser()
{
  Send 4
}
return

GuiEscape:
GuiClose:
exitapp
return