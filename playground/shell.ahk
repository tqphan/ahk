Gui Add, Edit, w930 r1 vURL, https://autohotkey.com/boards/
Gui Add, Button, x+6 yp w44 Default, Go
Gui Add, ActiveX, xm w980 h640 vWB, Shell.Explorer
ComObjConnect(WB, WB_events)  ; Connect WB's events to the WB_events class object.
Gui Show
; Continue on to load the initial page:
ButtonGo:
Gui Submit, NoHide
WB.Navigate(URL)
return