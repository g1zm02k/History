;x,y loop from one counter
#MaxThreadsPerHotkey 2
MButton::
Tog:=!Tog
Loop 60
{
	If not Tog
		Break
	x:=Mod((A_Index-1),12)+1
	y:=Ceil(A_Index/12)
	MouseMove 1234+x*52.6,557+y*53
	Sleep 200
}
Return