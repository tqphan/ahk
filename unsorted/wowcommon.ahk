Common:
if(singleTargetMode)
{
	if(autoAttack)
		send 1
	if(autoFace)
		send 2
	send 3456
}
else if(cleaveTargetMode)
{
	send f
}
else
{
	send r
}

	
return
