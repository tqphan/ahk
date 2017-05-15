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
	isColossusSmashActive := true
else
	isColossusSmashActive := false

	PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isCleaveActive := true
else
	isCleaveActive := false

PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	isHamstringActive := true
else
	isHamstringActive := false

PixelGetColor, pc, 1919, 888
if(pc = 0xffffff)
	isRendActive := true
else
	isRendActive := false
	
if(pvpGameMode and (not isHamstringActive))
	send 9
	
if(singleTargetMode)
{
	if(not isRendActive)
	{
		send 0
		return
	}
	if(isFullRage)
	{
		send 2345
	}
	else
	{
		send 234
	}
}
else if(multipleTargetMode)
{
	if(isCleaveActive)
	{
		send 276
	}
	else
	{
		send 267
	}
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
	
if(autoFace)
	send z
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
	
if(autoFace)
	send z
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
