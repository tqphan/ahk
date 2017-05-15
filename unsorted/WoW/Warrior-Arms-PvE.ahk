Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Radio, rad checked 1 vDPSType, 1
Gui, Add, Radio, rad, 2
Gui, Add, Radio, rad, 3
Gui, Show, w40 h70 Center NoActivate
return

F11::
{
  Gui, Submit, NoHide
  if(DPSType = 1)
  {
    SimulateSingleTargetPriorityDPS()
    SetTimer, SingleTargetPriority, 200
  }
  else if(DPSType = 2)
  {
    SimulateDualTargetPriorityDPS()
    SetTimer, DualTargetPriority, 200
  }
  else if(DPSType = 3)
  {
    SimulateTripleTargetPriorityDPS()
    SetTimer, TripleTargetPriority, 200
  }

}
return 

F11 Up::
{
  SetTimer, SingleTargetPriority, off
  SetTimer, DualTargetPriority, off
  SetTimer, TripleTargetPriority, off
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
SimulateSingleTargetPriorityDPS()
return

DualTargetPriority: 
SimulateDualTargetPriorityDPS()
return

TripleTargetPriority: 
SimulateTripleTargetPriorityDPS()
return

SimulateInterupt()
{
  Send i
} 

SimulateTripleTargetPriorityDPS()
{
  if(IsWeakenedBlowsDebuffActive())
  {
    Send z12p35
  }
  else 
  {
    Send z12935
  }
}

SimulateDualTargetPriorityDPS()
{
  Send z12t5q
}

SimulateSingleTargetPriorityDPS()
{
  if(IsOver60Rage())
  {
    Send z123456
  }
  else 
  {
    Send z12345
  }
}

IsWeakenedBlowsDebuffActive()
{
  PixelGetColor, HexColor, 209, 558
  if(HexColor = 0x43125D)
  {
    Return true
  }
  else 
  {
    Return false 
  }
}

IsOver60Rage()
{
  PixelGetColor, HexColor, 672, 84
  if(HexColor = 0x00008D or HexColor = 0x000099)
  {
    return true 
  }
  else 
  {
    return false 
  }
}

IsOver80Rage()
{
  PixelGetColor, HexColor, 748, 84
  if(HexColor = 0x000099)
  {
    return true 
  }
  else 
  {
    return false 
  }
}

IsRageUnder70()
{

}

IsBattleShoutOrHornOfWinterActive()
{

}

IsCommandingShoutOrPWFortitudeActive()
{

}

AreCastableBuffs()
{
  PixelGetColor, HexColor1, 50, 385
  PixelGetColor, HexColor2, 50, 363
  if(HexColor1 = 0x42115B or HexColor2 = 0x42115B)
  {
    Return true
  }
  else 
  {
    Return false 
  }
}

IsHamstringUp()
{

}

IsColossusSmashUp()
{

}

IsColossusSmashOnCooldown()
{

}

GuiEscape:
GuiClose:
exitapp
return