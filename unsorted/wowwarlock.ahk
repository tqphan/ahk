WarlockAffliction:
talent60 := 2

PixelGetColor, pc, 0, 1079
if(pc = 0xffffff)
	isMoving := true
else
	isMoving := false

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isAgonyActive := true
else
	isAgonyActive := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isCorruptionActive := true
else
	isCorruptionActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isUnstableAffictionActive := true
else
	isUnstableAffictionActive := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isSiphonLifeActive := true
else
	isSiphonLifeActive := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isMaxSoulShards := true
else
	isMaxSoulShards := false
	
PixelGetColor, pc, 1919, 920
if(pc = 0xffffff)
	hasSoulShard := true
else
	hasSoulShard := false
	
PixelGetColor, pc, 1919, 988
if(pc = 0xffffff)
	reapSoulsMax := true
else
	reapSoulsMax := false
	
PixelGetColor, pc, 1919, 956
if(pc = 0xffffff)
	seedOfCorruptionActive := true
else
	seedOfCorruptionActive := false

if(not isAgonyActive)
{
	send 2
	return
}

if(isMoving)
{
	if(not isCorruptionActive)
	{
		send 1
		return
	}
	if(talent60 = 1)
	{
		if(not isSiphonLifeActive)
		{
			send 4
			return
		}
	}
}
else
{
	if(singleTargetMode)
	{
		if((hasSoulShard and (not isUnstableAffictionActive)) or (isMaxSoulShards))
		{
			send 3
			return
		}
		if(not isCorruptionActive)
		{
			send 1
			return
		}
		if(talent60 = 1)
		{
			if(not isSiphonLifeActive)
			{
				send 4
				return
			}
		}		
		send 6
	}
	else
	{
		if(hasSoulShard and (not seedOfCorruptionActive))
		{
			send 5
			return
		}
		if(not isCorruptionActive)
		{
			send 1
			return
		}
	}
}
return

WarlockDemonology:

return

WarlockDestruction:

return
