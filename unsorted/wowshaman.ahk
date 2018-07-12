ShamanElemental:
PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isFullMaelstrom := true
else
	isFullMaelstrom := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isFlameShockrActive := true
else
	isFlameShockrActive := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xffffff)
	isFrostShockrActive := true
else
	isFrostShockrActive := false
	
if(pvpGameMode and (not isFrostShockrActive))
	send 9

if(isFlameShockrActive)
{
	if(isFullMaelstrom)
		send 3
	send 2
	if(multipleTargetMode)
		send 6
	else
		send 5
}
else
{
	send 4
}
	
return

ShamanRestoration:
PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isRiptideActive := true
else
	isRiptideActive := false

PixelGetColor, pc, 1919, 1048
if(pc = 0xffffff)
	isTargetCurable := true
else
	isTargetCurable := false
	
PixelGetColor, pc, 1919, 1016
if(pc = 0xff0000)
	isTargetLowHealth := true
else
	isTargetLowHealth := false

if(isRiptideActive)
	send 3
else
{
	if(isTargetLowHealth)
		send 12
	else
		send 13
}
return

ShamanEnhancement:
PixelGetColor, pc, 0, 0
if(pc = 0xffffff)
	sstrike := true
else
	sstrike := false
PixelGetColor, pc, 1, 0
if(pc = 0xffffff)
	llash := true
else
	llash := false
PixelGetColor, pc, 2, 0
if(pc = 0xffffff)
	ft := true
else
	ft := false
PixelGetColor, pc, 3, 0
if(pc = 0xffffff)
	rbiter := true
else
	rbiter := false
PixelGetColor, pc, 4, 0
if(pc = 0xffffff)
	clightning := true
else
	clightning := false
PixelGetColor, pc, 5, 0
if(pc = 0xffffff)
	heal := true
else
	heal := false
PixelGetColor, pc, 6, 0
if(pc = 0xffffff)
	hex := true
else
	hex := false
PixelGetColor, pc, 7, 0
if(pc = 0xffffff)
	wshear := true
else
	wshear := false
PixelGetColor, pc, 8, 0
if(pc = 0xffffff)
	rfall := true
else
	rfall := false
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

if(wshear)
{
	send {f1}
	return
}
if(heal)
{
	send {f2}
	return
}
if(rfall)
{
	send y
	return
}
if(hex)
{
	send p
	return
}
if(clightning)
{
	send 6
	return
}
if(sstrike)
{
	send 2
	return
}
if(llash)
{
	send 3
	return
}
if(ft)
{
	send 4
	return
}
if(rbiter)
{
	send 5
	return
}
return