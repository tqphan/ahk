#Include Point2D.ahk

class Rectangle
{
    __New(aX, aY, awidth, aheight)
    {
        this.Point := new Point2D(aX, aY)
        this.Width := awidth
        this.Height := aheight
    }
    intersect(point)
    {
        if(this.withinX(point.X) and this.withinY(point.Y))
            return true

        return false
    }
    withinX(value)
    {
        if((this.Point.X <= value) and (value <= (this.point.X + this.Width)))
            return true

        return false
    }
    withinY(value)
    {
        if((this.Point.Y <= value) and (value <= (this.point.Y + this.Height)))
            return true

        return false
    }
}


; topRect := new Rectangle(0,0,1920,2)
; point := new Point2D(0,4)
; if(topRect.intersect(point))
; MsgBox, Textrrrrrrr
; Else
; MsgBox, Textuuuuuuuu
