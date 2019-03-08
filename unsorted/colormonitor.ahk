#Persistent
SetTimer, GetColor, 100
xMidScrn :=  A_ScreenWidth //2
yMidScrn :=  A_ScreenHeight //2
GetColor:
CoordMode, Mouse, Screen
MouseGetPos, MX, MY
PixelGetColor, MyColor, xMidScrn, yMidScrn
CoordMode, ToolTip, Mouse
ToolTip, % ConvertToBGR255(MyColor, MX, MY), 0, 0
return

Esc::ExitApp

ConvertToBGR255( HexColor, X, Y )
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