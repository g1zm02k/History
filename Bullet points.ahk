^+!b::
  Clipboard:=""
  Send ^c
  ClipWait
  Clipboard:="▪ " RegExReplace(Clipboard," and | *, and | *, *","`n▪ ")
  Send ^v
Return