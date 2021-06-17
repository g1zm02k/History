Numpad0::
	mkv:=0, mp4:=0, oth:=0
	Loop, Files, D:\Video\Feature Length\*.*, R
	{
		If (A_LoopFileExt="mp4")
		{
			mp4++
;			FileAppend % A_LoopFileName " - " A_LoopFileSizeMB "`n", d:\Downloads\mp4.txt
		}
		Else If (A_LoopFileExt="mkv")
		{
			mkv++
			FileAppend % A_LoopFileName " - " A_LoopFileSizeMB "`n", d:\Downloads\mkv.txt
		}
		Else
			oth++
	}
	MsgBox % "MP4=" mp4 " MKV=" mkv " Other=" oth
Return
