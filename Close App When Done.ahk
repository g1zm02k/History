#SingleInstance Force
SetTitleMatchMode 2
Run E:\Games\Undertale\UNDERTALE.exe
WinWait UNDERTALE,,3
if  ErrorLevel
  MsgBox "Failed to load game!"
SetTimer uTimer, 1000
#IfWinActive UNDERTALE ahk_class YYGameMakerYY
w::up
s::down
a::left
d::right
#IfWinActive
return
uTimer:
  if !WinExist("UNDERTALE")
    ExitApp