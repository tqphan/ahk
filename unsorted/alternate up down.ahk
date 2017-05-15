Alternate := false
F10::
{
  SetTimer, MouseWheelSimulation, 250
}
Return 

F10 Up::
{
  Alternate := !Alternate
  SetTimer, MouseWheelSimulation, off
}
Return 

MouseWheelSimulation: 
  if (Alternate)
  {
    Send {Down down}

    Send {Down up}
  }
  else
  {
    Send {Up down}

    Send {Up up}
  }
Return