HunterMarksmanship:

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isMarkingTargetActive := true
else
	isMarkingTargetActive := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isHuntersMarkActive := true
else
	isHuntersMarkActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isVulnerableActive := true
else
	isVulnerableActive := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isSideWindersTwoChargesActive := true
else
	isSideWindersTwoChargesActive := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isSideWindersOneChargeActive := true
else
	isSideWindersOneChargeActive := false
	
PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isLockAndLoadActive := true
else
	isLockAndLoadActive := false

PixelGetColor, pc, 1919, 888
if(pc = 0xffffff)
	isChannelingBarage := true
else
	isChannelingBarage := false

PixelGetColor, pc, 1919, 856
if(pc = 0xffffff)
	isHighFocus := true
else
	isHighFocus := false

PixelGetColor, pc, 1919, 824
if(pc = 0xffffff)
	isWindbustUp := true
else
	isWindbustUp := false
	

PixelGetColor, pc, 1919, 792
if(pc = 0xffffff)
	isBarrageUp := true
else
	isBarrageUp := false
	
if(isChannelingBarage)
	return

if(autoAttack)
	send 1
	
if(pvpGameMode)
	send 9

if((not singleTargetMode) and (isBarrageUp))
{
	send 3
	return
}

if(isWindbustUp)
{
	send 6
	return
}
	
if(isHuntersMarkActive)
{
	send 2
	return
}
if(isMarkingTargetActive and isSideWindersOneChargeActive and (not isHuntersMarkActive))
{
	send 5
	return
}

if(isSideWindersTwoChargesActive)
{
	send 5
	return
}

if(isVulnerableActive or isLockAndLoadActive)
{
	send 4
	return
}

if(isHighFocus)
{
	send 4
}

	
return
