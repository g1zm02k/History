#NoEnv
#SingleInstance Force
#Persistent
SetTimer tAlarm
AlarmOn:=true
aT:="200240"
aH:=SubStr(aT,1,2)
aM:=SubStr(aT,3,2)
aS:=SubStr(aT,5,2)
/::
	AlarmOn:=!AlarmOn
	If AlarmOn {
		SetTimer tAlarm, 500
		Msb("Alarm On!",1)
	} Else {
		SetTimer tAlarm, Off
		Msb("Alarm Off",1)
	}
Return
tAlarm:
If (A_Hour=aH) and (A_Min=aM) and (A_Sec=aS)
{
  SetTimer tAlarm, Off
	Loop 5
		SoundBeep 880,100
}
Return