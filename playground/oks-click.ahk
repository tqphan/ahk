; f9::
; ControlClick x490 y375, ahk_class DirectUIHWND1,,,, NA Pos
; If ErrorLevel
;   Msgbox 0x40000,, % "ERR!!! " 
; Return

F9::
	ControlClick, x200 y500, ahk_exe osk.exe, , Left, 1, NA
return