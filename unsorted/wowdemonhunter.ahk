DemonHunterHavoc:
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
	playerHealth := 0
else if(pc = 0x0000ff)
	playerHealth := 1
else if(pc = 0xff0000)
	playerHealth := 2
else if(pc = 0x00ff00)
	playerHealth := 3
else
	playerHealth := 4

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
if(pc = 0xffffff)
	interruptable := true
else
	interruptable := false

PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	felbladeUsable := true
else
	felbladeUsable := false

PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	bladeDanceUsable := true
else
	bladeDanceUsable := false

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	throwGlaiveUsable := true
else
	throwGlaiveUsable := false

PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	furyOfTheIllidaryUsable := true
else
	furyOfTheIllidaryUsable := false

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	eyeBeamUsable := true
else
	eyeBeamUsable := false

PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	felEruptionUsable := true
else
	felEruptionUsable := false

PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	metamorphosisUsable := true
else
	metamorphosisUsable := false

PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	metamorphosisActive := true
else
	metamorphosisActive := false

if(targetRange = 1 or targetRange = 2)
{
	eyeBeamInRange := true
	bladeDanceInRange := true
	furyOfTheIllidaryInRange := true
}
else
{
	eyeBeamInRange := false
	bladeDanceInRange := false
	furyOfTheIllidaryInRange := false
}

if(targetRange = 0)
{
	send 1
	return
}

if(targetRange > 2 and felbladeUsable and autoAttack)
{
	send 6
	return
}

if(throwGlaiveUsable)
{
	send 4
	return
}

if(bladeDanceInRange and bladeDanceUsable)
{
	send 2
	return
}

if(eyeBeamInRange and eyeBeamUsable and multipleTargetMode)
{
	send 8
	return
}

if(furyOfTheIllidaryInRange and furyOfTheIllidaryUsable and (cleaveTargetMode or multipleTargetMode))
{
	send 7
	return
}

if(targetRange = 1)
{
	if(playerPower > 2)
		send 3
	else
		send 5
}
else
{
	send 4
}



	
return