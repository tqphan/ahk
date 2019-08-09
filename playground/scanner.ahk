#Persistent

osk := {exe: "osk.exe"
    , x: 99
    , y: 720
    , width: 888
    , height: 320}

SysGet, MonitorPrimary, MonitorPrimary
SysGet, MonitorWorkArea, MonitorWorkArea, %MonitorPrimary%
;%MonitorWorkAreaLeft% %MonitorWorkAreaTop% %MonitorRight% %MonitorWorkAreaBottom%
; ToolTip, %MonitorPrimary%

; run, osk.exe, , , o_pid
; WinWait, ahk_pid %o_pid%
; WinMove, ahk_pid %o_pid%, , 500, 250, 200, 100

;disable "resiz interface to video size"

; if not WinExist("ahk_exe osk.exe") {

; }C:\Program Files\SumatraPDF\SumatraPDF.exe
Run, C:\Program Files\VideoLAN\VLC\vlc.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid% ;-0xC00000
WinMove, ahk_pid %o_pid%, , 0, 40, 1280, 720

Run, C:\Windows\system32\osk.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid% ;-0xC00000
WinMove, ahk_pid %o_pid%, , 1060, 760, 860, 320


Run, C:\Program Files\SumatraPDF\SumatraPDF.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid% ;-0xC00000
WinMove, ahk_pid %o_pid%, , 0, 40, 1060, 1040

Run, C:\Windows\system32\notepad.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid% ;-0xC00000
WinMove, ahk_pid %o_pid%, , 1280, 40, 640, 320
; Menu, Tray, NoStandard ; remove standard Menu items
; Menu, Tray, Add , &Change, Change ;add a item named Change that goes to the Change label
; Menu, Tray, Add , E&xit, ButtonExit ;add a item named Exit that goes to the ButtonExit label
; Return

f6::
Run, C:\Program Files\VideoLAN\VLC\vlc.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid% ;-0xC00000
WinMove, ahk_pid %o_pid%, , 0, 40, 1280, 720
Return

f7::
WinClose, ahk_exe osk.exe 
WinClose, ahk_exe SumatraPDF.exe
WinClose, ahk_exe vlc.exe
WinClose, ahk_exe notepad.exe
Return

Change:
MsgBox Hello
Return

ButtonExit:
ExitApp
