#SingleInstance force
#Include HotkeyOutputMode.ahk
#Include HotkeyOutput.ahk
global tt := "Untitled - Notepad"
testhko := new HotkeyOutput
testhko.AddKeysArray({keys: ["w","a","s","d"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})
testhko.AddKeysArray({keys: ["b","n","m","v"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
testhko.AddKeysArray({keys: ["w","a","s","d"], mode: HotkeyOutputMode.HOM_DIRECT_REMAP})
;testhko.Test2()

F9::
{
	if WinActive(tt)
		send [a]
}
return

F9 up::
{
	
}
return
	

