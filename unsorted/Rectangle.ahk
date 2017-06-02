#Include Point2D.ahk

class Rectangle
{
    __New(aX, aY, awidth, aheight)
    {
        this.Point := new Point2D(aX, aY)
        this.Width := awidth
        this.Height := aheight
    }
}

r := new Rectangle(1,3,44,66)
MsgBox % r.Point.X "," r.Point.Y

