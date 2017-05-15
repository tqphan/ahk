#Persistent
CoordMode, mouse, screen
SetTimer, WatchCursor, 100

WatchCursor()
{
	static topEdgeActivated := false
	static leftEdgeActivated := false
	static bottomEdgeActivated := false
	static rightEdgeActivated := false

	MouseGetPos, xpos, ypos
	ProcessCursorCoordinates(topEdgeActivated, ypos, 0, "a")
	;ProcessCursorCoordinates(leftEdgeActivated, xpos, 0, "a")
	;ProcessCursorCoordinates(bottomEdgeActivated, ypos, 1079, "s")
	;ProcessCursorCoordinates(rightEdgeActivated, xpos, 1919, "d")
}

ProcessCursorCoordinates(ByRef edge, lhs, rhs, key)
{
	if (lhs = rhs)
	{
		if (edge = false)
		{
			SendKey(key, "down")
			edge := true
		}
	}
	else 
	{
		if (edge = true)
		{
			SendKey(key, "up")
			edge := false 
		}
	}
}

SendKey(key, state)
{
	Send, {%key% %state%}
}

F12::
{
 Send {Space}
}
return 