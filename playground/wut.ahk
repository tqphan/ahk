#NoEnv

SnapWindow(hWnd, X := "", Y := "", W := "", H := "") {
   If ((X . Y . W . H) = "")
      Return False
   If !WinExist("ahk_id " . hWnd)
      Return False
   VarSetCapacity(WI, 60, 0) ; WINDOWINFO structure
   NumPut(60, WI, "Uint")
   If !DllCall("GetWindowInfo", "Ptr", hWnd, "Ptr", &WI)
      Return False
   WX := NumGet(WI,  4, "Int")      ; X coordinate of the window
   WY := NumGet(WI,  8, "Int")      ; Y coordinate of the window
   WW := NumGet(WI, 12, "Int") - WX ; width of the window
   WH := NumGet(WI, 16, "Int") - WY ; height of the window
   BW := NumGet(WI, 48, "UInt") - 1 ; border width - 1
   BH := NumGet(WI, 52, "UInt") - 1 ; border height - 1
   X := X <> "" ? X - BW : WX
   Y := Y <> "" ? Y : WY
   W := W <> "" ? W + BW + BW : WW
   H := H <> "" ? H + BH : WH
   Return DllCall("MoveWindow", "Ptr", hWnd, "Int", X, "Int", Y, "Int", W, "Int", H, "UInt", 1)
}

Gui, +hwndHGUI
Gui, Margin, 200, 100
Gui, Add, Button, gMove, MoveIt
Gui, Add, Button, x+10 yp gSnap, SnapIt
Gui, Add, Button, x+10 yp gResize vBtnResize, +Resize
Gui, Show, , SnapIt
Return
GuiClose:
ExitApp
Resize:
GuiControlGet, BtnResize
Gui, %BtnResize%
Gui, Show
GuiControl, , BtnResize, % (BtnResize = "+Resize" ? "-Resize" : "+Resize")
Return
Move:
WinMove, ahk_id %HGUI%, , 0, 0, A_ScreenWidth
Return
Snap:
SnapWindow(HGUI, 0, 0, A_ScreenWidth)
Return