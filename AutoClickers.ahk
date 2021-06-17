F1::SetTimer tTimer,% (TimerOn:=!TimerOn)?"50":"Off"
tTimer:
  Click
Return


CoordMode ToolTip,Screen
*~$LButton::
  While (GetKeyState("LButton","P­") && clk){
    Click
    Random slp,20,50
    Sleep slp
  }
Return
XButton1::
  clk:=!clk
  If clk
    ToolTip Clicker Active,10,A_ScreenHeight-30
  Else
    ToolTip
Return


CapsLock::fT:=!fT
#If fT
$~LButton::
  While GetKeyState("LButton","P"){
    Click
    Sleep 50  ;Higher is slower but it's fast enough to bluff games
  }
Return
#If


*LButton::
  Loop
  {
    SetMouseDelay 30
    Click
    If (GetKeyState("LButton","P­")=0)
      Break
  }
Return


pressed:=false
*XButton1::
  tooltip spamming the key
  if !pressed
    SetTimer PressTheKey, 50
  pressed:=true
Return
*XButton1 up::
  SetTimer PressTheKey, Off
  pressed:=false
  tooltip
Return
PressTheKey:
  Send d
Return


; ### Click/Act at specific set intervals ###
Numpad5::
  vC:=0
  Send {Tab Up}
  SetTimer tT,% (fT:=!fT)?-1:"Off"
Return

tT:
  If (vC=0)
    Send {Tab Down}
  If (vC=0 || vC=13 || vC=23 || vC=31 || vC=41)
    Click
  If (vC=41){
    Send {Tab Up}
    SetTimer tT,Off
    fT:=0
  }Else
    SetTimer tT,-100
  vC++
Return