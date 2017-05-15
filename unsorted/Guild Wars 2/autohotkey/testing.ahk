Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, checked vStrafe, Strafe
Gui, Add, Checkbox, checked vHeal, Auto Healing 
Gui, Add, Radio, rad checked 1 vAction, Attack
Gui, Add, Radio, rad, Jump
Gui, Add, DropDownList, vWeaponChoice, Rifle|Bow|Greatsword|Hammer|AxeAxe|SwordShield|Spear|SpearGun
Gui, Show, w200 h100 Center NoActivate
return

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

  if(Action = 1)
  {
    if(WeaponChoice = "Rifle")
    {
        SetTimer, RifleAttack, 250
    }
    else if(WeaponChoice = "Bow")
    {
      SetTimer, BowAttack, 250
    }
    else if(WeaponChoice = "Greatsword")
    {
      SetTimer, GreatswordAttack, 250
    }
    else if(WeaponChoice = "Hammer")
    {
      SetTimer, HammerAttack, 250
    }
    else if(WeaponChoice = "AxeAxe")
    {
      SetTimer, AxeAxeAttack, 250
    }
    else if(WeaponChoice = "SwordShield")
    {
      SetTimer, SwordShieldAttack, 250
    }
    else if(WeaponChoice = "Spear")
    {
      SetTimer, SpearAttack, 250
    }
    else if(WeaponChoice = "SpearGun")
    {
      SetTimer, SpearGunAttack, 250
    }
  }
  else if(Action = 2)
  {
    Send {Space}
  }
}
Return 

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
  
  SetTimer, RifleAttack, off
  SetTimer, BowAttack, off
  SetTimer, GreatswordAttack, off
  SetTimer, HammerAttack, off
  SetTimer, AxeAxeAttack, off
  SetTimer, SwordShieldAttack, off
  SetTimer, SpearAttack, off
  SetTimer, SpearGunAttack, off
}
Return 

RifleAttack: 
SimulateRifleAttack()
return

SimulateRifleAttack()
{
  Send 421
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

GreatswordAttack: 
SimulateGreatswordAttack()
return

SimulateGreatswordAttack()
{
  Send 415
}
return

HammerAttack: 
SimulateHammerAttack()
return

SimulateHammerAttack()
{
  Send 2351
}
return

AxeAxeAttack: 
SimulateAxeAxeAttack()
return

SimulateAxeAxeAttack()
{
  Send 2431
}
return

SwordShieldAttack: 
SimulateSwordShieldAttack()
return

SimulateSwordShieldAttack()
{
  Send 3421
}
return

SpearAttack: 
SimulateSpearAttack()
return

SimulateSpearAttack()
{
  Send 1
}
return

SpearGunAttack: 
SimulateSpearGunAttack()
return

SimulateSpearGunAttack()
{
  Send 1
}
return

GuiEscape:
GuiClose:
exitapp
return