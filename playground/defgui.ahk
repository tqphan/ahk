#NoEnv
SetWorkingDir %A_ScriptDir%


Gui, +HwndMyGuiHwnd +LastFound +AlwaysOnTop +Border +Resize
Gui, Margin , 0, 0
Gui, Show, Center
Return


GuiEscape:
GuiClose:
ButtonCancel:
ExitApp 