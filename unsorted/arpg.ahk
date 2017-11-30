#SingleInstance force
#Include HotkeyOutputMode.ahk
#Include HotkeyOutput.ahk
#Include MouseBind.ahk

Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, DropDownList, x0 y0 vwindowTitleDropDownList gOnChange, |Marvel Heroes Omega|Diablo III|Albion Online|

Gui, Add, Button, x0 y20 h40 w120, Ultimate

Gui, Add, Button, x0 y60 h20 w30, α
Gui, Add, Button, x30 y60 h20 w30, β
Gui, Add, Checkbox, x60 y60 h20 w30 0x1000 vautoHeal gOnChange, γ
Gui, Add, Checkbox, x90 y60 h20 w30 0x1000 vmouseMonitor gOnChange, δ

Gui, Add, Checkbox, x0 y80 h20 w30 0x1000 vtopEdge gOnChange, ε
Gui, Add, Checkbox, x30 y80 h20 w30 0x1000 vleftEdge gOnChange, ζ
Gui, Add, Checkbox, x60 y80 h20 w30 0x1000 vbottomEdge gOnChange, η
Gui, Add, Checkbox, x90 y80 h20 w30 0x1000 vrightEdge gOnChange, θ

Gui, Add, DropDownList, x0 y100 AltSubmit vrmbDropDownList gOnChange, |a|as|asd|asdf|asdfg|asdfgh|ad|ws|
Gui, Add, DropDownList, x0 y120 AltSubmit vf9rmbDropDownList gOnChange, |h|gh|
Gui, Add, DropDownList, x0 y140 AltSubmit vf9lmbDropDownList gOnChange, |g|
Gui, Add, DropDownList, x0 y160 AltSubmit vf9DropDownList gOnChange, |f8|f23|leffalt|ad|ws|alternate scroll|middle button|
Gui, Add, DropDownList, x0 y180 AltSubmit vf9altDropDownList gOnChange, |f8|f23|

Gui, Show, w120 h200 Center NoActivate

global activeWindowCheckEnabled := true
global windowTitle := ""

global mb := new MouseBind
mb.topEdgeKey := "1"
mb.leftEdgeKey := "2"
mb.bottomEdgeKey := "3"
mb.rightEdgeKey := "4"

global aako := new HotkeyOutput
aako.AddKeysArray({keys: ["1", "2", "3", "4", "5", "6"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})

global f9ko := new HotkeyOutput
f9ko.AddKeysArray({keys: [""], mode: HotkeyOutputMode.HOM_DO_NOTHING})
f9ko.AddKeysArray({keys: ["f8"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
f9ko.AddKeysArray({keys: ["f23"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
f9ko.AddKeysArray({keys: ["lalt"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
f9ko.AddKeysArray({keys: ["a", "d"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})
f9ko.AddKeysArray({keys: ["w", "s"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})
f9ko.AddKeysArray({keys: ["wheeldown", "wheelup"], mode: HotkeyOutputMode.HOM_SEQUENTIAL_SPAM})
f9ko.AddKeysArray({keys: ["mbutton"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})

global f9altko := new HotkeyOutput
f9altko.AddKeysArray({keys: [""], mode: HotkeyOutputMode.HOM_DO_NOTHING})
f9altko.AddKeysArray({keys: ["f8"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
f9altko.AddKeysArray({keys: ["f23"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})

global f10ko := new HotkeyOutput
f10ko.AddKeysArray({keys: ["space"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})

global f11ko := new HotkeyOutput
f11ko.AddKeysArray({keys: ["space"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})

global f9lmbko := new HotkeyOutput
f9lmbko.AddKeysArray({keys: [""], mode: HotkeyOutputMode.HOM_DO_NOTHING})
f9lmbko.AddKeysArray({keys: ["h"], mode: HotkeyOutputMode.HOM_SINGLE_ACTIVATE})

global rmbko := new HotkeyOutput
rmbko.AddKeysArray({keys: [""], mode: HotkeyOutputMode.HOM_DO_NOTHING})
rmbko.AddKeysArray({keys: ["a"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
rmbko.AddKeysArray({keys: ["a", "s"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
rmbko.AddKeysArray({keys: ["a", "s", "d"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
rmbko.AddKeysArray({keys: ["a", "s", "d", "f"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
rmbko.AddKeysArray({keys: ["a", "s", "d", "f", "g"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
rmbko.AddKeysArray({keys: ["a", "s", "d", "f", "g", "h"], mode: HotkeyOutputMode.HOM_CONSTANT_SPAM})
rmbko.AddKeysArray({keys: ["a", "d"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})
rmbko.AddKeysArray({keys: ["w", "s"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})

global f9rmbko := new HotkeyOutput
f9rmbko.AddKeysArray({keys: [""], mode: HotkeyOutputMode.HOM_DO_NOTHING})
f9rmbko.AddKeysArray({keys: ["g"], mode: HotkeyOutputMode.HOM_SINGLE_ACTIVATE})
f9rmbko.AddKeysArray({keys: ["f", "g"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})

SetTimer, Health, 1000

return

~LButton::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		MouseGetPos,,,,ctrl
		if(ctrl="Button1")
		{
			Send {u}
		}
		else if(ctrl="Button2")
		{
			Send {WheelDown}
		}
		
		GetKeyState, state, F23
		if state = D
		{
			f9lmbko.Activate(f9lmbDropDownList)
		}
	}
}
return

~LButton Up::
{
	f9lmbko.Deactivate()
}
return

~RButton::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		MouseGetPos,,,,ctrl
		if(ctrl="Button1")
		{
			Send {Esc}
		}
		else if(ctrl="Button2")
		{
			Send {WheelUp}
		}
		
		GetKeyState, state, F23
		if state = D
		{
			f9rmbko.Activate(f9rmbDropDownList)
		}
		else
		{
			rmbko.Activate(rmbDropDownList)
		}
	}
}
return

~RButton Up::
{
	rmbko.Deactivate()
	f9rmbko.Deactivate()
}
return

F9::
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		f9ko.Activate(f9DropDownList)
		f9altko.Activate(f9altDropDownList)

	}
}
return

F9 Up::
{
	f9ko.Deactivate()
	f9altko.Deactivate()
}
return

ActiveWindowCheck(checkEnabled)
{
	if(checkEnabled)
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

HealthCheck(autoHealEnabled)
{
	PixelGetColor, healthColor, 570, 1027

	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		if(autoHealEnabled = 1)
		{
			;!= 0x0000DB
			if(healthColor = 0x222235)
			{
				Send m
			}
		}
	}
}
return 

OnChange:
Gui, Submit, nohide
mb.topEdgeEnabled := topEdge
mb.leftEdgeEnabled := leftEdge
mb.bottomEdgeEnabled := bottomEdge
mb.rightEdgeEnabled := rightEdge


if(windowTitleDropDownList = "")
{
	activeWindowCheckEnabled := false
}
else
{
	activeWindowCheckEnabled := true
	windowTitle := windowTitleDropDownList
}

if(mouseMonitor)
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		mb.Start()
	}
}
else
{
	mb.Stop()
}
return

Health: 
HealthCheck(autoHeal)
return 

GuiClose:
exit:
{
	exitapp
}
return