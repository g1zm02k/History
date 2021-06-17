﻿global WordList:="Monday`nTuesday`nWednesday`nThursday`nFriday`nSaturday`nSunday"
global Suffix:="",SacHook

SacHook:=InputHook("V","{Esc}")
SacHook.OnChar:=Func("SacChar")
SacHook.OnKeyDown:=Func("SacKeyDown")
SacHook.OnEnd:=Func("SacEnd")
SacHook.KeyOpt("{Backspace}","N")
SacHook.Start()

SacChar(ih,char){  ; Called when a character is added to SacHook.Input.
    Suffix:=""
    if RegExMatch(ih.Input,"`nm)\w+$",prefix)
        RegExMatch(WordList,"`nmi)^" prefix "\K.*",Suffix)
    
    ToolTip % Suffix,% A_CaretX + 15,% A_CaretY    
    ; Intercept Tab only while we're showing a Tooltip.
    ih.KeyOpt("{Tab}",Suffix=""?"-NS":"+NS")
}

SacKeyDown(ih, k, c){
    if (vk=8) ; Backspace
        SacChar(ih,"")
    else if (vk=9) ; Tab
        Send % "{Text}" Suffix
}

SacEnd(){
    ExitApp
}