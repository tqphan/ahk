~LButton::
{
  SetTimer, Health, 1000
}
return 

~LButton up::
{
  SetTimer, Health, off
}
return

!F10::
{
  IfWinActive, The Mighty Quest for Epic Loot
  {
    send {s}
  }
}
return

F10::
{
  IfWinActive, The Mighty Quest for Epic Loot
  {
    send {3 down}
  }
}
return

F10 up::
{
  IfWinActive, The Mighty Quest for Epic Loot
  {
    send {3 up}
  }
}
return

!RButton::
{
  IfWinActive, The Mighty Quest for Epic Loot
  {
    send 1
  }
}
return 

~!LButton::
{
  IfWinActive, The Mighty Quest for Epic Loot
  {
    send 2
  }
}
return 

HealthCheck()
{
  PixelGetColor, HealthColor, 525, 1021

  if(HealthColor != 0x0000D8)
  {
    IfWinActive, Marvel Heroes
    {
      send m
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
HealthCheck()
return 