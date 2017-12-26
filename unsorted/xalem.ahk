#SingleInstance force
Gui, +LastFound +AlwaysOnTop +ToolWindow +Border +E0x08000000
Gui, Add, Button, x0 y0 h60 w120, Ultimate
Gui, Show, w120 h60 Center NoActivate
return

~LButton::
{

		MouseGetPos,,,,ctrl
		if(ctrl="Button1")
		{
			Send {Space}
            Sleep, 200
			Send {Space}
            Sleep, 200
			Send {F2}
            Sleep, 200
			Send {Space}
		}
        
}
return

~RButton::
{

		MouseGetPos,,,,ctrl
		if(ctrl="Button1")
		{
			Send {Space}
            Sleep, 200
			Send {Space}
            Sleep, 200
			Send {F3}
            Sleep, 200
			Send {Space}
		}
        
}
return