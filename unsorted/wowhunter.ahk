HunterMarksmanship:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	moving := true
else
	moving := false

PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	casting := true
else
	casting := false

PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	ssting := true
else
	ssting := false

PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	amoc := true
else
	amoc := false

PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	rfire := true
else
	rfire := false

PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	ashot := true
else
	ashot := false

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	pshot := true
else
	pshot := false

PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	lnload := true
else
	lnload := false

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	tshot := true
else
	tshot := false

PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	steadyshot := true
else
	steadyshot := false

PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	ashot2 := true
else
	ashot2 := false

PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	hmark := true
else
	hmark := false

PixelGetColor, pc, 11, 0
if(pc = 0xffffff)
	dtap := true
else
	dtap := false

if(casting)
{
	return
}
if(hmark)
{
	send 1
	return
}
if(ssting)
{
	send 4
	return
}
if(amoc)
{
	send {f2}
	return
}
if(dtap)
{
	send p
	return
}
if(ashot2 and (not moving or lnload))
{
	send 3
	return
}
if(rfire)
{
	send 2
	return
}
if(steadyshot)
{
	send 6
	return
}
if(pshot)
{
	send 5
	return
}
if(ashot and (not moving or lnload))
{
	send 3
	return
}

send 6
return

HunterBeastMastery:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	barbed_shot := true
else
	barbed_shot := false

PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	amoc := true
else
	amoc := false

PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	aotw := true
else
	aotw := false

PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	bestialw := true
else
	bestialw := false

PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	stampede := true
else
	stampede := false

PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	kill_command := true
else
	kill_command := false

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	chimaera_shot := true
else
	chimaera_shot := false

PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	cobra_shot := true
else
	cobra_shot := false

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	barbed_shot_2 := true
else
	barbed_shot_2 := false

PixelGetColor, pc, 9, 0
if(pc = 0xffffff)
	multishot := true
else
	multishot := false

PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	loh := true
else
	loh := false

if(barbed_shot)
{
	send 2
	return
}
if(amoc)
{
	send 1
	return
}
if(aotw)
{
	send i
	return
}
if(bestialw)
{
	send 8
	return
}
if(stampede)
{
	;send u
	return
}
if(kill_command)
{
	send 3
	return
}
if(chimaera_shot)
{
	send 4
	return
}
if(barbed_shot_2)
{
	send 2
	return
}
if(multishot and not singleTargetMode)
{
	send 7
	return
}
if(cobra_shot)
{
	send 5
	return
}

	
return

HunterSurvival:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	ssting := true
else
	ssting := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	kcommand := true
else
	kcommand := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	rstrike := true
else
	rstrike := false
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

if(ssting)
{
	send 3
	return
}
if(kcommand)
{
	send 4
	return
}
if(rstrike)
{
	send 5
	return
}
return