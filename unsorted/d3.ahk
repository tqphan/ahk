SetTitleMatchMode, 3
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
Gui, Add, Button, x0 y40 h20 w30 gsub2, +
Gui, Add, Button, x30 y40 h20 w30 gsub3, -
Gui, Add, Checkbox, x60 y40 h20 w30 vAutoHeal, x
Gui, Add, Button, x90 y40 h20 w30, x
Gui, Add, DropDownList, x0 y60 vClassChoice, null|General||Cable|Cyclops|Deadpool|Invisible Woman|Iron Man|Rogue|Scarlet Witch|Spiderman|Thing|Thor|
Gui, Show, w120 h80 Center NoActivate

SetTimer, Health, 1000
SetTimer, Vacuum, 100

return

f2::
{
  send ( ͡° ͜ʖ ͡°) ╯╲___卐卐卐卐
}
return

^SPACE::
{
  Winset, Alwaysontop, , A
}
return


*~LButton::
{
  Gui, Submit, NoHide
  MouseGetPos,,,,ctrl
  if(ctrl="Button6")
  {
    GetKeyState, state, Space
	if state = D
    {
      Send {Space Up}
    }
	else
	{
      Send {Space Down}
	}
  }
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      
    }
  }
}
return 

*~LButton Up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      
    }
  }
}
return 

~RButton::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      
    }
    else if(ClassChoice = "Cable")
    {
      Sleep 100
      send f
    }
    else if(ClassChoice = "Invisible Woman")
    {
      SetTimer, InvisibleWomanSpamKeys, 250
    }
    else if(ClassChoice = "Iron Man")
    {
      SetTimer, IronManSpamKeys, 250
    }
    else if(ClassChoice = "Rogue")
    {
      SetTimer, RogueSpamKeys, 250
    }
    else if(ClassChoice = "Scarlet Witch")
    {
      SetTimer, ScarletWitchSpamKeys, 250
    }
    else if(ClassChoice = "Thing")
    {
      SetTimer, ThingSpamKeys, 1000
    }
  }
}
return 

~RButton Up::
{
  Gui, Submit, NoHide
  SetTimer, InvisibleWomanSpamKeys, off
  SetTimer, IronManSpamKeys, off
  SetTimer, RogueSpamKeys, off
  SetTimer, ScarletWitchSpamKeys, off
  SetTimer, ThingSpamKeys, off
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      
    }
  }
}
return 

~!LButton::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send g
    }
    else if(ClassChoice = "Cable")
    {
      send g
    }
    else if(ClassChoice = "Cyclops")
    {
      send q
    }
    else if(ClassChoice = "Deadpool")
    {
      send g
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send g
    }
    else if(ClassChoice = "Iron Man")
    {
      send g
    }
    else if(ClassChoice = "Rogue")
    {
      send q
    }
    else if(ClassChoice = "Scarlet Witch")
    {
      send g
    }
    else if(ClassChoice = "Thing")
    {
      send g
    }
    else if(ClassChoice = "Thor")
    {
      send g
    }
  }
}
return 

!RButton::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send f
    }
    else if(ClassChoice = "Cable")
    {
      send a
      Sleep 100
      send d
    }
    else if(ClassChoice = "Cyclops")
    {
      send u
    }
    else if(ClassChoice = "Deadpool")
    {
      send d
      sleep 100
      send f
      send d
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send f
    }
    else if(ClassChoice = "Iron Man")
    {
      send f
    }
    else if(ClassChoice = "Rogue")
    {
      send a
    }
    else if(ClassChoice = "Scarlet Witch")
    {
      send f
      sleep 100
      send s
      send f
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thing")
    {
      send f
    }
    else if(ClassChoice = "Thor")
    {
      send f
    }
  }
}
return

F10::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send {a down}
    }
    else if(ClassChoice = "Deadpool")
    {
      send {a down}
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send {a down}
    }
    else if(ClassChoice = "Iron Man")
    {
      send {a down}
    }
    else if(ClassChoice = "Rogue")
    {
      send {a down}
    }
    else if(ClassChoice = "Scarlet Witch")
    {
      send {h down}
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thing")
    {
      send {a down}
    }
    else if(ClassChoice = "Thor")
    {
      send ad
    }
  }
}
return

