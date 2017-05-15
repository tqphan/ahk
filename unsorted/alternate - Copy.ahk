Alternate := false
F11::
{
  if (Alternate)
  {
    Send {WheelDown}
  }
  else
  {
    Send {WheelUp}
  }
}
Return 

F11 Up::
{
  if (Alternate)
  {
    Send {WheelUp}
  }
  else
  {
    Send {WheelDown}
  }
  Alternate := !Alternate

}
Return 