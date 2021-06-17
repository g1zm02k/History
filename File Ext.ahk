#NoEnv
#SingleInstance Force
SetTitleMatchMode 2
SendMode Input
SetWorkingDir H:\AHK Tests\ ;%A_ScriptDir%
DetectHiddenWindows, On 
CoordMode, ToolTip, Screen
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

Numpad0::
	FileList := ""
	Loop, *.*	; Folder to process
		FileList .= A_LoopFileName "`n"
	Loop, parse, FileList, `n
	{
		If (A_LoopField = "")
			continue
		FoundPos := RegExMatch(A_LoopField, "i)^[^stock|^todo].*\.(jpg|txt|xlsx)$")
		If (FoundPos = !0)
			MsgBox,4,, %FoundPos% !!! %A_LoopField% !!! ; Process as normal
		Else
			MsgBox,4,, %FoundPos% ___ %A_LoopField% ___ ; Skip
		IfMsgBox, No
			break
	}
Return

Numpad1::
	FileList := ""
	Loop, *.*	; Folder to process
		FileList .= A_LoopFileName "`n"
	Msg(FileList,5000)
Return

Numpad9::
	Loop, Files, *.*, R
	{
		If (A_LoopFileExt="txt")
		{
			mp4++
		}
		Else If (A_LoopFileExt="jpg")
		{
			mkv++
		}
		Else	If (A_LoopFileExt="3dx")
			oth++
	}
	MsgBox % "Text=" mp4 " Pics=" mkv " Other=" oth
Return

Numpad2::
	FileRead FileList, _List_
	Loop, parse, FileList, `r`n
	{
		FileAppend ,,% A_LoopField
	}
Return

Numpad3::
	FileRead FileList, _List_
	Loop, parse, FileList, `r`n
	{
		FileDelete % A_LoopField
	}
Return

