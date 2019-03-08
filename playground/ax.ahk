; Example of how to (mostly) encapsulate a GUI control within a class.

#SingleInstance, force

; Create a custom Edit box
Class CTest {
	__New(name){
		local CtrlHwnd

		; Store friendly name
		this.__Name := name

		; Create the GUI control
		Gui, Add, Progress, w200 h30 BackgroundRed hwndCtrlHwnd
		fn := this.OnChange.Bind(this)
		GuiControl +g, %CtrlHwnd%, % fn

		; Store HWND of control for future reference
		this.__Handle := CtrlHwnd
	}

	; Mimic GuiControlGet behavior.
	GuiControlGet(cmd := "", value := ""){
		GuiControlGet, ov, %cmd%, % this.__Handle, % value
		return ov
	}
	t(){
		 GuiControl, +BackgroundBlue, % this.__Handle
	}
	OnChange(){
		Tooltip % this.__Name " contents: " this.GuiControlGet()
	}
}

test1 := new CTest("One")
test2 := new CTest("Two")

Gui Add, Text, x20 y20 BackgroundTrans, Text over blue background!
Gui, Show
Return

F3::
{
test1.t()
}
return

GuiClose:
	ExitApp