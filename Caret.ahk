CoordMode Caret            ;Tells the script to use full screen coords

F1::                                              ;Key to show the GUI
  Gui Test:New, +ToolWindow +Owner +AlwaysOnTop    ;Create a basic GUI
  Gui Show,x%A_CaretX% y%A_CaretY% w300 h100 NoActivate  ;Show the GUI
Return                                       ;End this section of code