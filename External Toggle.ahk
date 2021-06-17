#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
SendMode Input
If FileExist(0)
{
	Msb("Exists")
	FileDelete 0
}
else
{
	Msb("Gone!")
	FileAppend "",0
}
ExitApp