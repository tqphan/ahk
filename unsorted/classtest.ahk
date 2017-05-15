class Rectangle
{
	__New()
	{
		
	}
	
	__New(x, y, width, height)
	{
		
	}
	
    Property[]  ; Brackets are optional
    {
        get {
            return ...
        }
        set {
            return ... := value
        }
    }
}

class MouseBinding
{
	__New()
	{
		
	}
 
	OnBtnClick(CtrlHwnd)
	{
		MsgBox, % CtrlHwnd
	}
 
	OnAlphaButtonClick(CtrlHwnd)
	{
		MsgBox, % CtrlHwnd
	}
}