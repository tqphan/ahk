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
	isWarbreakerUp := false

PixelGetColor, pc, 1919, 888
if(pc = 0xffffff)
	isWarbreakerUp := true
else
	isWarbreakerUpisWarbreakerUp := false
	

if(autoAttack)
	send 1

if(not isInMeleeRange)
	return

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
if(isWarbreakerUp)
{
	send 8
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

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isInMeleeRange := true
else
	isInMeleeRange := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isShieldBlockActive := true
else
	isShieldBlockActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isIgnorePainActive := true
else
	isIgnorePainActive := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isRevengeUp := true
else
	isRevengeUp := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isShieldSlamUp := true
else
	isShieldSlamUp := false
	
PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isInThunderClapRange := true
else
	isInThunderClapRange := false

PixelGetColor, pc, 1919, 888
if(pc = 0xffffff)
	isThunderClapActive := true
else
	isThunderClapActive := false
	
if(autoAttack)
	send 1
	
if(pvpGameMode and isInThunderClapRange and (not isThunderClapActive))
	send 9


if(singleTargetMode)
{
	send 324
}
else
{
	send 234
}

return
