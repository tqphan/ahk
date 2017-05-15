~F10::
{
    MouseGetPos, begin_x, begin_y
    while (1)
    {
		PixelGetColor, bColor, 960, 670
		if(bColor = 0xF3FFF7)
		{
			DllCall("SetCursorPos", int, 920, int, 720)
			send {LButton}
		}
		else
		{
			send {LButton}
		}
		sleep, 10
		
		GetKeyState, state, F10
		if state = U
		{
			break
		}
    }
	ToolTip
}
return

doit:
PixelGetColor, bColor, 1025, 766
if((bColor = 0x79B3D3) or (bColor = 0x95CDE8))
{
	DllCall("SetCursorPos", int, 1025, int, 766)
	send {LButton}
}
else
{
	send {LButton}
	send {LButton}
}

return