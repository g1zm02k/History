#NoEnv
#SingleInstance Force
#Persistent

SetTimer, TimerLabel
Return

TimerLabel:
if (A_Min=00) and (A_Sec=00)
  b(A_Hour)
Return

b(v){
	v:=Mod(v-1,12)+1
	q:=Floor(v/3)
	s:=Mod(v,3)
	Loop % q
	{
		SoundBeep 440,300
		Sleep 150
	}
	Loop % s
	{
		SoundBeep 440,100
		Sleep 50
	}
  Sleep 900
}