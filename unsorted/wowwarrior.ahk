WarriorArms:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	rend := true
else
	rend := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	skullsplitter := true
else
	skullsplitter := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	csmash := true
else
	csmash := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	sdexecute := true
else
	sdexecute := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	mstrike := true
else
	mstrike := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	bladestorm := true
else
	bladestorm := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	overpower := true
else
	overpower := false
PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	stwhirlwind := true
else
	stwhirlwind := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	slam := true
else
	slam := false
PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	stexecute := true
else
	stexecute := false
PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	swstrike := true
else
	swstrike := false
PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	cleave := true
else
	cleave := false
PixelGetColor, pc, 12, 0
if(pc = 0xffffff)
	warbreaker := true
else
	warbreaker := false
PixelGetColor, pc, 13, 0
if(pc = 0xffffff)
	mtwhirlwind := true
else
	mtwhirlwind := false
PixelGetColor, pc, 14, 0
if(pc = 0xffffff)
	mtcsmash := true
else
	mtcsmash := false
PixelGetColor, pc, 13, 0
if(pc = 0xffffff)
	hamstring := true
else
	hamstring := false
PixelGetColor, pc, 14, 0
if(pc = 0xffffff)
	charge := true
else
	charge := false
if(autoAttack and charge)
{
	send 1
	return
}
if(pvpGameMode and hamstring)
{
	send {f2}
	return
}
if(multipleTargetMode)
{
	if(swstrike)
	{
		send o
		return
	}
	if(mtcsmash)
	{
		send 2
		return
	}
	if(cleave)
	{
		send 7
		return
	}
	if(mtwhirlwind)
	{
		send 8
		return
	}
	if(overpower)
	{
		send p
		return
	}
	return
}


if(rend)
{
	send 9
	return
}
if(skullsplitter)
{
	send 5
	return
}
if(zeta and cleaveTargetMode and swstrike)
{
	send o
	return
}
if(csmash)
{
	send 2
	return
}
if(sdexecute)
{
	send 3
	return
}
if(mstrike)
{
	send 4
	return
}
if(overpower)
{
	send p
	return
}
if(stexecute)
{
	send 3
	return
}
if(stwhirlwind)
{
	send 8
	return
}
else if(slam)
{
	send 6
	return
}
	
return

WarriorFury:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	fslash := true
else
	fslash := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	siegebreaker := true
else
	siegebreaker := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	recklessness := true
else
	recklessness := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	rampage := true
else
	rampage := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	execute := true
else
	execute := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	bloodthirst1 := true
else
	bloodthirst1 := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	rblow1 := true
else
	rblow1 := false
PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	bloodthirst2 := true
else
	bloodthirst2 := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	droar := true
else
	droar := false
PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	bladestorm := true
else
	bladestorm := false
PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	rblow2 := true
else
	rblow2 := false

PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	whirlwind_mt := true
else
	whirlwind_mt := false

PixelGetColor, pc, 12, 0
if(pc = 0xffffff)
	howl := true
else
	howl := false

PixelGetColor, pc, 13, 0
if(pc = 0xffffff)
	chargefury := true
else
	chargefury := false

PixelGetColor, pc, 14, 0
if(pc = 0xffffff)
	vrushfury := true
else
	vrushfury := false
if(pvpGameMode and howl)
{
	send 9
	return
}

if(autoAttack and chargefury)
{
	send 1
	return
}

if(not singleTargetMode and whirlwind_mt)
{
	send 7
	return
}
if(fslash)
{
	send 6
	return
}
if(vrushfury)
{
	send {f2}
	return
}
if(siegebreaker)
{
	send 8
	return
}
if(recklessness)
{
	send p
	return
}
if(rampage)
{
	send 3
	return
}
if(execute)
{
	send 2
	return
}
if(bloodthirst1)
{
	send 5
	return
}
if(rblow1)
{
	send 4
	return
}
if(bloodthirst2)
{
	send 5
	return
}
if(droar)
{
	send i
	return
}
if(bladestorm)
{
	send o
	return
}
if(rblow2)
{
	send 4
	return
}

send 6

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
	devastate := true
else
	devastate := false

if(ipain)
{
	send y
	return
}
if(ivic)
{
	send 3
	return
}
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
if(devastate)
{
	send 6
	return
}
return
