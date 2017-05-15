;SetTitleMatchMode, 3
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

Gui, Add, DropDownList, x0 y60 vClassChoice, null|General||
Gui, Show, w120 h120 Center NoActivate

SetTimer, AutoRun, 100

return

Alternate := false

Title := "Untitled - Notepad"

~RButton::
{
  Send {w Down}
}
Return

~RButton Up::
{
  Send {w Up}
}
Return

F9::
{
  Gui, Submit, NoHide
  
  IfWinActive, Dragon Age
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
  }
}
return

F9 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Dragon Age
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
  
    if(ClassChoice = "General")
    {
      
    }
  }
}
return

F10::
{
  Gui, Submit, NoHide
  
  IfWinActive, Dragon Age
  {
    if(ClassChoice = "General")
    {
      
    }
  }
}
return

F10 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Dragon Age
  {
    if(ClassChoice = "General")
    {
      Send 6
    }
  }	
}
return

F11::
{
  Gui, Submit, NoHide
  
  IfWinActive, Dragon Age
  {
    if(ClassChoice = "General")
    {
      
    }
  }
}
return

F11 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Dragon Age
  {
    if(ClassChoice = "General")
    {
      Send 7
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
  if(ActionType = 1)
  {
    Send 2345678=
  }
  else if(ActionType = 2)
  {
    Send 27890=
  }
  
}
return


GeneralSimulation:
GeneralSimulationLogic(AutoCharge, AutoFace, Action, Mode)
return

guiclose:
exit:
{
  exitapp
}
return