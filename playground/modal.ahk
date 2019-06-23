#SingleInstance, Force
#NoEnv

Menu, MainMenu, Add, Options, MainMenu_Options

Gui, Main: New,, Main
Gui, Menu, MainMenu
Gui, Add, Text, w250 h100

Gui, Options: New, +OwnerMain -MinimizeBox, Options
Gui, Add, Text, w100 h50
Gui, Add, Button, Default, OK
Gui, Add, Button, x+m, Cancel

Gui, Main: Show

Return

MainGuiClose:
ExitApp

MainMenu_Options:
    Gui, Main: +Disabled
    Gui, Options: Show
Return

OptionsButtonOK:
    Gui, Main: -Disabled
    Gui, Options: Hide

    ; code

Return

OptionsGuiClose:
OptionsGuiEscape:
OptionsButtonCancel:
    Gui, Main: -Disabled
    Gui, Options: Hide

    ; code

Return