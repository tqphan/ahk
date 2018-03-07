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

if(interruptable and eta)
{
	send {F1}
}

if(zeta and playerHealth = 0)
{
	send {F4}
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

DemonHunterVengeance:
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
if(pc = 0x000000)
	fragments := 1
else if(pc = 0x0000ff)
	fragments := 2
else if(pc = 0xff0000)
	fragments := 3
else if(pc = 0x00ff00)
	fragments := 4
else if(pc = 0xffffff)
	fragments := 5
else
	fragments := 0

PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	soulCarverUsable := true
else
	soulCarverUsable := false

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	immolationAuraUsable := true
else
	immolationAuraUsable := false

PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	sigilOfFlameUsable := true
else
	sigilOfFlameUsable := false

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	frailtyActive := true
else
	frailtyActive := false

PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	throwGlaiveUsable := true
else
	throwGlaiveUsable := false

if(interruptable and eta)
{
	send {F1}
}

if(zeta and playerHealth = 0)
{
	send {F4}
}

if(targetRange = 0)
{
	send 1
	return
}

if(targetRange > 1)
{
	send 23
	return
}

if(fragments = 4 or fragments = 5)
{
	send 8
	return
}

if(fragments = 0 and soulCarverUsable)
{
	send 4
	return
}

if(immolationAuraUsable)
{
	send i
	return
}

if(sigilOfFlameUsable)
{
	send 9
	return
}

if(playerPower > 2)
{
	send 6
}
else
{
	send 7
}

return