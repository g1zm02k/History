SendMode Input
SetTitleMatchMode 2
CoordMode, Mouse, Screen
md:=40 ; Deadzone radius before kick-in.

Numpad0::
toggle:=!toggle
if (toggle)
{
	MouseGetPos ox,oy
	Gui, GUI:New, +AlwaysOnTop -Caption
	Gui, Color, ffffff
	Gui, show, % "NoActivate w" md*2 "h" md*2 "x" ox-md "y" oy-md, wGUI
	WinSet Trans, 20,GUI 
	SetTimer, wasd,100
}
else
{
	SetTimer, wasd, off
	Gui GUI:hide
}
Return

wasd:
	MouseGetPos nx,ny
	If (nx>ox+md)
		Send d
	Else If (nx<ox-md)
		Send a
	If (ny>oy+10)
		Send s
	Else If (ny<oy-md)
		Send w
Return