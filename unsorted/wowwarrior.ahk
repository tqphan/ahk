WarriorArms:

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isInMeleeRange := true
else
	isInMeleeRange := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isFullRage := true
else
	isFullRage := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isExecutable := true
else
	isExecutable := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isMortalStrikeUp := true
else
	isMortalStrikeUp := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isColossusSmashUp := true
else
	isColossusSmashUp := false
	
PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isHamstringActive := true
else
	isHamstringActive := false

PixelGetColor, pc, 1919, 888
if(pc = 0xffffff)
	isWarbreakerUp := true
else
	isWarbreakerUp := false
	
PixelGetColor, pc, 1919, 856
if(pc = 0xffffff)
	interruptable := true
else
	interruptable := false

PixelGetColor, pc, 1919, 824
if(pc = 0xffffff)
	hp := true
else
	hp := false

PixelGetColor, pc, 1919, 792
if(pc = 0xffffff)
	shouldAE := true
else
	shouldAE := false

PixelGetColor, pc, 1919, 760
if(pc = 0xffffff)
	tdw := true
else
	tdw := false

PixelGetColor, pc, 1919, 728
if(pc = 0xffffff)
	tri := true
else
	tri := false

send o
if(tri)
{
	send 7
	return
}

if(interruptable)
{
	send {f1}
	return
}

if(autoAttack)
	send 1

if(not isInMeleeRange)
	return

if(shouldAE)
{
	send 136t7
	return
}

if(isWarbreakerUp)
{
	send 8
	return
}
if(pvpGameMode and (not isHamstringActive))
	send 9

if(multipleTargetMode)
{
	send 67
	return
}
if(isColossusSmashUp)
{
	send 2
	return
}
if(isExecutable)
{
	send 3
	return
}

if(isMortalStrikeUp)
{
	send 4
	return
}

if(isFullRage)
{
	if(singleTargetMode)
	{
		send 5
	}
	else
	{
		send 7
	}
	return
}	
	
return

WarriorFury:

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isInMeleeRange := true
else
	isInMeleeRange := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isFullRage := true
else
	isFullRage := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isExecutable := true
else
	isExecutable := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isEnrage := true
else
	isEnrage := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isMeatCleaverActive := true
else
	isMeatCleaverActive := false
	
PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isInPiercingHowlRange := true
else
	isInPiercingHowlRange := false

PixelGetColor, pc, 1919, 888
if(pc = 0xffffff)
	isPiercingHowlActive := true
else
	isPiercingHowlActive := false
	
if(autoAttack)
	send 1
	
if(pvpGameMode and isInPiercingHowlRange and (not isPiercingHowlActive))
	send 9

if(singleTargetMode)
{
	if(isFullRage)
	{
		if(isEnrage and isExecutable)
			send 2
		else
			send 3
	}
	else
	{
		if(isInMeleeRange)
			send 8
		if(isEnrage)
		{
			if(isExecutable)
				send 2546
			else
				send 456
		}
		else
		{
			if(isExecutable)
				send 546
			else
				send 3456
		}
	}
}
else if(cleaveTargetMode)
{
	if(isMeatCleaverActive)
	{
		send 3546
	}
	else
	{
		if(isInMeleeRange)
			send i87
	}
}
else if(multipleTargetMode)
{
	if(isMeatCleaverActive)
	{
		send 35
	}
	else
	{
		if(isInMeleeRange)
			send i87
	}
}
return

WarriorProtection:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	sslam := true
else
	sslam := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	revenge := true
else
	revenge := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	tclap := true
else
	tclap := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	ivic := true
else
	ivic := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	sref := true
else
	sref := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	sbolt := true
else
	sbolt := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	pummel := true
else
	pummel := false
PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	intercept := true
else
	intercept := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	ipain := true
else
	ipain := false
PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	sblock := true
else
	sblock := false
PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	chan := true
else
	chan := false

if(sblock)
{
	send 7
}
if(sref)
{
	send u
}
if(pummel)
{
	send 8
}
if(sbolt)
{
	send f2
	return
}
if(intercept and autoAttack)
{
	send 1
	return
}
if(sslam)
{
	send 2
	return
}
if(revenge)
{
	send 4
	return
}
if(tclap)
{
	send 5
	return
}
if(ivic)
{
	send 3
	return
}
if(ipain)
{
	send v
	return
}
return
