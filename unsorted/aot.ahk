global isShiftDown := false
global lastTick := A_TickCount

Space::
{
  lastTick := A_TickCount
  SetTimer, SendLShiftDown, -500
}
return

Space Up::
{
  elapsedTime := A_TickCount - lastTick

  if(elapsedTime < 400)
  {
    Send {Space}
    SetTimer, SendLShiftDown, off
  }
  if(isShiftDown)
  {
    Send {LShift Up}
    isShiftDown := false
  }
}
return

SendLShiftDown:
Send {LShift Down}
isShiftDown := true
return