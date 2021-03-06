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

RogueOutlaw:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	ambush := true
else
	ambush := false

PixelGetColor, pc, 2, 0
if(pc = 0x0000ff)
	combo := 1
else if(pc = 0xff0000)
	combo := 2
else if(pc = 0x00ff00)
	combo := 3
else if(pc = 0xffffff)
	combo := 4
else
	combo := 0

PixelGetColor, pc, 4, 0
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

PixelGetColor, pc, 6, 0
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

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	stealthUsable := true
else
	stealthUsable := false

PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	rtb := true
else
	rtb := false

PixelGetColor, pc, 12, 0
if(pc = 0xffffff)
	bte := true
else
	bte := false

PixelGetColor, pc, 14, 0
if(pc = 0xffffff)
	ps := true
else
	ps := false

PixelGetColor, pc, 16, 0
if(pc = 0xffffff)
	dispatch := true
else
	dispatch := false

PixelGetColor, pc, 18, 0
if(pc = 0xffffff)
	bf := true
else
	bf := false

PixelGetColor, pc, 20, 0
if(pc = 0xffffff)
	rb := true
else
	rb := false

if(stealthUsable)
{
	send {f2}
	return
}
if(ambush)
{
	send 2
	return
}

if(not singleTargetMode and bf)
{
	send 8
	return
}

if(rb)
{
	send 7
	return
}

if(rtb and combo = 4)
{
	send 5
	return
}

if(bte)
{
	send 4
	return
}

if(dispatch)
{
	send 6
	return
}

if(ps)
{
	send 3
	return
}

send 2

return

RogueSubtlety:
;BGR
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	backstab := true
else
	backstab := false

PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	eviserate := true
else
	eviserate := false

PixelGetColor, pc, 4, 0
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

PixelGetColor, pc, 6, 0
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

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	interruptable := true
else
	interruptable := false

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	stealthUsable := true
else
	stealthUsable := false

PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	nightbladeActive := true
else
	nightbladeActive := false

PixelGetColor, pc, 12, 0
if(pc = 0xffffff)
	shadowstepUsable := true
else
	shadowstepUsable := false

PixelGetColor, pc, 14, 0
if(pc = 0xffffff)
	shadowstrikeUsable := true
else
	shadowstrikeUsable := false

if(cleaveTargetMode)
{
	send 8
	return
}

if(stealthUsable)
{
	send {f2}
	return
}

; if(targetRange = 0)
; {
; 	send 1
; 	return
; }

if(shadowstrikeUsable)
{
	send 2
	return
}

if(nightbladeActive)
{
	send 5
	return
}

if(eviserate)
{
	send 4
	return
}

if(backstab)
{
	send 3
	return
}

return