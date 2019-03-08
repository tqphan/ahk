
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
;Gui, Add, Button,   x00 y00 w0 h0 Default hidden gGo
Gui, Add, Progress, x20 y20 w200 h30 BackgroundRed disabled vPrg
Gui, Add, Text,     x30 y30 BackgroundTrans vTX cBlack, Some Text
Gui, Add, Edit,     x20 y60 w200 vEdi, Yellow
gui , show
return

ExitApp
esc::ExitApp

Go:
	gui, submit, NoHide	
	cl := "Black"
	if edi in red,blue,black,green
		cl := "White"
	guicontrol, +Background%Edi%, Prg 
	guicontrol, ,TX, Some text
	guicontrol, +c%cl%, TX
return

GuiEscape:
GuiClose:
	ExitApp
return	