SetTitleMatchMode, 3
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Button, x0 y0 h40 w120, Ultimate
Gui, Add, Checkbox, x0 y40 h20 w30 checked vAutoCharge, c
Gui, Add, Checkbox, x30 y40 h20 w30 vAutoStrafe, s
Gui, Add, Checkbox, x60 y40 h20 w30 checked vAutoRun, r
Gui, Add, Checkbox, x90 y40 h20 w30 checked vAutoFace, f
Gui, Add, Radio, x0 y80 h20 w60 checked vAction, Single
Gui, Add, Radio, x60 y80 h20 w60, AoE

Gui, Add, Radio, x0 y100 h20 w60 checked vMode Group, PvE
Gui, Add, Radio, x60 y100 h20 w60, PvP

Gui, Add, DropDownList, x0 y60 vClassChoice, null|General|Warrior Arms||Warrior Fury|Warrior Gladiator|Hunter Beastmaster|Shaman|Treasure|
Gui, Show, w120 h120 Center NoActivate

SetTimer, AutoRun, 100

return

Alternate := false

F9::
{
  Gui, Submit, NoHide
  
  IfWinActive, World of Warcraft
  {
  
    if(AutoStrafe = 1)
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
  
    if(ClassChoice = "General")
    {
      SetTimer, GeneralSimulation, 250
    }
    else if(ClassChoice = "Warrior Arms")
    {
      SetTimer, WarriorSimulation, 250
    }
    else if(ClassChoice = "Warrior Fury")
    {
      SetTimer, WarriorFurySimulation, 250
    }
    else if(ClassChoice = "Warrior Gladiator")
    {
      SetTimer, WarriorGladiatorSimulation, 250
    }
    else if(ClassChoice = "Hunter Beastmaster")
    {
      SetTimer, HunterBeastmasterSimulation, 250
    }
    else if(ClassChoice = "Treasure")
    {
      Send {Space Down}
    }
  }
}
return

F9 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, World of Warcraft
  {
  
    if(AutoStrafe = 1)
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
	
	SetTimer, GeneralSimulation, off
  SetTimer, WarriorFurySimulation, off
	SetTimer, WarriorGladiatorSimulation, off
  SetTimer, HunterBeastmasterSimulation, off
	SetTimer, WarriorSimulation, off
  
    if(ClassChoice = "General")
    {
      
    }
    else if(ClassChoice = "Warrior Arms")
    {
      
    }
    else if(ClassChoice = "Treasure")
    {
      Send {Space Up}
    }
  }
}
return

F10::
{
  Gui, Submit, NoHide
  
  IfWinActive, World of Warcraft
  {
    if(ClassChoice = "General")
    {
      
    }
    else if(ClassChoice = "Warrior Arms")
    {
      
    }
  }
}
return

F10 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, World of Warcraft
  {
    if(ClassChoice = "General")
    {
      Send 6
    }
    else if(ClassChoice = "Warrior Arms")
    {
      Send 8
    }
    else if(ClassChoice = "Warrior Fury")
    {
      Send 8
    }
    else if(ClassChoice = "Warrior Gladiator")
    {
      Send 0
    }
  }	
}
return

F11::
{
  Gui, Submit, NoHide
  
  IfWinActive, World of Warcraft
  {
    if(ClassChoice = "General")
    {
      
    }
    else if(ClassChoice = "Warrior")
    {
      
    }
    else if(ClassChoice = "Warrior Gladiator")
    {
      
    }
  }
}
return

F11 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, World of Warcraft
  {
    if(ClassChoice = "General")
    {
      Send 7
    }
    else if(ClassChoice = "Warrior")
    {
      Send 0
    }
    else if(ClassChoice = "Warrior Fury")
    {
      Send 9
    }
    else if(ClassChoice = "Warrior Gladiator")
    {
      Send 8
    }
  }
}
return

~LButton::
{
  MouseGetPos,,,,ctrl
  if(ctrl="Button1")
  {
    Send {Space Down}
  }
}
return

~LButton Up::
{
  GetKeyState, state, Space
  if state = D
  {
    Send {Space Up}
  }
}
return

