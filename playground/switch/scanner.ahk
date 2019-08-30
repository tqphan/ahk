#Persistent
#Include <JSON>


FileRead jsonString, A:/ahk/playground/switch/scanner.json
Data := JSON.Load(jsonString)
apps := Data.apps

for each, app in apps
{
    if (SubStr(app.path, 1, 6) = "shell:")
        isStoreApp := True
    else
        isStoreApp := False

    if not WinExist("ahk_exe " . app.exe) {
        ap := app.path
        e := app.exe
        b := app.border
        c := app.caption

        x := app.x
        y := app.y
        w := app.width
        h := app.height
        if isStoreApp
            Run, %ap%
        else
            Run, %ap%%e%

        
        WinWait, ahk_exe %e%

        if not b and not c
            WinSet, Style,  -0xC40000 , ahk_exe %e% ;-0xC00000

        SetWindowPosition("ahk_exe " e, x, y, w, h)
        ; WinMove, ahk_exe %e%, , x, y, w, h
    }
    

}

SysGet, MonitorPrimary, MonitorPrimary
SysGet, MonitorWorkArea, MonitorWorkArea, %MonitorPrimary%
;%MonitorWorkAreaLeft% %MonitorWorkAreaTop% %MonitorRight% %MonitorWorkAreaBottom%
; ToolTip, %MonitorPrimary%

; run, osk.exe, , , o_pid
; WinWait, ahk_pid %o_pid%
; WinMove, ahk_pid %o_pid%, , 500, 250, 200, 100

;disable "resiz interface to video size"




; Menu, Tray, NoStandard ; remove standard Menu items
; Menu, Tray, Add , &Change, Change ;add a item named Change that goes to the Change label
; Menu, Tray, Add , E&xit, ButtonExit ;add a item named Exit that goes to the ButtonExit label
; Return

SetWindowPosition(target, x, y, width, height)
{
    hwnd := WinExist(target) ;get handle
    DllCall("SetWindowPos"
    , "UInt", hWnd ;handle
    , "UInt", 0 ;HWND_TOP
    , "Int", x ;x
    , "Int", y ;y
    , "Int", width ;width
    , "Int", height ;height
    , "UInt", 0x4000) ;SWP_ASYNCWINDOWPOS
}

f5::

; WinMove, ahk_exe WindowsTerminal.exe, , 0, 760, 960, 320
Return

f6::
Run, C:\Program Files\VideoLAN\VLC\vlc.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style, -0xC40000 , ahk_pid %o_pid% 
WinMove, ahk_pid %o_pid%, , 0, 40, 1280, 720
Return

f7::
WinClose, ahk_exe osk.exe 
WinClose, ahk_exe SumatraPDF.exe
WinClose, ahk_exe vlc.exe
WinClose, ahk_exe WindowsTerminal.exe

Return


f8::
Run, C:\Program Files\VideoLAN\VLC\vlc.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid%
WinMove, ahk_pid %o_pid%, , 0, 40, 1280, 720

Run, C:\Windows\system32\osk.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style,  -0xC40000 , ahk_pid %o_pid%
WinMove, ahk_pid %o_pid%, , 960, 760, 960, 320


Run, C:\Program Files\SumatraPDF\SumatraPDF.exe, , , o_pid
WinWait, ahk_pid %o_pid%
WinSet, Style, -0xC40000 , ahk_pid %o_pid%
WinMove, ahk_pid %o_pid%, , 0, 40, 1280, 720
Return

Change:
MsgBox Hello
Return

ButtonExit:
ExitApp
