Gui, 1:Show, y100 w200 h100, Gui 1
Gui, 2:Show, y300 w200 h100, Gui 2
Gui, Test:Show, y500 w200 h100, Gui Test
Return

GuiClose:
MsgBox,,, % A_ThisLabel, 1
return

2GuiClose:
MsgBox,,, % A_ThisLabel, 1
return

TestGuiClose:
MsgBox,,, % A_ThisLabel, 1
return

Esc::ExitApp