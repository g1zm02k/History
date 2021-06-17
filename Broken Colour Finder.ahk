SetBatchLines -1
MsgBox Press enter and click a color
KeyWait LButton, D
MouseGetPos x, y
PixelGetColor c, x, y
Loop % A_ScreenWidth
{
   x := A_Index
   Loop % A_ScreenHeight
   {
      y := A_Index
      PixelGetColor, cc, x, y
      If (cc = c)
        MouseMove %x%, %y%
   }
}