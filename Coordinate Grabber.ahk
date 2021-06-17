^F1::
MouseGetPos, mouseX, mouseY
InputBox, coordinateNote, Describe the location for easy reference
FileAppend, %coordinateNote% - %mouseX%`, %mouseY%`n, tmp.txt
MsgBox, 0, Done, Coordinates logged, 1
return

^+F1::
run, C:\WINDOWS\system32\notepad.exe "tmp.txt"
return