;SplashTextOn, , , Displays only a title bar.
SplashTextOn, 400, 300, Clipboard, The clipboard contains:`n%clipboard%
Sleep, 3000
;WinMove, Clipboard, , 0, 0  ; Move the splash window to the top left corner.
;Msgbox, Press OK to dismiss the SplashText
SplashTextOff
ExitApp