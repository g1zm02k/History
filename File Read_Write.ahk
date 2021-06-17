#SingleInstance, force

fBeg=E:\Portable\Aren\Data\update.ini
fEnd=E:\Portable\Aren\Data\ud.ini
fDat=

IfExist, %fEnd%
	FileDelete %fEnd%

IfExist, %fBeg%
{
	Loop, 7
	{
		FileReadLine, fDat, %fBeg%, %A_Index%
		If A_Index = 3
			FileAppend, start=%A_YYYY%%A_MM%%A_DD%`n, %fEnd%
		Else if A_Index = 4
			FileAppend, num=1`n, %fEnd%
		Else
			FileAppend, %fDat%`n, %fEnd%
	}
}

FileDelete %fBeg%
;FileMove %fEnd%, E:\Portable\Aren\Data\update.ini
