#SingleInstance Force
SetTimer, TClick, 500

Gui, Font, s10, Lucida Console
Gui, Add, Text, x5 y5 w275 h30 vCsh, Not running.
Gui, Add, Text, x5 y35 w275 h30 vRng, Not running.
Gui, Add, Text, x5 y75 w275 h30 vFue, Not running.
Gui, Add, Text, x5 y105 w275 h30 vBio, Not running.
Gui, Add, Text, x5 y135 w275 h30 vCom, Not running.
Gui, Add, Text, x5 y165 w275 h30 vMin, Not running.
Gui, Add, Text, x5 y195 w275 h30 vPre, Not running.
Gui, Add, Button, x20 y225 w80 h28 vGMP, 5M GMP
Gui, Add, Button, x120 y225 w80 h28 vRes, Reset DP
Gui, Show, x550 y600 w220 h260, Demon Points
return

GuiClose:
ExitApp

Button50K:
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	if PID > 0
		WriteProcessMemory(PID, 0x142bc8d08, 5000000)
return

ButtonReset:
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	if PID > 0
		WriteProcessMemory(PID, 0x142bc8d1c, 0)
return

TClick:
	Process, Exist, mgsvtpp.exe
	PID := ErrorLevel
	if PID > 0
	{
		vdp := ReadMemory(0x142bc8d1c, PID) ; Demon Points
		vcs := ReadMemory(0x142bc8d08, PID) ; GMP
		vfu := ReadMemory(0x142bd7194, PID)//2 ; Fuel
		vbi := ReadMemory(0x142bd7198, PID)//2 ; Biological
		vco := ReadMemory(0x142bd719c, PID)//2 ; Common
		vmi := ReadMemory(0x142bd71a0, PID)//2 ; Minor
		vpr := ReadMemory(0x142bd71a4, PID)//2 ; Precious
		GuiControl, Enable, Res
		GuiControl, Enable, GMP
		GuiControl, , Csh, GMP: %vcs%
		GuiControl, , Rng, DP : %vdp%
		GuiControl, , Fue, Fue: %vfu%
		GuiControl, , Bio, Bio: %vbi%
		GuiControl, , Com, Com: %vco%
		GuiControl, , Min, Min: %vmi%
		GuiControl, , Pre, Pre: %vpr%
	}
	else
	{
		GuiControl, Disable, Res
		GuiControl, Disable, GMP
		GuiControl, , Csh, Not running.
		GuiControl, , Rng, Not running.
		GuiControl, , Fue, Not running.
		GuiControl, , Bio, Not running.
		GuiControl, , Com, Not running.
		GuiControl, , Min, Not running.
		GuiControl, , Pre, Not running.
	}
return

ReadMemory(MADDRESS,PID)
{
	VarSetCapacity(MVALUE,4,0)
	ProcessHandle := DllCall("OpenProcess", "Int", 24, "Char", 0, "UInt", pid, "UInt")
	DllCall("ReadProcessMemory","UInt",ProcessHandle,"UInt",MADDRESS,"Str",MVALUE,"UInt",4,"UInt *",0)
	Loop 4
		result += *(&MVALUE + A_Index-1) << 8*(A_Index-1)
	return, result  
}

WriteProcessMemory(proc_id, addr, addr_value, addr_offset = 0, value_size = 4)
{
	if (proc_id > 0)
	{
		addr += addr_offset
		ProcessHandle := DllCall("OpenProcess", "UInt", 0x28, "char", 0, "UInt", proc_id, "UInt")
		write_success := DllCall("WriteProcessMemory", "UInt", ProcessHandle, "UInt", addr, "UInt *", addr_value, "Uint", value_size, "Uint *", BytesWritten)
		DllCall("CloseHandle", "int", ProcessHandle)
	}
	return, % write_success
}