#NoEnv
#SingleInstance Force
ftx:="If you insist; her name is Bailee Blunt."
rtx:=""
ltx:=StrLen(ftx)
loop, %ltx%
{
	rtx:= % rtx . SubStr(ftx,ltx-A_Index+1,1)
}
MsgBox, %ftx%`n%rtx%
clipboard=%rtx%