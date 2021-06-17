#NoEnv
SetTitleMatchMode 2
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, Icons\Sc.ico
tmp:=""

num:=1
tmp:="00: " . num . "`n"
Loop, 12
{
	cnt:="0" . A_Index
	StringRight, cnt, cnt, 2
	num:= num * 6
	tmp:= tmp . cnt . ": " . num . "`n"
}
msgbox %tmp%