#SingleInstance Force
#IfWinActive ahk_class fox
#NoEnv
SendMode Input
ToggleWalk := false
SingleShot := false
SuspOn:= false

c::Esc

h::ToggleWalk := !ToggleWalk
h up::
	while ToggleWalk
		{
			send {h down}
			Sleep 30
		}
	send {h up}
return

RButton & LButton::
	SingleShot := GetKeyState("CapsLock", "T")
	if SingleShot = 1
		{
			Send, {click}
			Sleep 250  
		}
	else
		{
			Send {LButton down}
		}
return

Numpad1::
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	WriteProcessMemory(PID, 0x142bc9d88, 5000000) ; GMP
return

Numpad2::
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	WriteProcessMemory(PID, 0x142bd8214, 800000) ; Fuel
	WriteProcessMemory(PID, 0x142bd8218, 800000) ; Biological
	WriteProcessMemory(PID, 0x142bd821c, 800000) ; Common
	WriteProcessMemory(PID, 0x142bd8220, 800000) ; Minor
	WriteProcessMemory(PID, 0x142bd8224, 800000) ; Precious
return

Numpad3::
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	WriteProcessMemory(PID, 0x142bd8228, 70000) ; Wormwood
	WriteProcessMemory(PID, 0x142bd822c, 70000) ; Bl. Carrot
	WriteProcessMemory(PID, 0x142bd8230, 70000) ; G. Crescent
	WriteProcessMemory(PID, 0x142bd4238, 70000) ; Terragon
	WriteProcessMemory(PID, 0x142bd8238, 70000) ; Af. Peach
	WriteProcessMemory(PID, 0x142bd823c, 70000) ; Di (Pupurea)
	WriteProcessMemory(PID, 0x142bd8240, 70000) ; Di (Lutea)
	WriteProcessMemory(PID, 0x142bd8244, 70000) ; Haoma
return

Numpad9::
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	WriteProcessMemory(PID, 0x142bc9d9c, 0) ; Demon
return

Numpad0::
	Suspend
	SuspOn := !SuspOn
	if SuspOn
		{
			SoundBeep 440, 30
		}
	else
		{
			SoundBeep 880, 30
		}
return