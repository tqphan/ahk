#Persistent
SetTimer, GetColor, 100

GetColor:
CoordMode, Mouse, Screen
MouseGetPos, MX, MY
PixelGetColor, MyColor, 570, 1027
CoordMode, ToolTip, Screen
ToolTip, % ConvertToBGR255(MyColor, MX, MY), 0, 0
return

Esc::ExitApp

BGRto255( HexColor, X, Y )
{
    B := (HexColor >> 16) & 255
    G := (HexColor >> 8) & 255
    R := HexColor & 255
    Return "H: " HexColor " R: " R " G: " G " B: " B " X: " X " Y: " Y
}

BGRtoFloat( HexColor, X, Y)
{
    B := (HexColor >> 16) & 255
    G := (HexColor >> 8) & 255
    R := HexColor & 255
    Return "H: " HexColor " R: " R " G: " G " B: " B " X: " X " Y: " Y
}