MageFrost:
PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isIceBarrierActive := true
else
	isIceBarrierActive := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isFingersOfFrostActive := true
else
	isFingersOfFrostActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isBrainFreezeActive := true
else
	isBrainFreezeActive := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isHighIciclesPower := true
else
	isHighAstralPower := false

PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isEbonboltUsable := true
else
	isEbonboltUsable := false

PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isAoEUsable := true
else
	isAoEUsable := false

if((not singleTargetMode) and isAoEUsable)
{
	send 765
	return
}

if(isEbonboltUsable and (not isBrainFreezeActive))
{
	send 4
	return
}

if(isBrainFreezeActive)
{
	send 3
	return
}
if(isFingersOfFrostActive)
{
	send 2
	return
}
else
{
	send 1
}	


return