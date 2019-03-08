document.open()
document.write(OutputVar)
document.close()
; WB.Navigate("about:blank")
Loop
    Sleep 10
Until (WB.readyState=4 && WB.document.readyState="complete" && !WB.busy)    
;WB.Navigate("file:///A:/ahk/playground/test.html")
;WB.Document.Write(OutputVar)
;WB.Refresh()
return

Test(bb)
{
    v := 4
    hw := "alert(" . v . ")"
    WB.document.parentwindow.execScript(hw)
}

F3::