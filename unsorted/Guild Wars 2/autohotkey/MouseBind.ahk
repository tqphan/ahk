class MouseBind
{
    __New()
	{
		CoordMode, mouse, screen
        this.interval := 100
		this.started := false
		
		this.topEdgeActivated := false
		this.leftEdgeActivated := false
		this.bottomEdgeActivated := false
		this.rightEdgeActivated := false
		
        this.timer := ObjBindMethod(this, "Tick")
    }
    Start()
	{
		if(this.started)
			return
			
        timer := this.timer
        SetTimer % timer, % this.interval
		this.started := true
    }
    Stop()
	{
		if(not this.started)
			return
			
        timer := this.timer
        SetTimer % timer, Off
		this.started := false
    }
	
	ProcessCursorCoordinates(ByRef edge, lhs, rhs, key)
	{
		if (lhs = rhs)
		{
			if (edge = false)
			{
				this.SendKey(key, "down")
				edge := true
			}
		}
		else 
		{
			if (edge = true)
			{
				this.SendKey(key, "up")
				edge := false 
			}
		}
	}

	SendKey(key, state)
	{
		Send, {%key% %state%}
	}
	
    Tick()
	{
		MouseGetPos, xpos, ypos
		this.ProcessCursorCoordinates(this.topEdgeActivated, ypos, 0, "a")
		;ProcessCursorCoordinates(this.leftEdgeActivated, xpos, 0, "a")
		;ProcessCursorCoordinates(this.bottomEdgeActivated, ypos, 1079, "s")
		;ProcessCursorCoordinates(this.rightEdgeActivated, xpos, 1919, "d")
    }
}