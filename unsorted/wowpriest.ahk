PriestDiscipline:
PixelGetColor, pc, 1919, 1079
if(pc = 0xffffff)
	isPainActive := true
else
	isPainActive := false


if(isPainActive)
{
	send 34567
}
else
{
	send 2
}
	
return