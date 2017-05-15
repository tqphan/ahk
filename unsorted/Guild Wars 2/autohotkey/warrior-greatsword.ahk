Alternate := false
F11::
{
  Send 1542
}
Return 

F11 Up::
{
}
Return 

F9::
{
  T := IsRangerPetUnder(0.5)
  MsgBox, %T%
}
Return

ConvertToBGR255(HexColor)
{
  B := (HexColor >> 16) & 255
  G := (HexColor >> 8) & 255
  R := HexColor & 255
}

ConvertToBlue255(HexColor)
{
  B := (HexColor >> 16) & 255
  Return B
}

ConvertToGreen255(HexColor)
{
  G := (HexColor >> 8) & 255
  Return G
}

ConvertToRed255(HexColor)
{
  R := HexColor & 255
  Return R
}

; PercentHealth ranges 0.0 - 1.0
IsRangerPetUnder(PercentHealth)
{
  PetHeathRed := 162
  PetHeathGreen := 17
  PetHeathBlue := 11

  XBegin := 580
  XEnd := 775
  YMiddle := 973
  XLength := XEnd - XBegin

  XResult := XBegin + Floor(XLength * PercentHealth)

  PixelGetColor, Color, %XResult%, %YMiddle%

  if(ConvertToRed255(Color) = PetHeathRed and ConvertToGreen255(Color) = PetHeathGreen and ConvertToBlue255(Color) = PetHeathBlue)
  {
    return false 
  }
  else 
  {
    return true 
  }
  
}

IsPlayerUnder(PercentHealth)
{

}

DaggersRotation: 
Send 1542
Return 