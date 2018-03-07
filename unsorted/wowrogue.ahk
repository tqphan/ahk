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

RogueSubtlety:
;BGR
PixelGetColor, pc, 0, 0
if(pc = 0x000000)
	targetRange := 0
else if(pc = 0x00ff00)
	targetRange := 1
else if(pc = 0xff0000)
	targetRange := 2
else if(pc = 0x0000ff)
	targetRange := 3
else
	targetRange := 4

PixelGetColor, pc, 1, 0
if(pc = 0x000000)
	playerCombo := 1
else if(pc = 0x0000ff)
	playerCombo := 2
else if(pc = 0xff0000)
	playerCombo := 3
else if(pc = 0x00ff00)
	playerCombo := 4
else if(pc = 0xffffff)
	playerCombo := 5

PixelGetColor, pc, 2, 0
if(pc = 0x000000)
	playerPower := 0
else if(pc = 0x0000ff)
	playerPower := 1
else if(pc = 0xff0000)
	playerPower := 2
else if(pc = 0x00ff00)
	playerPower := 3
else
	playerPower := 4

PixelGetColor, pc, 3, 0
if(pc = 0x000000)
	playerHealth := 0
else if(pc = 0x0000ff)
	playerHealth := 1
else if(pc = 0xff0000)
	playerHealth := 2
else if(pc = 0x00ff00)
	playerHealth := 3
else
	playerHealth := 4

PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	interruptable := true
else
	interruptable := false

PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	stealthUsable := true
else
	stealthUsable := false

PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	nightbladeActive := true
else
	nightbladeActive := false

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	shadowstepUsable := true
else
	shadowstepUsable := false

PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	shadowstrikeUsable := true
else
	shadowstrikeUsable := false
if(stealthUsable)
{
	send {f2}
	return
}

if(targetRange = 0)
{
	send 1
	return
}

if(shadowstrikeUsable)
{
	send 2
	return
}

if((not nightbladeActive) and (playerCombo > 1))
{
	send 5
	return
}

if(playerCombo = 5)
{
	send 4
	return
}
else
{
	send 3
}
return