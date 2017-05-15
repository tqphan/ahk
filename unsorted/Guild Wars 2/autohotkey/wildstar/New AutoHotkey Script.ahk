~LButton::
{
  SetTimer, Spam, 100
}
Return

~LButton up::
{
  SetTimer, Spam, off
}
Return

Spam:
  Send f
Return