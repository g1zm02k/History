var=%1%
sou=E:\Games\Far Cry 5\bin\EasyAntiCheat
If var = Activate
{
	IfExist, %sou%\EasyAntiCheat_x64.org
	{
		SplashTextOn, , ,Already %1%d
			Sleep 1000
		SplashTextOff
	}else{
		FileMove %sou%\EasyAntiCheat_x64.dll, %sou%\EasyAntiCheat_x64.org
		FileMove %sou%\EasyAntiCheat_x64.cht, %sou%\EasyAntiCheat_x64.dll
		SplashTextOn, , ,%1%d
			Sleep 1000
		SplashTextOff
	}
}else{
	IfExist, %sou%\EasyAntiCheat_x64.cht
	{
		SplashTextOn, , ,Already %1%d
			Sleep 1000
		SplashTextOff
	}else{
		FileMove %sou%\EasyAntiCheat_x64.dll, %sou%\EasyAntiCheat_x64.cht
		FileMove %sou%\EasyAntiCheat_x64.org, %sou%\EasyAntiCheat_x64.dll
		SplashTextOn, , ,%1%d
			Sleep 1000
		SplashTextOff
	}
}
ExitApp

SplashTextOn, , ,Already %1%d
	Sleep 1000
SplashTextOff