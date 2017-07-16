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

		this.topEdgeEnabled := false
		this.leftEdgeEnabled := false
		this.bottomEdgeEnabled := false
		this.rightEdgeEnabled := false

		this.topEdgeKey := "f1"
		this.leftEdgeKey := "f2"
		this.bottomEdgeKey := "f3"
		this.rightEdgeKey := "f4"
		
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

		if(this.topEdgeEnabled or this.topEdgeActivated)
		{
			temp := this.topEdgeActivated
			this.topEdgeActivated := this.ProcessCursorCoordinates(temp, ypos, 0, this.topEdgeKey)
		}

		if(this.leftEdgeEnabled or this.leftEdgeActivated)
		{
			temp := this.leftEdgeActivated
			this.leftEdgeActivated := this.ProcessCursorCoordinates(temp, xpos, 0, this.leftEdgeKey)
		}

		if(this.bottomEdgeEnabled or this.bottomEdgeActivated)
		{
			temp := this.bottomEdgeActivated
			this.bottomEdgeActivated := this.ProcessCursorCoordinates(temp, ypos, 1079, this.bottomEdgeKey)
		}

		if(this.rightEdgeEnabled or this.rightEdgeActivated)
		{
			temp := this.rightEdgeActivated
			this.rightEdgeActivated := this.ProcessCursorCoordinates(temp, xpos, 1919, this.rightEdgeKey)
		}
		;ProcessCursorCoordinates(this.bottomEdgeActivated, ypos, 1079, "s")
		;ProcessCursorCoordinates(this.rightEdgeActivated, xpos, 1919, "d")
    }
}