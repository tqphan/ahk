#Persistent
CoordMode, mouse, screen
SetTimer, DoWork, 100

DoWork()
{
	static topEdge := false
	static leftEdge := false
	static bottomEdge := false
	MouseGetPos, xpos, ypos

	if (ypos = 0)
	{
		if (topEdge = false)
		{
			GetKeyState, state, w
			if state = D
			{
				Send {w up}
			}
			else
			{
				Send {w down}
			}
		  
			topEdge := true
		}
	}
	else 
	{
		if (topEdge = true)
		{
			topEdge := false 
		}
	}
  

  
}

f9::
{
	send 1
}
return
