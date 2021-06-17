#NoEnv
SetTitleMatchMode 2
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, Icons\sc.ico

des=C:\Users\WR\Desktop\
FileDelete, %des%DL.txt

Loop, 31
{
	cnt:="0" + A_Index
	StringRight, Cnt, Cnt, 2
		
	If Mod(A_Index,7) = 1
		cnt=Tue %cnt%
	else if Mod(A_Index,7) = 2
		cnt=Wed %cnt%
	else if Mod(A_Index,7) = 3
		cnt=Thu %cnt%
	else if Mod(A_Index,7) = 4
		cnt=Fri %cnt%
	else if Mod(A_Index,7) = 5
		cnt=Sat %cnt%
	else if Mod(A_Index,7) = 6
		cnt=Sun %cnt%
	else
		cnt=Mon %cnt%
FileAppend, %cnt% Dec`n, %des%DL.txt
}
;ExitApp