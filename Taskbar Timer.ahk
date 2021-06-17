#include taskbarInterface.ahk
width := 167
startMinimized := true

icoNum := 168
Menu, Tray, Icon, Shell32.dll, % icoNum

^#z::
	stopAlarm++
	settimer update, off
	Progress, Hide
	InputBox, var, Timer, Set Timer:,,,,,,,, hhmmss
	if var is not integer
		return
	loop % 6 - strlen(var)
		var := "0" . var
	s := SubStr(var, -1, 2) + SubStr(var, -3, 2) * 60 + SubStr(var, 1, strlen(var) - 4) * 60 * 60
	startTime := a_tickcount
	endTime := a_tickcount + s * 1000
	Progress, % "m2 x" a_screenwidth - width - 8 " y" a_screenheight / 2 +100 " w" width " r0-" width " gtest ZH12 ZX4 ZY2 WM550",, %a_space%, Timer
	if startMinimized
		WinMinimize, Timer
	WinGet, hwnd, ID , Timer ; gets the ID of the timer window so that the taskbar can be updated along with the progress bar (using taskbarinterface.ahk)
	tbi := new taskbarInterface(hwnd)
	gosub update
	settimer update, 1000
return

update:
	progressPercent := round((a_tickcount - startTime) * width / (endTime - startTime))
	taskBarProgressPercent := round((a_tickcount - startTime) * 100 / (endTime - startTime))
	h := m := 0, str := "",	s := round((endTime - a_tickcount) / 1000)
	if (s >= 60)
		m := s // 60, s -= m * 60
	if (m >= 60)
		h := m // 60, m -= h * 60, str .= h "h "
	if (m or h)
		str .= m "m "
	str .= s "s" 
	Progress, % progressPercent,, % str, % str
	tbi.setProgress(taskBarProgressPercent)
	if (a_tickcount > endTime) {
		settimer update, off
		Progress,,, space`, esc`, enter
		alarm()
		return
	}
return	

alarm() {
	global
	stopAlarm := 0
	loop {
		loop 3 {
			if stopAlarm
				return
			SoundBeep
			sleep 100
		}
		sleep 700
	}
	gosub stopAlarm
}

#if !stopAlarm

esc::
enter::
numpadenter::
space::
stopAlarm:
	stopAlarm++
	Progress, Hide
return