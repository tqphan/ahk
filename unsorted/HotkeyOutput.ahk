class HotkeyOutput
{
	__New()
	{
		this.outputKeysArray := Object()
		this.activated := false
		this.lastActivatedIndex := 0
		this.lastActivatedKeyIndex := 0
		this.interval := 250
        this.timer := ObjBindMethod(this, "Tick")
    }
	
	Test2()
	{
		{
			tt := this.IsValidOutputIndex(4)
			MsgBox, % tt
		} 
	}
	
	AddKeysArray(arr)
	{
		this.outputKeysArray.Insert(arr)
	}

	Activate(outputIndex)
	{
		if ( (not this.activated) and (this.IsValidOutputIndex(outputIndex) ) )
		{
		
			mode := this.outputKeysArray[outputIndex].mode
		
			if (mode = HotkeyOutputMode.HOM_DIRECT_REMAP)
			{
				Loop % this.outputKeysArray[outputIndex].keys.Length()
					this.SendKey(this.outputKeysArray[outputIndex].keys[A_Index], "down")
			}
			else if (mode = HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE)
			{
				if (this.IsValidKeyIndex(outputIndex, this.lastActivatedKeyIndex))
				{
					this.SendKey(this.outputKeysArray[outputIndex].keys[this.lastActivatedKeyIndex], "down")
				}
				else
				{
					if (this.outputKeysArray[outputIndex].keys.MinIndex() >= 1)
					{
						this.lastActivatedKeyIndex := 1
						this.SendKey(this.outputKeysArray[outputIndex].keys[this.lastActivatedKeyIndex], "down")
					}
				}
			}
			else if (mode = HotkeyOutputMode.HOM_OSCILLATING_SEQUENCE)
			{
			
			}
			else if (mode = HotkeyOutputMode.HOM_CONSTANT_SPAM)
			{
				this.lastActivatedIndex := outputIndex
				timer := this.timer
				SetTimer % timer, % this.interval
			}
			else if (mode = HotkeyOutputMode.HOM_SINGLE_ACTIVATE)
			{
				Loop % this.outputKeysArray[outputIndex].keys.Length()
				{
					this.SendKey(this.outputKeysArray[outputIndex].keys[A_Index], "down")
					this.SendKey(this.outputKeysArray[outputIndex].keys[A_Index], "up")
				}

			}
			else if (mode = HotkeyOutputMode.HOM_SEQUENTIAL_SPAM)
			{
				if (this.IsValidKeyIndex(outputIndex, this.lastActivatedKeyIndex))
				{
					this.lastActivatedIndex := outputIndex
					timer := this.timer
					SetTimer % timer, % this.interval
				}
				else
				{
					if (this.outputKeysArray[outputIndex].keys.MinIndex() >= 1)
					{
						this.lastActivatedKeyIndex := 1
						timer := this.timer
						SetTimer % timer, % this.interval
					}
				}
			
			}
			else
			{
				return
			}
			this.lastActivatedIndex := outputIndex
			this.activated := true
		}
	}
	Deactivate()
	{
	
		if ((this.activated) and (this.IsValidOutputIndex(this.lastActivatedIndex)))
		{
		
			mode := this.outputKeysArray[this.lastActivatedIndex].mode
		
			if(mode = HotkeyOutputMode.HOM_DIRECT_REMAP)
			{
				Loop % this.outputKeysArray[this.lastActivatedIndex].keys.Length()
					this.SendKey(this.outputKeysArray[this.lastActivatedIndex].keys[A_Index], "up")
			}
			else if (mode = HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE)
			{
				if (this.IsValidKeyIndex(this.lastActivatedIndex, this.lastActivatedKeyIndex))
				{
					this.SendKey(this.outputKeysArray[this.lastActivatedIndex].keys[this.lastActivatedKeyIndex], "up")
					nextIndex := this.lastActivatedKeyIndex + 1
					if (nextIndex > this.outputKeysArray[this.lastActivatedIndex].keys.MaxIndex())
						this.lastActivatedKeyIndex := 0
					else
						this.lastActivatedKeyIndex := nextIndex
				}
			}
			else if (mode = HotkeyOutputMode.HOM_OSCILLATING_SEQUENCE)
			{
			}
			else if (mode = HotkeyOutputMode.HOM_CONSTANT_SPAM)
			{
				timer := this.timer
				SetTimer % timer, Off
				this.lastActivatedIndex := 0
			}
			else if (mode = HotkeyOutputMode.HOM_SINGLE_ACTIVATE)
			{
			
			}
			else if (mode = HotkeyOutputMode.HOM_SEQUENTIAL_SPAM)
			{
				if (this.IsValidKeyIndex(this.lastActivatedIndex, this.lastActivatedKeyIndex))
				{
					timer := this.timer
					SetTimer % timer, Off
					nextIndex := this.lastActivatedKeyIndex + 1
					if (nextIndex > this.outputKeysArray[this.lastActivatedIndex].keys.MaxIndex())
						this.lastActivatedKeyIndex := 0
					else
						this.lastActivatedKeyIndex := nextIndex
				}
			
			}
			else
			{
				return
			}
			this.lastActivatedIndex := 0
			this.activated := false
		}
	}
	
	IsValidOutputIndex(index)
	{
		if((index >= this.outputKeysArray.MinIndex()) and (index <= this.outputKeysArray.MaxIndex()))
		{
			return true
		}
		return false
	}
	
	IsValidKeyIndex(oIndex, kIndex)
	{
		if((kIndex >= this.outputKeysArray[oIndex].keys.MinIndex()) and (kIndex <= this.outputKeysArray[oIndex].keys.MaxIndex()))
		{
			return true
		}
		return false
	}
	
	Tick()
	{
		if(this.outputKeysArray[this.lastActivatedIndex].mode = HotkeyOutputMode.HOM_CONSTANT_SPAM)
		{
			Loop % this.outputKeysArray[this.lastActivatedIndex].keys.Length()
			{
				this.SendKey(this.outputKeysArray[this.lastActivatedIndex].keys[A_Index], "down")
				this.SendKey(this.outputKeysArray[this.lastActivatedIndex].keys[A_Index], "up")
			}		
		}
		else if(this.outputKeysArray[this.lastActivatedIndex].mode = HotkeyOutputMode.HOM_SEQUENTIAL_SPAM)
		{
			this.SendKey(this.outputKeysArray[this.lastActivatedIndex].keys[this.lastActivatedKeyIndex], "down")
			this.SendKey(this.outputKeysArray[this.lastActivatedIndex].keys[this.lastActivatedKeyIndex], "up")
		}

    }
	
	SpamKeys(Keys, SpamEnabled, Frequency := 250)
	{

	}

	SendKeysSequence(Keys)
	{
		
	}

	SendKey(key, state)
	{
		Send, {%key% %state%}
	}
}