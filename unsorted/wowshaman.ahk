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
