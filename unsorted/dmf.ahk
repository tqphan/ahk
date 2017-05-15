Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Checkbox, x0 y0 w120 h100 vw gOnChange 0x1000, 3
Gui, Show, w120 h100 Center NoActivate
return

OnChange:
Gui, Submit, nohide
if(w)
	send {w down}
else
	send {w up}
return

GuiClose:
exit:
{
	exitapp
}
return