CursorCheck(AutoVacuumEnable)
{
  static IsNumlockDown := false
  if(AutoVacuumEnable = 1)
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

GeneralSimulationLogic(AutoChargeEnable, AutoFaceEnable, ActionType, ModeType)
{
  if(AutoFaceEnable = 1)
  {
    Send z
  }
  if(AutoChargeEnable = 1)
  {
    Send 1
  }

  Send 2345
}
return

WarriorSimulationLogic(AutoChargeEnable, AutoFaceEnable, ActionType)
{
  PixelGetColor, HealthColor, 753, 750
  if(ActionType = 1)
  {
    if(AutoFaceEnable = 1)
    {
      Send z
    }
    if(AutoChargeEnable = 1)
    {
      Send 1
    }
	if(HealthColor = 0x2E1E89)
	{
      Send 2345-
	}
	else
	{
      Send 234-
	}
  }
  else if(ActionType = 2)
  {
    if(AutoFaceEnable = 1)
    {
      Send z
    }
    if(AutoChargeEnable = 1)
    {
      Send 1
    }
    Send 75
  }
}
return

WarriorFurySimulationLogic(AutoChargeEnable, AutoFaceEnable, ActionType, ModeType)
{
  if(AutoFaceEnable = 1)
  {
    Send z
  }
  if(AutoChargeEnable = 1)
  {
    Send 1
  }

  if(!IsHamstringUp() and IsPvP(ModeType))
  {
    Send 7
  }
  if(IsSingleTarget(ActionType))
  {
    Send 234
    if(IsBloodSurgeUp() or (IsRageOver50() and !IsInExecuteRange()))
    {
      Send 5
    }
    Send -
  }
  else if(IsMultipleTarget(ActionType))
  {
    if(IsMeatCleaverUp())
    {
      Send 33346-
    }
    else
    {
      Send 46-0
    }
    if(IsBloodSurgeUp())
    {
      Send 5
    }
  }
}
return

WarriorGladiatorSimulationLogic(AutoChargeEnable, AutoFaceEnable, ActionType, ModeType)
{
  if(AutoFaceEnable = 1)
  {
    Send z
  }
  if(AutoChargeEnable = 1)
  {
    Send 1
  }

  Send 234-5

  if(!IsHamstringUp() and IsPvP(ModeType))
  {
    Send 7
  }

  if(IsRageOver50() and !IsInExecuteRange())
  {
    Send 6
  }
}
return

HunterBeastmasterSimulationLogic(AutoChargeEnable, AutoFaceEnable, ActionType, ModeType)
{
  if(AutoFaceEnable = 1)
  {
    Send {Space}
  }
  if(AutoChargeEnable = 1)
  {
    Send 1
  }

  if(IsPvP(ModeType))
  {
    Send -
  }
  if(IsSingleTarget(ActionType))
  {
    Send 2389
    
    if(IsFocusOver60())
    {
      Send 4
    }
    else
    {
      if(IsKillCommandOnCooldown() or IsFocusUnder40())
      {
        Send 5
      }
    }
  }
  else if(IsMultipleTarget(ActionType))
  {

  }
}
return

IsRageOver50()
{
  PixelGetColor, Color, 1919, 1079
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsInExecuteRange()
{
  PixelGetColor, Color, 1919, 1059
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsHamstringUp()
{
  PixelGetColor, Color, 1919, 979
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsBloodSurgeUp()
{
  PixelGetColor, Color, 1919, 879
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsMeatCleaverUp()
{
  PixelGetColor, Color, 1919, 929
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsKillCommandOnCooldown()
{
  PixelGetColor, Color, 1919, 1079
  if(Color = 0xFFFFFF)
  {
    return false
  }
  else
  {
    return true
  }
}
return

IsFocusOver60()
{
  PixelGetColor, Color, 1919, 1029
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsFocusUnder40()
{
  PixelGetColor, Color, 1919, 979
  if(Color = 0xFFFFFF)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsPvE(GameMode)
{
  if(GameMode = 1)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsPvP(GameMode)
{
  if(GameMode = 2)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsSingleTarget(GameMode)
{
  if(GameMode = 1)
  {
    return true
  }
  else
  {
    return false
  }
}
return

IsMultipleTarget(GameMode)
{
  if(GameMode = 2)
  {
    return true
  }
  else
  {
    return false
  }
}
return

GeneralSimulation:
GeneralSimulationLogic(AutoCharge, AutoFace, Action, Mode)
return

WarriorFurySimulation:
WarriorFurySimulationLogic(AutoCharge, AutoFace, Action, Mode)
return

WarriorGladiatorSimulation:
WarriorGladiatorSimulationLogic(AutoCharge, AutoFace, Action, Mode)
return

HunterBeastmasterSimulation:
HunterBeastmasterSimulationLogic(AutoCharge, AutoFace, Action, Mode)
return

WarriorSimulation:
WarriorSimulationLogic(AutoCharge, AutoFace, Action)
return

guiclose:
exit:
{
  exitapp
}
return