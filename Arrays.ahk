Global  nameArr:={1:  {fn:"John"    ,ln:"Doe"  ,data:"The John is another name for a toilet."}
          ,2:  {fn:"Jane"    ,ln:"Doe"  ,data:"Known for hooking up with Tarzan."}
          ,25:{fn:"Johnny"  ,ln:"Five"  ,data:"This dude IS alive."}}
Exit
F1::GetNameArrData()
GetNameArrData(){
  InputBox, userData, Title, Enter in the number of the employee`nExample: 1 or 25,,,,,,,, 25
  userArr := nameArr[userData]
  MsgBox, % "First Name: " userArr.fn
    . "`nLast Name: " userArr.ln
    . "`nUser Data: " nameArr[userData].data
  Return
}


Array := []
WinGet, WinL, List
Loop % WinL
  {
    WiID := WinL%A_Index%
    WinGetTitle, WinT, ahk_id %WiID%
    WinGetClass, WinC, ahk_id %WiID%
    Array[A_Index] := WinL%A_Index% " ~ " WinT " ~ " WinC
    FLst := FLst A_Index ": " Array[A_Index] "`n"
  }
  MsgBox % "No. of Windows: " WinL "`n`n" FLst
return


Things := ["Thing to say 1","Thing to say 2","Thing to say 3","etc"]
Loop, 50 {
  Random, rand, 1, % Things.Length()
  Send % Things[rand]
  Sleep 5000
}