SetTitleMatchMode, 1
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Button, x0 y0 h40 w120 gsub1, Ultimate
Gui, Add, Button, x0 y40 h20 w30 gsub2, +
Gui, Add, Button, x30 y40 h20 w30 gsub3, -
Gui, Add, Checkbox, x60 y40 h20 w30 vAutoHeal, x
Gui, Add, Button, x90 y40 h20 w30, x
Gui, Add, DropDownList, x0 y60 vClassChoice, null|General||Berserker|Evoker|Cannoneer|Shadowhunter|
Gui, Show, w120 h80 Center NoActivate

SetTimer, Health, 1000
SetTimer, Vacuum, 100

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
    GetKeyState, state, F
	if state = D
    {
      Send {F Up}
    }
	else
	{
      Send {F Down}
	}
  }
  IfWinActive, Devilian
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
  
  IfWinActive, Devilian
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
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {

    }
    else if(ClassChoice = "Berserker")
    {
      Sleep 100
      send f
    }
    else if(ClassChoice = "Evoker")
    {
      SetTimer, InvisibleWomanSpamKeys, 250
    }
    else if(ClassChoice = "Cannoneer")
    {
      SetTimer, IronManSpamKeys, 250
    }
    else if(ClassChoice = "Shadowhunter")
    {
      SetTimer, RogueSpamKeys, 250
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
  IfWinActive, Devilian
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
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
	  sleep 250
      send {2 down}
	  sleep 50
      send {2 up}
    }
    else if(ClassChoice = "Berserker")
    {
      send g
    }
    else if(ClassChoice = "Evoker")
    {
      send q
    }
    else if(ClassChoice = "Cannoneer")
    {
      send g
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send g
    }
  }
}
return 

!RButton::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {3 down}
	  sleep 50
      send {3 up}
    }
    else if(ClassChoice = "Berserker")
    {
      send a
      Sleep 100
      send d
    }
    else if(ClassChoice = "Evoker")
    {
      send u
    }
    else if(ClassChoice = "Cannoneer")
    {
      send d
      sleep 100
      send f
      send d
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send f
    }
  }
}
return

F10::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {4 down}
    }
    else if(ClassChoice = "Berserker")
    {
      send {a down}
    }
    else if(ClassChoice = "Evoker")
    {
      send {a down}
    }
    else if(ClassChoice = "Cannoneer")
    {
      send {a down}
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send {a down}
    }
  }
}
return

F10 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {4 up}
    }
    else if(ClassChoice = "Berserker")
    {
      send {a up}
    }
    else if(ClassChoice = "Evoker")
    {
      send {a up}
    }
    else if(ClassChoice = "Cannoneer")
    {
      send {a up}
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send {a up}
    }
  }
}
return

!F10::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {s}
    }
    else if(ClassChoice = "Berserker")
    {
      send {s}
    }
    else if(ClassChoice = "Evoker")
    {
      send {e}
    }
    else if(ClassChoice = "Cannoneer")
    {
      send {s}
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send {q}
    }
  }
}
return

F11::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {5 down}
    }
    else if(ClassChoice = "Berserker")
    {
      send {h down}
    }
    else if(ClassChoice = "Evoker")
    {
      send {r down}
    }
    else if(ClassChoice = "Cannoneer")
    {
      send {h down}
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send {h down}
    }
  }
}
return

F11 up::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {5 up}
    }
    else if(ClassChoice = "Berserker")
    {
      send {h up}
    }
    else if(ClassChoice = "Evoker")
    {
      send {r up}
    }
    else if(ClassChoice = "Cannoneer")
    {
      send {h up}
    }
    else if(ClassChoice = "Shadowhunter")
    {
      send {h up}
    }
  }
}
return

!F11::
{
  Gui, Submit, NoHide
  
  IfWinActive, Devilian
  {
    if(ClassChoice = "General")
    {
      send {d}
    }
    else if(ClassChoice = "Berserker")
    {
      send {e down}
      Sleep 50
      send {e up}
    }
    else if(ClassChoice = "Evoker")
    {
      send {e}
    }
    else if(ClassChoice = "Cannoneer")
    {
      send {e}
    }
    else if(ClassChoice = "Shadowhunter")
    {
    }
  }
}
return

sub1:
{
  send f
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

  IfWinActive, Devilian
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
 