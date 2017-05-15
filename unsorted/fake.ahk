Gui, Color, Black, 000000
Gui, -Caption +AlwaysOnTop
TempVar := A_ScreenHeight +100
Gui,Show, h%TempVar% w%A_ScreenWidth%, Centered Text
Gui, Font, Tahoma s24
TextX := A_ScreenWidth / 2
TextY := A_ScreenHeight / 2
Gui,Add, Text, cWhite w320 h240 +0x201 +Center,Some Text Here

SetTimer, checkl, 1000

return

checkl:
ToolTip, % A_TimeIdlePhysical, 0, 0

return

lexit:
exitapp
return