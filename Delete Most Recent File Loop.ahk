^Del::						;Ctrl+Delete
	Dir:="D:\Downloads\_To Do\"	;Change this
	Lst := ""
	Loop, Files, % Dir "*.png", F
		Lst .= A_LoopFileTimeModified "\" A_LoopFileName "`n"
	Sort, Lst, R
	Lst:=RegExReplace(Lst, ".*?\\(.*?png)`n.*", "$1")
	FileDelete % Dir Lst
Return