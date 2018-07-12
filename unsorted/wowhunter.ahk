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

PixelGetColor, pc, 1919, 760
if(pc = 0xffffff)
	isPiercingShotUp := true
else
	isPiercingShotUp := false

PixelGetColor, pc, 1919, 728
if(pc = 0xffffff)
	isAMOCUp := true
else
	isAMOCUp := false

PixelGetColor, pc, 1919, 696
if(pc = 0xffffff)
	isTrueShotUp := true
else
	isTrueShotUp := false

PixelGetColor, pc, 1919, 664
if(pc = 0xffffff)
	isTargetCasting := true
else
	isTargetCasting := false

PixelGetColor, pc, 1919, 632
if(pc = 0xffffff)
	shouldHeal := true
else
	shouldHeal := false

PixelGetColor, pc, 1919, 600
if(pc = 0xffffff)
	cs := true
else
	cs := false

if(isChannelingBarage)
	return

if(autoAttack)
	send 1
	
if(pvpGameMode)
	send 9
if(cs)
{
	send 9
	return
}

if(isTargetCasting)
{
	send {f1}
}

if(shouldHeal)
{
	send t
}

if(isTargetCasting)
{
	send {f1}
}

if((not singleTargetMode) and (isBarrageUp))
{
	send 3
	return
}
	
if(isHuntersMarkActive)
{
	send 2
	return
}

if(isAMOCUp)
{
	send {f2}
	return
}

if(isVulnerableActive and isLockAndLoadActive)
{
	send 4
	return
}

if(isTrueShotUp)
{
	if(isLockAndLoadActive and isVulnerableActive)
	{
		send 4
		return	
	}
	else
	{
		if(singleTargetMode)
		{
			send 5
		}
		else
		{
			send 8
		}
		return
	}
}

if(isPiercingShotUp)
{
	send u
	return
}

if(isMarkingTargetActive and (not isHuntersMarkActive))
{
	if(singleTargetMode)
	{
		send 5		
	}
	else
	{
		send 8
	}

}

if(isVulnerableActive or isLockAndLoadActive)
{
	send 4
	return
}

if(isWindbustUp and (not isVulnerableActive))
{
	send 6
	return
}

if(isHighFocus)
{
	send 45
}

	
return

HunterBeastMastery:

PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isHighFocus := true
else
	isHighFocus := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isBeastCleaveActive := true
else
	isBeastCleaveActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isDireBeastActive := true
else
	isDireBeastActive := false
	
PixelGetColor, pc, 1919, 984
if(pc = 0xffffff)
	isDireBeastTwoChargesActive := true
else
	isDireBeastTwoChargesActive := false
	
PixelGetColor, pc, 1919, 952
if(pc = 0xffffff)
	isBestialWrathActive := true
else
	isBestialWrathActive := false
	
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
	isKillCommandUp := true
else
	isKillCommandUp := false

PixelGetColor, pc, 1919, 824
if(pc = 0xffffff)
	isVolleyUp := true
else
	isVolleyUp := false
	

PixelGetColor, pc, 1919, 792
if(pc = 0xffffff)
	isIntimidationUp := true
else
	isIntimidationUp := false

PixelGetColor, pc, 1919, 760
if(pc = 0xffffff)
	isCounterSpellUp := true
else
	isIntimidationUp := false

PixelGetColor, pc, 1919, 728
if(pc = 0xffffff)
	isAMOCUp := true
else
	isAMOCUp := false

PixelGetColor, pc, 1919, 696
if(pc = 0xffffff)
	isShellShieldUp := true
else
	isShellShieldUp := false

PixelGetColor, pc, 1919, 664
if(pc = 0xffffff)
	isFocusCasting := true
else
	isFocusCasting := false

if(isChannelingBarage)
	return

if(autoAttack)
	send 1
	
if(pvpGameMode)
	send 9

;if(((not singleTargetMode) and (not isVolleyUp)) or ((singleTargetMode and isVolleyUp)))
;{
	;send 6
	;return
;}

if(isFocusCasting)
{
	if(isIntimidationUp)
	{
		send {f2}
		return
	}
	else if(isCounterSpellUp)
	{
		send {f1}
		return
	}
	else if(isShellShieldUp)
	{
		send 9
		return
	}
}

if(isKillCommandUp and (singleTargetMode or cleaveTargetMode))
{
	send 3
	return
}

if(isDireBeastTwoChargesActive)
{
	send 2
	return
}

if(isAMOCUp)
{
	send u
	return
}

if(isBestialWrathActive and singleTargetMode)
{
	if(isKillCommandUp)
	{
		send 3
	}
	else
	{
		send 5
	}

	return
}

if(not isDireBeastActive)
{
	send 2
	return
}

if((cleaveTargetMode or multipleTargetMode) and (not isBeastCleaveActive))
{
	send 7
	return
}

if(isHighFocus)
{
	if(singleTargetMode or cleaveTargetMode)
		send 5
	else
		send 7
}

	
return

HunterSurvival:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	mbt := true
else
	mbt := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	sh := true
else
	sh := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	lac := true
else
	lac := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	fs := true
else
	fs := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	cal := true
else
	cal := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	et := true
else
	et := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	hp := true
else
	hp := false

PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	intcast := true
else
	intcast := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	tarri := true
else
	tarri := false
PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	taradd := true
else
	taradd := false
PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	chan := true
else
	chan := false

PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	healpet := true
else
	healpet := false
PixelGetColor, pc, 12, 0
if(pc = 0xffffff)
	healme := true
else
	healme := false
if(chan)
{
	return
}
if(healpet)
{
	send o
	return
}
if(healme)
{
	send t
}
if(taradd)
{
	send 7[68yp
	return
}
if(tarri)
{
	send 8
	return
}

if(intcast)
{
	send {f1}
}
if(hp)
{
	send 2
	return
}
if(lac)
{
	send 4
	return
}
if(mbt)
{
	send 3
	return
}
if(fs)
{
	send 5
	return
}
if(sh)
{
	send i
	return
}
if(cal and not taradd)
{
	send 7
	return
}
if(et)
{
	send 6
	return
}
return