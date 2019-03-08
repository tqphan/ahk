#NoEnv
SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%
#Include AutoXYWH.ahk

FileRead, OutputVar, test.html

if ErrorLevel
{
    MsgBox, 444444
}
global WB
Gui, +LastFound +AlwaysOnTop +Border +Resize +E0x08000000
Gui, Margin , 0, 0
;Gui, Add, ActiveX, vWB x0 y0 w780 h580, Shell.Explorer
Gui Add, ActiveX, vWB w800 h600, about:<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=Edge" />
Gui, show, Center
document := WB.Document
document.open()
document.write(OutputVar)
document.close()
; WB.Navigate("about:blank")
Loop
    Sleep 10
Until (WB.readyState=4 && WB.document.readyState="complete" && !WB.busy)    
;WB.Navigate("file:///A:/ahk/playground/test.html")
;WB.Document.Write(OutputVar)
;WB.Refresh()
return

Test(bb)
{
    v := 4
    hw := "alert(" . v . ")"
    WB.document.parentwindow.execScript(hw)
}

F3::
{
    Test(twb)

}

GuiSize:
	If (A_EventInfo = 1) ; The window has been minimized.
		Return
	AutoXYWH("wh", "WB")
return

GuiClose:
ExitApp
