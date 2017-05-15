#Persistent
CoordMode, mouse, screen
SetTimer, WatchCursor, 100
Testing :=  123

WatchCursor: 
DoWork()
return 

DoWork()
{
  static IsNumlockDown := false

  MouseGetPos, xpos, ypos

  if (ypos = 0)
  {
    if (IsNumlockDown = false)
    {
      Send {Numlock down}
      IsNumlockDown := true
    }
  }
  else 
  {
    if (IsNumlockDown = true)
    {
      Send {Numlock up}
      IsNumlockDown := false 
    }
  }
}

~RButton::
{

}
return 

~RButton Up::
{

}
return

~LButton::
{

}
return 

~LButton Up::
{

}
return

esc::
ExitApp