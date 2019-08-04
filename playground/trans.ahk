#NoEnv
#Persistent
#SingleInstance, Force

SetWorkingDir %A_ScriptDir%
#Include %A_ScriptDir%
#Include AutoXYWH.ahk

FileEncoding, UTF-8
FileRead, OutputVar, trans.html

if ErrorLevel
{
    MsgBox, 444444
    ExitApp
}

global WB
Gui, +HwndMyGuiHwnd +LastFound +AlwaysOnTop +Border +Resize +E0x08000000
Gui, Margin , 0, 0

Gui Add, ActiveX, vWB hwndATLWinHWND w900 h300, about:<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=Edge" />
; can be any colour but it's good to use a color that is NOT present in ur GUI
Gui, Color, 000000
Gui, Show, W400 H300, Test

WinSet, Transcolor, 000111, Test
WB.silent := true
document := WB.Document
doc := WB.doc
document.open()
document.write(OutputVar)
document.close()
; WB.Navigate("about:blank")
While WB.readystate != 4 or WB.busy
    Sleep 10
Return


GuiClose:
ExitApp
