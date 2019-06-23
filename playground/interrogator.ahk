#NoEnv
SetWorkingDir %A_ScriptDir%

Gui, New, +HwndMyGuiHwnd +LastFound +Border +Resize, hello
; Gui, Margin , 0, 0

Gui, Add, Edit, Section hwndMyEditHwnd vMyEdit, 0000409
Gui, Add, Button, ys, OK
Gui, Add, ListView, Section xs hwndATLWinHWND r20, sc|vk|ch
Gui, Show, Center
Return

GetKeyChar(Key, WinTitle:=0)
{
    thread := WinTitle=0 ? 0
        : DllCall("GetWindowThreadProcessId", "ptr", WinExist(WinTitle), "ptr", 0)
    scancode := 0x01E
    MAPVK_VSC_TO_VK_EX := 3

    hkl := DllCall("GetKeyboardLayout", "uint", thread, "ptr")



    scancode := DllCall("MapVirtualKeyEx", "uint", scancode, "uint", MAPVK_VSC_TO_VK_EX, "ptr", hkl)
    vk := GetKeyVK(Key)
    sc := GetKeySC(Key)
    VarSetCapacity(state, 256, 0)
    cap := VarSetCapacity(char, 20, 0)
    n := DllCall("ToUnicodeEx", "uint", vk, "uint", sc
        , "ptr", &state, "ptr", &char, "int", cap / 2, "uint", 0, "ptr", hkl)
    return StrGet(&char, n, "utf-16")
}

ButtonOK:
Gui, Submit, NoHide
LV_Add(, 33, 77, 66)

msgbox, %MyEdit% 
Return 

DoItMan()
{
    MsgBox, %A_DefaultGui%
}

F3::
{
    Gui, Submit, NoHide
    GuiControlGet, MyEdit
    MsgBox, %MyEdit%
}
Return

GuiSize:
; 	If (A_EventInfo = 1) ; The window has been minimized.
; 		Return

;    WinMove, % "ahk_id " . ATLWinHWND, , , , A_GuiWidth, A_GuiHeight
Return

GuiEscape:
GuiClose:
ButtonCancel:
ExitApp 