;Hotkey Checker

1::
2::
3::

s:: ;Send Blue
d:: ;Send Black
	MouseGetPos, MouseX, MouseY
	if A_ThisHotkey = s
	{
		Click %MouseX%,%MouseY%
		sav=Click %MouseX%,%MouseY%`nSleep 50`n
	}
	else if A_ThisHotkey = d
	{
		Click Right %MouseX%,%MouseY%
		sav=Click Right %MouseX%,%MouseY%`nSleep 50`n
	}
	FileAppend, %sav%, %des%HC.txt
return

Up::ExitApp
Down::KeyHistory
