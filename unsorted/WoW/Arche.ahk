IsADown := false 
IsDDown := false
Alternate := false
F11::
{
  if (Alternate)
  {
    Send {A Down}
  }
  else
  {
    Send {D Down}
  }
}
Return 

F11 Up::
{
  if (Alternate)
  {
    Send {A Up}
  }
  else
  {
    Send {D Up}
  }
  Alternate := !Alternate
}
Return 

