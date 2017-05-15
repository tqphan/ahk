~LButton::
{
  ;SetTimer, Health, 1000
}
return 

~LButton up::
{
  ;SetTimer, Health, off
}
return

!F10::
{
  IfWinActive, Diablo III
  {
    send {q}
  }
}
return

F10::
{
  IfWinActive, Diablo III
  {
    send {1 down}
  }
}
return

F10 up::
{
  IfWinActive, Diablo III
  {
    send {1 up}
  }
}
return

!RButton::
{
  IfWinActive, Diablo III
  {
    send 2
  }
}
return 

~!LButton::
{
  IfWinActive, Diablo III
  {
    send 3
  }
}
return 

HealthCheck()
{
  PixelGetColor, HealthColor, 525, 1021

  if(HealthColor != 0x0000D8)
  {
    IfWinActive, Diablo III
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