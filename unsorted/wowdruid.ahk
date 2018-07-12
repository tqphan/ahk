DruidBalance:
PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isMoonfireActive := true
else
	isMoonfireActive := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isSunfireActive := true
else
	isSunfireActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isStellarFlareActive := true
else
	isStellarFlareActive := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isHighAstralPower := true
else
	isHighAstralPower := false
	
if(not isMoonfireActive)
{
	send 1
	return
}
if(not isSunfireActive)
{
	send 2
	return
}

if(not isStellarFlareActive)
{
	send 34
	return
}

if(isHighAstralPower)
{
	if(singleTargetMode)
		send 5
	else if(multipleTargetMode)
		send 8
	return
}
else
{
	if(singleTargetMode)
		send 4
	else if(multipleTargetMode)
		send 7
	return
}
return

DruidGuardian:

PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	mfire := true
else
	mfire := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	maul := true
else
	maul := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	mangle := true
else
	mangle := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	thrash := true
else
	thrash := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	swipe := true
else
	swipe := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	ifur := true
else
	ifur := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	regen := true
else
	regen := false
PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	roar := true
else
	roar := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	ipain := true
else
	ipain := false
PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	sbash := true
else
	sbash := false
PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	stun := true
else
	stun := false
PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	sinst := true
else
	sinst := false

if(sbash)
{
	send {f1}
}
if(ifur)
{
	send y
}
if(regen)
{
	send u
}
if(sinst)
{
	send i
}
if(stun)
{
	send o
	return
}
if(mfire)
{
	send 6
	return
}
if(maul)
{
	send 2
	return
}
if(mangle)
{
	send 3
	return
}
if(thrash)
{
	send 4
	return
}
if(swipe)
{
	send 5
	return
}
return