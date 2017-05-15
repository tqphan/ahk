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
	
	ProcessCursorCoordinates(edge, lhs, rhs, key)
	{
		if (lhs = rhs)
		{
			if (edge = false)
			{
				this.SendKey(key, "down")
				return true
			}
			else
			{
				return edge
			}
		}
		else 
		{
			if (edge = true)
			{
				this.SendKey(key, "up")
				return false 
			}
			else
			{
				return edge
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
		temp := this.topEdgeActivated
		this.topEdgeActivated := this.ProcessCursorCoordinates(temp, ypos, 0, "numlock")
		
		temp := this.leftEdgeActivated
		this.leftEdgeActivated := this.ProcessCursorCoordinates(temp, xpos, 0, "0")
		;ProcessCursorCoordinates(this.bottomEdgeActivated, ypos, 1079, "s")
		;ProcessCursorCoordinates(this.rightEdgeActivated, xpos, 1919, "d")
    }
}