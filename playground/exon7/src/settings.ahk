class Settings 
{
    static svar := 1
    var := 2
}

s1 := New Settings
t := s1.var

g := Settings.svar
MsgBox, %g%