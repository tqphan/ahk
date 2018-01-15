
    ;-1 (the display is powering on)
    ;1 (the display is going to low power)
    ;2 (the display is being shut off)
space::
Sleep 1000
SendMessage, 0x112, 0xF170, 2,, Program Manager
return