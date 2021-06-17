#NoEnv
#SingleInstance Force
SetTitleMatchMode 2
SendMode Input
SetWorkingDir D:\Downloads
FileRead, TMP, List.txt			; Basic Name Only List
aList := StrSplit(TMP, "`r`n")
FileRead, TMP, Comp.txt			; Basic Name Only List
aComp := StrSplit(TMP, "`r`n")
FileRead, TMP, Srch.txt			; Full Everything List
aSrch := StrSplit(TMP, "`r`n")
FileRead, TMP, Full.txt			; Full Everything List
aFull := StrSplit(TMP, "`r`n")
LP1 := 0
LP2 := 0
FileDelete SAV.txt

Loop % aList.MaxIndex() {
	LP1++
	FileAppend % SubStr("  " LP1, -2) " " aSrch[LP1] "`n", SAV.txt
	Loop % aComp.MaxIndex() {
		LP2++
		RegExMatch(aComp[LP2],"i)"aList[LP1],TST)				; Cmp basic list 1 with basic list 2
		If (StrLen(TST)>0) {									; Match! Save the Full list version
			FileAppend % "     " SubStr("  " LP2, -2) " - "  aFull[LP2] "`n", SAV.txt
		}
	}
	LP2=0
}
