PaladinProtection:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	as := true
else
	as := false

PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	sotr := true
else
	sotr := false

PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	con := true
else
	con := false

PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	hotp := true
else
	hotp := false

PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	rebuke := true
else
	rebuke := false

PixelGetColor, pc, 10, 0
if(pc = 0xffffff)
	jud := true
else
	jud := false

PixelGetColor, pc, 12, 0
if(pc = 0xffffff)
	hoj := true
else
	hoj := false

PixelGetColor, pc, 14, 0
if(pc = 0xffffff)
	adp := true
else
	adp := false

PixelGetColor, pc, 16, 0
if(pc = 0xffffff)
	loh := true
else
	loh := false

if(hotp)
{
	send u
}

if(adp)
{
	send t
	return
}

if(loh)
{
	send o
	return
}

if(yot)
{
	send 8
	return
}

if(as)
{
	send 1
	return
}

if(hoj)
{
	send p
	return
}

if(bl)
{
	send 1
}

if(sotr)
{
	send 3
}

if(jud)
{
	send 2
	return
}

if(con)
{
	send 4
	return
}

send 5
	
return

PaladinHoly:

return

PaladinRetribution:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	jmt := true
else
	jmt := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	cstrike := true
else
	cstrike := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	dhammer := true
else
	dhammer := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	tverdict := true
else
	tverdict := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	dstorm := true
else
	dstorm := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	woa := true
else
	woa := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	hoj := true
else
	hoj := false
PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	jven := true
else
	jven := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	rebuke := true
else
	rebuke := false
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

if(rebuke)
{
	send {f1}
}
if(hoj)
{
	send 6
	return
}
if(jmt)
{
	send 3
	return
}
if(jven)
{
	send 8
	return
}
if(singleTargetMode and tverdict)
{
	send 4
	return
}
if(cleaveTargetMode and dstorm)
{
	send 5
	return
}
if(woa)
{
	send 7
	return
}
if(dhammer)
{
	send 2
	return
}
if(cstrike)
{
	send 1
	return
}
return
