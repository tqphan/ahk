Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Radio, rad checked 1 vDPSType, 1
Gui, Add, Radio, rad, 2
Gui, Add, Radio, rad, 3
Gui, Show, w40 h70 Center NoActivate
return

F11::
{
Gui, Submit, NoHide

if(DPSType = 1)
{
  MsgBox, 1
}
else if(DPSType = 2)
{
  MsgBox, 2
}

}
return

MyLabel: 
MsgBox, %Class%
return 

GuiEscape:
GuiClose:
exitapp
return