F10 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send {a up}
    }
    else if(ClassChoice = "Deadpool")
    {
      send {a up}
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send {a up}
    }
    else if(ClassChoice = "Iron Man")
    {
      send {a up}
    }
    else if(ClassChoice = "Rogue")
    {
      send {a up}
    }
    else if(ClassChoice = "Scarlet Witch")
    {
      send {h up}
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thing")
    {
      send {a up}
    }
  }
}
return

!F10::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send {s}
    }
    else if(ClassChoice = "Cable")
    {
      send {s}
    }
    else if(ClassChoice = "Cyclops")
    {
      send {e}
    }
    else if(ClassChoice = "Deadpool")
    {
      send {s}
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send {q}
    }
    else if(ClassChoice = "Iron Man")
    {
      send {q}
    }
    else if(ClassChoice = "Rogue")
    {
      send {q}
    }
    else if(ClassChoice = "Scarlet Witch")
    {
      send {d}
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thing")
    {
      send {s}
    }
    if(ClassChoice = "Thor")
    {
      send {s}
    }
  }
}
return

F11::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send {h down}
    }
    else if(ClassChoice = "Deadpool")
    {
      send {h down}
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send {r down}
    }
    else if(ClassChoice = "Iron Man")
    {
      send {h down}
    }
    else if(ClassChoice = "Rogue")
    {
      send {h down}
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thing")
    {
      send {h down}
    }
    else if(ClassChoice = "Thor")
    {
      send {h down}
    }
  }
}
return

F11 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send {h up}
    }
    else if(ClassChoice = "Deadpool")
    {
      send {h up}
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send {r up}
    }
    else if(ClassChoice = "Iron Man")
    {
      send {h up}
    }
    else if(ClassChoice = "Rogue")
    {
      send {h up}
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thing")
    {
      send {h up}
    }
    else if(ClassChoice = "Thor")
    {
      send {h up}
    }
  }
}
return

!F11::
{
  Gui, Submit, NoHide
  
  IfWinActive, Diablo III
  {
    if(ClassChoice = "General")
    {
      send {d}
    }
    else if(ClassChoice = "Deadpool")
    {
      send {e down}
      Sleep 50
      send {e up}
    }
    else if(ClassChoice = "Invisible Woman")
    {
      send {e}
    }
    else if(ClassChoice = "Iron Man")
    {
      send {e}
    }
    else if(ClassChoice = "Spiderman")
    {
    }
    else if(ClassChoice = "Thor")
    {
      send {e}
    }
  }
}
return

sub1:
{
  send u
}
return

sub2:
{
  send {WheelUp}
}
return

sub3:
{
  send {WheelDown}
}
return

sub4:
{
  Send {Enter}
}
return

HealthCheck(AutoHealEnable)
{
  PixelGetColor, HealthColor, 570, 1027

  IfWinActive, Diablo III
  {
    if(AutoHealEnable = 1)
    {
      if(HealthColor != 0x0000DB)
      {
        send m
      }
    }
  }
}
return 

VacuumCheck(AutoVacuumEnable)
{
  static IsNDown := false
  if(AutoVacuumEnable = 1)
  {
    MouseGetPos, xpos, ypos
    if (ypos = 1079)
    {
      if (IsNDown = false)
      {
        Send {n down}
        IsNDown := true
      }
    }
    else 
    {
      if (IsNDown = true)
      {
        Send {n up}
        IsNDown := false 
      }
    }
  }
}
return

ConvertToBGR255(HexColor)
{
  B := (HexColor >> 16) & 255
  G := (HexColor >> 8) & 255
  R := HexColor & 255

  if (B = G and B = R)
  {
    return true
  }
  else
  {
    return false 
  }
}
return 

Health: 
HealthCheck(AutoHeal)
return 

Vacuum: 
VacuumCheck(AutoVacuum)
return 

InvisibleWomanSpamKeys: 
  Send sdh
return 

IronManSpamKeys: 
  Send sdh
return 

RogueSpamKeys: 
  Send sdfgh
return

ScarletWitchSpamKeys:
  Send a
return

ThingSpamKeys: 
  Send d
return 



guiclose:
exit:
{
  exitapp
}
return
 