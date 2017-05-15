DruildBalance:
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