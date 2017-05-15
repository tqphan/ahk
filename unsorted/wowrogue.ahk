RogueAssassination:

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isInMeleeRange := true
else
	isInMeleeRange := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isInCombat := true
else
	isInCombat := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isInStealth := true
else
	isInStealth := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isVendettaUsable := true
else
	isVendettaUsable := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isInteruptable := true
else
	isInteruptable := false
	
PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isRuptureActive := true
else
	isRuptureActive := false

PixelGetColor, pc, 1919, 888
if(pc = 0xff0000)
	energy := 1
else if(pc = 0x00ff00)
	energy := 2
else if(pc = 0x0000ff)
	energy := 3
else
	energy := 0
	
PixelGetColor, pc, 1919, 856
if(pc = 0x0000ff)
	combo := 1
else if(pc = 0xff0000)
	combo := 2
else if(pc = 0x00ff00)
	combo := 3
else
	combo := 0

PixelGetColor, pc, 1919, 822
if(pc = 0x0000ff)
	health := 1
else if(pc = 0xff0000)
	health := 2
else if(pc = 0x00ff00)
	health := 3
else
	health := 0

if(singleTargetMode)
{
	if(combo = 3)
	{
		if(isRuptureActive)
		{
			send 5
		}
		else
		{
			send 4
		}
	}
	else
	{
		send 32
	}
}
else if(cleaveTargetMode)
{
	if(combo > 1)
	{
		if(not isRuptureActive)
		{
			send 4
		}
	}
	else
	{
		send 8
	}
}
else if(multipleTargetMode)
{
	send {backspace}
}
return
