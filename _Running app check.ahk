#NoEnv
#SingleInstance Force
SetTitleMatchMode 2
CoordMode ToolTip,Screen
SetTimer, tExist, 500
Numpad0::ExitApp
Return

tExist:
if WinExist("Avidemux ahk_class Qt5QWindowIcon")
	if !WinExist("ahk_exe Notepad.exe")
		run Notepad.exe
else
	if WinExist("ahk_exe Notepad.exe")
		WinClose ahk_exe Notepad.exe
Return