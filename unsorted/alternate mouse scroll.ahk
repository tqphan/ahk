Alternate := false
F9::
{
  SetTimer, MouseWheelSimulation, 250
}
Return 

F9 Up::
{
  Alternate := !Alternate
  SetTimer, MouseWheelSimulation, off
}
Return 

MouseWheelSimulation: 
  if (Alternate)
  {
    Send {WheelDown down}
  }
  else
  {
    Send {WheelUp up}
  }
Return