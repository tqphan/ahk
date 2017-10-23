#SingleInstance force
#NoEnv
Collors:="Red||Green|Blue|Black|White"	; Droplist for the collors with red preselected
Red := "A|B|C||" 							; Droplist for red with c precelected
Green:="A||B|C"							;
Blue:= "F||G" 								;droplist for blue with Fprecelected
Black:= "F|G||" 							;
White:="A|B||C"							;
Gui 1:Show, x130 y90 h300 w420, Test
Gui 1:Font, cBlue s18 bold, Verdana
Gui 1:Add, Text, Center x0 y20 w330 h40 , Test - Window

Gui 1:Font, S12 CDefault, Verdana
; Use g (gosub) labels in your gui
Gui 1:Add, DropDownList, x20 y100 w200 h300 vChoice1 gChoise1, %Collors%	; Set the collor dropdownlist
Gui 1:Add, DropDownList, x70 y150 w200 h300 vChoice2, %red%				; Set the red dropdownlist

Gui 1:Font, S10 CDefault, Verdana
Gui 1:Add, Text, x230 y105 w150 h30, DropDownList A
Gui 1:Add, Text, x280 y155 w150 h30, DropDownList B
Gui 1:Add, Text, x30 y160 w30 h1 0x7 ;Horizontal Line > Black
Gui 1:Add, Text, x30 y130 w1 h30 0x7   ;Vertical Line > Black

Return


Choise1:
	GuiControlGet, Choise1 , 1:, Choice1	; Get the value selected
	;making it dynamic without Loops end if's
	; If Choise1=Red Than %red%="A|B|C||" And % %Choise1%="A|B|C||"
	GuiControl,1:,Choice2,| 		; RTM says To make the control empty, specify only a pipe character (|). 
	GuiControl,1:,Choice2,% %Choise1% 		; Set the assigned dropdownlist
return

1GuiClose:
ExitApp