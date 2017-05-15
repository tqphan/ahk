IsADown := false 
IsDDown := false
Alternate := false
F9::
{
  if (Alternate)
  {
    Send {Delete Down}
  }
  else
  {
    Send {End Down}
  }
}
Return 

F9 Up::
{
  if (Alternate)
  {
    Send {Delete Up}
  }
  else
  {
    Send {End Up}
  }
  Alternate := !Alternate
}
Return 

