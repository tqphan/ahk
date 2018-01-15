; Example: On-screen display (OSD) via transparent window:
FormatTime, var0,, H:mm:ss
CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s45  ; Set a large font size (32-point).
Gui, Add, Text, +Center vMyText cGreen, % var0  ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 150
SetTimer, UpdateOSD, 1000
Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer.
Gui, Show, AutoSize xCenter y0 NoActivate  ; NoActivate avoids deactivating the currently active window.
return

UpdateOSD:
    FormatTime, var0,, H:mm:ss
    GuiControl,, MyText, % var0
return
