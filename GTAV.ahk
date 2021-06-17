var=%1%
sou=D:\Coding\Hack\GTA\
des=F:\SteamLibrary\steamapps\common\Grand Theft Auto V\
If var = Activate
{
	IfExist, %des%\ScriptHookV.dll
	{
		SplashTextOn, , ,Already %1%d
			Sleep 3000
		SplashTextOff
	}else{
		FileCopy %sou%*.*, %des%
  		FileCopyDir %sou%menyooStuff, %des%menyooStuff
		SplashTextOn, , ,%1%d
			Sleep 3000
		SplashTextOff
	}
}else{
	IfExist, %des%\ScriptHookV.dll
	{
		FileCopy %des%menyooStuff\menyooConfig.ini, %sou%menyooStuff\, 1
		FileDelete %des%dinput8.dll
		FileDelete %des%NativeTrainer.asi
		FileDelete %des%ScriptHookV.dll
		FileDelete %des%asiloader.log
		FileDelete %des%ScriptHookV.log
		FileDelete %des%Menyoo.asi
		FileDelete %des%menyooLog.txt
;		FileDelete %des%GTAVLauncher.exe
;		FileDelete %des%GTAVLauncherBypass.asi
;		FileDelete %des%GTAVLauncherBypass.ini
		FileRemoveDir %des%menyooStuff, 1
		SplashTextOn, , ,%1%d
			Sleep 3000
		SplashTextOff
	}else{
		SplashTextOn, , ,Already %1%d
			Sleep 3000
		SplashTextOff
	}
}
ExitApp

SplashTextOn, , ,What are you pressing?!
	Sleep 3000
SplashTextOff