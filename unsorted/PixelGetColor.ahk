F23::
; MouseGetPos, MouseX, MouseY
PixelGetColor, color, 473, 1032
; MsgBox %color%.
if (ConvertToBGR255(color)) {
MsgBox %color%.
}
return

ConvertToBGR255( HexColor )
{
  B := (HexColor >> 16) & 255
  G := (HexColor >> 8) & 255
  R := HexColor & 255

  if (B = G and B = R)
  {
    Return True
  }
  else 
  {
    Return False 
  }
}
Return