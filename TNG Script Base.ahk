mDir:="D:\Downloads\"
sDir:="D:\Downloads\TNG Scripts\"
fDir:="D:\Downloads\TNG Done\"

Numpad0:: ;Test strip space
	FileRead v,% sDir "102.txt"			;Read File
	v:=RegExReplace(v,"m)^\n*") 		;Del Lines
	MsgBox % v
;	FileDelete tst.txt							;Clear Tmp
;	FileAppend % v,tst.txt					;Make Test
;	FileReadLine l,tst.txt,3				;Get Title
;	RegExMatch(v,"""([^""]*?)""",m) ;Strip '"'
;	MsgBox % m1											;Show Line
Return

Numpad1:: ;Strip empty space + rename
	vLst := ""
	Loop, Files, % sDir "*.txt", F
		vLst .= A_LoopFileName "`n"
	Loop, parse, vLst, `n
	{
	  if (A_LoopField = "")
	    continue
		FileRead vEps,% sDir A_LoopField
		vEps:=RegExReplace(vEps,"m)^\n*")
		RegExMatch(vEps,"""([^""]*?)""",vTit)
		Msb(fDir SubStr(A_Loopfield,1,3) " - " vTit1 ".txt",0)
		FileAppend % vEps,% fDir SubStr(A_Loopfield,1,3) " - " vTit1 ".txt"
;		MsgBox 4,,% "File name " A_LoopField " is " A_Index ".  Continue?"
;		IfMsgBox No
;		  break
	}
MsgBox Done!
Return

Numpad2::	;Strip blank lines + lead/trailing spaces
	FileRead v,% sDir "102 - Encounter at Farpoint.txt"
	v:=RegExReplace(v,"\t")
	v:=RegExReplace(v,"m)^ *")
	v:=RegExReplace(v,"\n\r")
	v:=RegExReplace(v,"m) *$")
	FileDelete tst.txt							;Clear Tmp
	FileAppend % v,tst.txt					;Make Test
	MsgBox % v
Return

NumpadDot::ExitApp