﻿#SingleInstance force
#Include HotkeyOutputMode.ahk
#Include HotkeyOutput.ahk
#Include MouseBind.ahk

Classes := "DeathKnight|DemonHunter|Druid|Hunter||Mage|Monk|Paladin|Priest|Rogue|Shaman|Warlock|Warrior"
DeathKnight := "Blood|Frost|Unholy"
DemonHunter := "Havoc|Vengeance"
Druid := "Balance|Feral|Guardian|Restoration"
Hunter := "BeastMastery|Marksmanship|Survival"
Mage := "Arcane|Fire|Frost"
Monk := "Brewmaster|Windwalker|Mistweaver"
Paladin := "Holy|Retribution|Protection"
Priest := "Discipline|Holy|Shadow"
Rogue := "Assassination|Subtlety|Outlaw"
Shaman := "Elemental|Enhancement|Restoration"
Warlock := "Affliction|Demonology|Destruction"
Warrior := "Arms|Fury|Protection"

Gui, +LastFound +AlwaysOnTop +ToolWindow +Resize +Border +E0x08000000

Gui, Add, DropDownList, x0 y120 vwindowTitleDropDownList gOnChange, |World of Warcraft||
Gui, Add, DropDownList, x0 y100 vspecDropDownList gOnChange, |Common|Jump|PaladinProtection|MageFrost|DruildBalance|WarriorFury|WarriorArms|WarriorProtection|PriestDiscipline|HunterBeastMastery|HunterMarksmanship|RogueAssassination|ShamanElemental|ShamanRestoration|WarlockAffliction|
;Gui, Add, DropDownList, x0 y140 vwindowTitleDropDownList gOnChange, |World of Warcraft||
;Gui, Add, DropDownList, x0 y100 vclassDropDownList gOnChange, %Classes%
;Gui, Add, DropDownList, x0 y120 vspecDropDownList, %Hunter%

Gui, Add, Radio, x0 y80 w60 h20 vpveGameMode gOnChange Checked 0x1000, PvE
Gui, Add, Radio, x60 y80 w60 h20 vpvpGameMode gOnChange 0x1000, PvP

Gui, Add, Radio, x0 y0 w40 h40 vsingleTargetMode gOnChange Checked 0x1000 Group, 1
Gui, Add, Radio, x40 y0 w40 h40 vcleaveTargetMode gOnChange 0x1000, 2
Gui, Add, Radio, x80 y0 w40 h40 vmultipleTargetMode gOnChange 0x1000, 3

Gui, Add, Checkbox, x0 y40 h20 w30 0x1000 vmouseMonitor gOnChange, α
Gui, Add, Checkbox, x30 y40 h20 w30 0x1000 vautoFace gOnChange, β
Gui, Add, Checkbox, x60 y40 h20 w30 0x1000 vautoStrafe gOnChange, γ
Gui, Add, Checkbox, x90 y40 h20 w30 0x1000 vautoAttack gOnChange, δ

Gui, Add, Checkbox, x0 y60 h20 w30 0x1000 vepsilon gOnChange, ε
Gui, Add, Checkbox, x30 y60 h20 w30 0x1000 vzeta gOnChange, ζ
Gui, Add, Checkbox, x60 y60 h20 w30 0x1000 veta gOnChange, η
Gui, Add, Checkbox, x90 y60 h20 w30 0x1000 vtheta gOnChange, θ
Gui, Show, w120 h160 Center NoActivate

global mb := new MouseBind
mb.topEdgeKey := "numlock"
mb.leftEdgeKey := "f1"
mb.rightEdgeKey := "f2"
mb.topEdgeEnabled := true
mb.leftEdgeEnabled := true
mb.rightEdgeEnabled := true

global ad := new HotkeyOutput
ad.AddKeysArray({keys: ["a", "d"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})

global lr := new HotkeyOutput
lr.AddKeysArray({keys: ["left", "right"], mode: HotkeyOutputMode.HOM_CIRCULAR_SEQUENCE})

global ud := new HotkeyOutput
ud.AddKeysArray({keys: ["wheeldown", "wheelup"], mode: HotkeyOutputMode.HOM_SEQUENTIAL_SPAM})

global activeWindowCheckEnabled := true
global windowTitle := ""
global lastActivatedTimer := ""
return

F9::
{
	;GuiControlGet, clss , 1:, classDropDownList
	;GuiControlGet, spc , 1:, specDropDownList
	;cs := clss . spc
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		if(autoStrafe)
			ad.Activate(1)
		
		if(eta)
			lr.Activate(1)
		
		if(epsilon)
			ud.Activate(1)

		if(specDropDownList = "")
		{
			return
		}
		else
		{
			lastActivatedTimer := specDropDownList
			SetTimer, %specDropDownList%, 200
		}
	}
}
return

F9 Up::
{
	ad.Deactivate()
	lr.Deactivate()
	ud.Deactivate()
	if(lastActivatedTimer != "")
		SetTimer, %lastActivatedTimer%, off
}
return

ActiveWindowCheck(checkEnabled)
{
	;MsgBox, %windowTitle%
	if(checkEnabled)
	{
		if WinActive(windowTitle)
			return true
		else
			return false	
	}
	else
	{
		return true
	}
}
return

#Include wowcommon.ahk
#Include wowjump.ahk
#Include wowdruild.ahk
#Include wowhunter.ahk
#Include wowwarrior.ahk
#Include wowshaman.ahk
#Include wowrogue.ahk
#Include wowpaladin.ahk
#Include wowpriest.ahk
#Include wowmage.ahk
#Include wowwarlock.ahk

OnChange:
;Gui, Submit, nohide

	;, clss , 1:, classDropDownList	; Get the value selected
	;making it dynamic without Loops end if's
	; If Choise1=Red Than %red%="A|B|C||" And % %Choise1%="A|B|C||"
	;GuiControl,1:,specDropDownList,| 		; RTM says To make the control empty, specify only a pipe character (|). 
	;GuiControl,1:,specDropDownList,% %clss% 		; Set the assigned dropdownlist

Gui, Submit, nohide
if(mouseMonitor)
{
	if(ActiveWindowCheck(activeWindowCheckEnabled))
	{
		mb.Start()
	}
}
else
{
	mb.Stop()
}

if(windowTitleDropDownList = "")
{
	activeWindowCheckEnabled := false
}
else
{
	activeWindowCheckEnabled := true
	windowTitle := windowTitleDropDownList
}
return

GuiClose:
exit:
{
	exitapp
}
return