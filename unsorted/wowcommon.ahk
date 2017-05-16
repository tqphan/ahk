Common:
if(singleTargetMode)
{
	if(autoAttack)
		send 1
	if(autoFace)
		send 2
	send 345
	if(epsilon)
		send 6
	if(zeta)
		send 7
	if(eta)
		send 8
	if(theta)
		send 9
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
