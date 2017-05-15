F11::
{
  SimulateSingleTargetPriorityDPS()
  SetTimer, TimerLabel, 200
}
return 

F11 Up::
{
  SetTimer, TimerLabel, off
}
return 

TimerLabel: 
SimulateSingleTargetPriorityDPS()
return

SimulateSingleTargetPriorityDPS()
{
  if(IsOver60Rage())
  {
    if(IsOver80Rage())
    {
      Send wz123456
    }
    else
    {
      Send z123456
    }
  }
  else 
  {
    Send z12345
  }
}

IsOver60Rage()
{
  PixelGetColor, HexColor, 672, 84
  if(HexColor = 0x000099)
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