SetWorkingDir %A_ScriptDir%
Stamp:=A_Hour ":" A_Min ":" A_Sec " " A_DD "/" A_MM "/" A_YYYY
If !FileExist("D:\Portable\Aren\Data\update.ini")
	Stamp:="Checked. " Stamp "`n"
Else
	Stamp:="Deleted! " Stamp "`n"
FileDelete D:\Portable\Aren\Data\update.ini
FileAppend % Stamp,BlockAren.txt
ExitApp