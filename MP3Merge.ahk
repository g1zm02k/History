; MergeMP3.ahk
#NoEnv
#SingleInstance, Force
		SetWorkingDir D:\Downloads\
    Target := A_Desktop
    Title := "Merge MP3"
    Run, MergeMP3.exe
    WinWaitActive, %Title%
    Loop, Files, %Target%\*.*, D
        Run_MergeMP3_on_Folder(A_LoopFileFullPath)
ExitApp

;-------------------------------------------------------------------------------
Run_MergeMP3_on_Folder(FullPath_To_Folder) {
;-------------------------------------------------------------------------------
    TestFlag := False
    Loop, Files, %FullPath_To_Folder%\*.mp3
    {
        SendInput, ^o
        WinWaitActive, Add MP3 Files to Merge
        SendInput, %A_LoopFileFullPath%{Enter}
        TestFlag := True
    }
    If (TestFlag) {
        SendInput, ^m
        WinWaitActive, Save Merged File As
        SendInput, %FullPath_To_Folder%.merged.mp3{Enter}
    }
}
Esc:: ExitApp
