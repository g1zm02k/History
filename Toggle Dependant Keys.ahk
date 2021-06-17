#UseHook
SendMode Input
Run Notepad.exe
WinWait ahk_exe Notepad.exe
Process Priority,Notepad.exe,High
SetTimer pWatch,100

#IfWinActive ahk_exe Notepad.exe
  LAlt::Send % (fTab:=!fTab)?"{Tab Down}":"{Tab Up}"
	WheelUp::Send % GetKeyState("Tab")?"z":"{WheelUp}"
  WheelDown::Send % GetKeyState("Tab")?"x":"{WheelDown}"
#IfWinActive

pWatch:
  Process Exist,Notepad.exe
  If !ErrorLevel{
    Send {Tab Up}
		ExitApp
	}
Return