; ControlSend Test 
#IfWinExist, ahk_exe winamp.exe
; Previous Song
#z::ControlSend, ahk_parent, z, ahk_class Winamp v1.x
; Play
#x::ControlSend, ahk_parent, x, ahk_class Winamp v1.x
; Pause
#v::ControlSend, ahk_parent, c, ahk_class Winamp v1.x
; Next Song
#b::ControlSend, ahk_parent, b, ahk_class Winamp v1.x
#IfWinExist
; usually:- #F1::ControlSend, , F1, ahk_class appname