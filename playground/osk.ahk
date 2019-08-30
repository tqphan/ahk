WinHide, ahk_exe osk.exe
WinSet, ExStyle, +0x80 , ahk_exe osk.exe 
WinShow, ahk_exe osk.exe
WinSet, Style, -0xC40000, ahk_exe osk.exe ; 0xC00000

; ~RButton::
;     CoordMode Mouse, Screen
;     CoordMode Pixel, Screen
;     MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin, EWD_MouseCtrl
;     WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
;     WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
;     if (EWD_MouseCtrl = "DirectUIHWND1")

; Return

~LButton::
    CoordMode Mouse, Screen
    CoordMode Pixel, Screen
    MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin, EWD_MouseCtrl
    WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
    WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
    PixelGetColor BGR_Color, %EWD_MouseStartX%, %EWD_MouseStartY%, RGB
    if (EWD_MouseCtrl = "DirectUIHWND1")
        ; MsgBox, %BGR_Color%
        if (BGR_Color = 0x1a1a1a)
            SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.    
Return

EWD_WatchMouse:
    GetKeyState, EWD_LButtonState, LButton, P
    if EWD_LButtonState = U  ; Button has been released, so drag is complete.
    {
        SetTimer, EWD_WatchMouse, off
        return
    }
    
    GetKeyState, EWD_EscapeState, Escape, P
    if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
    {
        SetTimer, EWD_WatchMouse, off
        WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
        return
    }
    
    ; Otherwise, reposition the window to match the change in mouse coordinates
    ; caused by the user having dragged the mouse:
    CoordMode, Mouse
    MouseGetPos, EWD_MouseX, EWD_MouseY
    WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
    SetWinDelay, -1   ; Makes the below move faster/smoother.
    WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
    EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
    EWD_MouseStartY := EWD_MouseY
return