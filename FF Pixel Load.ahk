#Persistent
CoordMode ToolTip
CoordMode Pixel
CoordMode Mouse

SetTimer tTimer,100
Return
	
tTimer:
	PixelGetColor pCol,75,45,RGB
	If (pCol:="0x323234")
		t:="Page Loaded"
	Else If (pCol:="0xbebebe")
		t:="Loading..."
	Else
		t:="Other..."
	ToolTip % t,30,A_ScreenHeight-50
Return

Esc::ExitApp
