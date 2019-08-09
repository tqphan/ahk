inst := new ActiveX
inst.WB.Navigate("https://www.autohotkey.com/docs/AutoHotkey.htm")

class ActiveX
{
   __New() {
      static WB, WM_SYSCOMMAND := 0x112
      Gui, New, +hwndhGui
      this.hwnd := hGui
      Gui, Add, Edit, w900
      Gui, Add, ActiveX, vWB w900 h600, about:<meta http-equiv="X-UA-Compatible" content="IE=edge">
      this.WB := WB
      self := this.Clone()
      ComObjConnect(WB, self)
      ON_SYSCOMMAND := ObjBindMethod(self, "WM_SYSCOMMAND", hGui)
      this.ON_SYSCOMMAND := ON_SYSCOMMAND, self.ON_SYSCOMMAND := ON_SYSCOMMAND
      OnMessage(WM_SYSCOMMAND, ON_SYSCOMMAND)
      Gui, Show
   }

   __Call(event, params*) {
      if (event = "NavigateComplete2") {
         GuiControl, % this.hwnd . ":", Edit1, % params[2]
         ;params[1].document.documentElement.style.overflow := "auto"
      }
   }

   __Delete() {
      this.Clear()
   }
   
   WM_SYSCOMMAND(hGui, wp, lp, msg, hwnd) {
      if ( hGui = hwnd && wp = (SC_CLOSE := 0xF060) ) {
         this.Clear()
         ExitApp
      }
   }
   
   Clear() {
      try Gui, % this.hwnd . ": Destroy"
      OnMessage(0x112, this.ON_SYSCOMMAND, 0)
   }
}
