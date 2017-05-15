#Persistent
CoordMode, mouse, screen
SetTimer, WatchCursor, 100
Testing :=  123

WatchCursor: 
DoWork()
return 

DoWork()
{
  static IsRDown := false
  static IsVDown := false

  MouseGetPos, xpos, ypos

  if (ypos = 0)
  {
    if (IsRDown = false)
    {
      IfWinActive, FINAL FANTASY XIV
      {
        Send {r down}
        IsRDown := true
      }
    }
  }
  else 
  {
    if (IsRDown = true)
    {
      IfWinActive, FINAL FANTASY XIV
      {
        Send {r up}
        IsRDown := false 
      }
    }
  }
}

F11::
{
 Send 2
}
return 