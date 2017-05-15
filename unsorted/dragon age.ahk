SetTimer, ShiftTab, 60000

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

ShiftTab:
Send {LShift down}
Send {Tab}
Send {LShift up}
SetTimer, ShiftTab, Off
return

MouseWheelSimulation: 
  if (Alternate)
  {
    Send {WheelDown}
  }
  else
  {
    Send {WheelUp}
  }
Return

!RButton::
{
    send {Esc}
}
return 

~!LButton::
{
    send {Space}
}
return 
