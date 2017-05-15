#Persistent
CoordMode, mouse,screen
SetTimer, WatchCursor, 100
return

WatchCursor: 
DoWork()
return 

DoWork()
{
static Tr := false
MouseGetPos, xpos,ypos
if (ypos = 0)
{
  if (Tr = false)
  {
    Send {Numlock down}
    Tr := true
  }
  ; else 
  ; {
  ;   Send {Up down}
  ; }
}
else 
{
  if (Tr = true)
  {
    Send {Numlock up}
    Tr := false 
  }
}
}

f12::
{
  Send 234
}
return 

esc::
ExitApp