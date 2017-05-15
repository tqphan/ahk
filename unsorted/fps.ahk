#SingleInstance force
#Include HotkeyOutputMode.ahk
#Include HotkeyOutput.ahk

Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, DropDownList, x0 y0 AltSubmit vBttn gOnDropDownListSelection, F9||Primary|Secondary|Tertiary|
Gui, Add, Button, x0 y21 h20 w120, Ultimate
Gui, Add, Button, x0 y40 h20 w30, α
Gui, Add, Button, x30 y40 h20 w30, β
Gui, Add, Button, x60 y40 h20 w30, γ
Gui, Add, Button, x90 y40 h20 w30, δ
Gui, Add, DropDownList, x0 y60 AltSubmit vF9DropDownList gOnDropDownListSelection, Primary|Secondary|Tertiary|
Gui, Add, DropDownList, x0 y80 AltSubmit vF10DropDownList gOnDropDownListSelection, Primary|Secondary|Tertiary|
Gui, Add, DropDownList, x0 y100 AltSubmit vF11DropDownList gOnDropDownListSelection, Primary|Secondary|Tertiary|
Gui, Show, w120 h120 Center NoActivate

global activeWindowCheckEnabled := false
global windowTitle := ""
global f9ko := new HotkeyOutput
f9ko.AddKeysArray({keys: ["a","d"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})
f9ko.AddKeysArray({keys: ["e"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
f9ko.AddKeysArray({keys: ["space"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})

global rbko := new HotkeyOutput
rbko.AddKeysArray({keys: ["w","s"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})
rbko.AddKeysArray({keys: ["e"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
rbko.AddKeysArray({keys: ["space"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})

return

F9::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		f9ko.Activate(F9DropDownList)
	}
}
return 

F9 Up::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		f9ko.Deactivate()
	}
}
return 

~LButton::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		MouseGetPos,,,,ctrl
		if(ctrl="Button1")
		{
			
		}
		else if(ctrl="Button2")
		{
	
		}
	}
}
return

~LButton Up::
{

}
return

~RButton::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		
	}
}
return

~RButton Up::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		
	}
}
return


ActiveWindowCheck(CheckEnabled)
{
	if(CheckEnabled)
	{
		if WinActive(windowTitle)
			return true
		else
			return false	
	}
	else
	{
		return true
	}
}
return

OnDropDownListSelection:
Gui, Submit, nohide
return

GuiClose:
exit:
{
	exitapp
}
return