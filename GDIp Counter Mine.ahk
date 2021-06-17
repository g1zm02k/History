#Include <GDIp>
#Include <GDIpHelper>

Insert::settimer,Sec,% (a:=!a) ? "off" : "on"
PgUp::goto StartOver
End::Cnt=0
Delete::ExitApp

StartOver:
	SetTimer, Sec, 1000
	Cnt=7200 ;2880
return

Sec:
	SetUpGDIP()
	StartDrawGDIP()
	ClearDrawGDIP()
	Gdip_SetSmoothingMode(G,4)
	If Cnt>0
		Gdip_TextToGraphics(G,FormatSeconds(Cnt),"x100 y100 Right cffaaff00 r4 s24", "ProFontWindows")
	else
	{
		Gdip_TextToGraphics(G,".","x100 y100 Right cffff0000 r4 s24", "ProFontWindows")
		settimer,Sec,off
		loop 3
		{
			SoundBeep, 880, 50
			Sleep, 50
		}
	}
	EndDrawGDIP()
	Cnt--
return

FormatSeconds(x) 
{ 
Out:=SubStr("0" . Mod(x, 60),-1),x:=Floor(x/60)
Return x ":" Out
}