#NoEnv
#SingleInstance Force
CoordMode Mouse,Screen
CoordMode ToolTip,Screen
SetTimer, Test, % (TimerOn := !TimerOn) ? "50" : "Off"
*NumpadDot::ExitApp
Test:
	MouseGetPos ox,oy
  ToolTip % "x,y: " ox "," oy,940,900
Return