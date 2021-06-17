F1::
  WinGetTitle wT,A
  vN:=RegExReplace(wT,"i).*(Will|Alan|Rob).*","$1",vC)
  If vC
    MsgBox % "Is this still you, " vN "?"
  Else
    MsgBox % "No match found!"
Return