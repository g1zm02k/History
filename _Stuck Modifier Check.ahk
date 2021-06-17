#SingleInstance Force
CoordMode ToolTip,Screen
SetTimer Test,% (TimerOn:=!TimerOn)?50:"Off"
*NumpadDot::ExitApp
Test:
  va:=GetKeyState("Ctrl")
  vb:=GetKeyState("Alt")
  vc:=GetKeyState("Shift")
  ToolTip % "C: " va "`nA: " vb "`nS: " vc,200,500
Return