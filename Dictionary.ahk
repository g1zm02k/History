;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Autoexecute
    #NoEnv
    #SingleInstance force
;    #NoTrayIcon
    
    Gui Result:Color, F0F0F0
    Gui Result:Font, s10 bold, Verdana
    Gui Result:Add, Text, w550 r1 vWrd
    Gui Result:Font, norm
    Gui Result:Add, Edit, w550 r20 vDef t15 +ReadOnly -Wrap HScroll
return

^+d::
InputBox Word, Define Word, Enter word to define., , 150, 120
    if (ErrorLevel)
        return
    Word := RegExReplace(Word, "[^\w\s]")
    StringLower Word, Word
    gosub FindDef
return

^!d::
    SaveClip := ClipboardAll
    Clipboard := ""
    Send ^c
    ClipWait 1
    Word := RegExReplace(Clipboard, "[^\w\s]")
    Clipboard := SaveClip
    SaveClip := ""
    if (Word) {
        StringLower Word, Word
        gosub FindDef
    }
return

FindDef:
    if !Html := UrlGet("http://dictionary.reference.com/browse/" Word "+?s=t") {
        MsgBox No data returned from Dictionary.com
        return
    }
   
    Loop Parse, Html, `n, `r
    {
        if SubStr(A_LoopField, 1, 32) <> "<!-- google_ad_section_start -->"
            continue
        
        ; Variations - different forms of word entered
        ; Type - noun, verb, adjective, etc.
        RegExMatch(A_LoopField, "([^>]+)(?=</h2>)", Variation)
        RegExMatch(A_LoopField, "(?<=<span class=""pg"">).+?(?=,?\h</span>)", Type)
        Result .= (Result ? "`n`n" : "")
               .  Variation
               .  (Type ? "`n`t" . RegExReplace(Type, "<[^>]+>") : "")
        
        ; Get rid of extra crap
        DefStart := InStr(A_LoopField, "<div class=""luna-Ent"">", false, 1, 2)
        Def := SubStr(A_LoopField, DefStart)
        Def := RegExReplace(Def, "<span class=""prondelim"">.*?Show IPA|<sup>\d*</sup>|<[^>]+>")
        
        ; Format defs that begin with a number
        Def := RegExReplace(Def, "i)(\d+\.)(\d+[^\d.]\d|[a-z(])", "`n`n`t`t$1 $u2")
        StringReplace Def, Def, `n`n, `n
        
        ; Format defs that begin with a letter
        Def := RegExReplace(Def, "(?:\.|\h)([a-z]\.)([^\h])", "`n`t`t`t$1 $u2")
        
        ; Format defs that don't begin with number or letter
        Def := RegExReplace(Def, "(\d\.\h\w+)\.\h(\w)", "$1`n`t`t`t$u2")
        
        ; If none of the format rules above applied
        if not InStr(Def, "`t")
            Def := RegExReplace(Def, "(.)(.+)", "`n`t`t$u1$2")
        
        Result .= "" . WordWrap(Def, 75, 5)
    }


    if (Result) {
        StringUpper Word, Word, T
        Gui Result:Show, , Word Definition
        GuiControl Result:, Wrd, %Word%
        GuiControl Result:, Def, %Result%
    }
    else {
        Gui Result:+OwnDialogs
        Result := RegExReplace(Html, "<[^>]+>")
        RegExMatch(Result, "Did you mean\K[^\n]+", Result)
        MsgBox, 68, Not Found, % "No definition was found for " Word "`n`n"
                               . "Did you mean " Result "?"
        IfMsgBox Yes
        {
            Word := Result
            goto FindDef
        }
    }
    Result := Def := Html := ""
return

ResultGuiEscape:
    Gui Result:Cancel
return

UrlGet(url)
{
    FileEncoding UTF-8
    TempFile := A_Temp "/" A_Now ".tmp"
    URLDownloadToFile % url, % TempFile
    FileRead out, % TempFile
    FileDelete % TempFile
    return out
}

; Modified from st_wordwrap() by tidbit
; http://www.autohotkey.com/board/topic/90972-string-things-common-string-and-array-funcions/?p=574142
; string = what to Wrap, column = where to wrap, indent = Number of spaces to indent
wordWrap(string, column = 56, Indent = 5)
{
    Loop, Parse, string, `n, `r
    {
        StringReplace Line, A_LoopField, `t, % Spaces(Indent), UseErrorLevel
        IndentChar := Spaces((ErrorLevel + 1) * Indent)
        IndentLength := StrLen(IndentChar)
        If (StrLen(Line) > column)
        {
            pos := 1
            Loop, Parse, Line, %A_Space%
                If (pos + (loopLength := StrLen(A_LoopField)) <= column)
                    out .= (A_Index = 1 ? "" : " ") A_LoopField
                    , pos += loopLength + 1
                Else
                    pos := loopLength + 1 + indentLength
                    , out .= "`n" indentChar A_LoopField
             
            out .= "`n"
        } Else
            out .= Line "`n"
    }
     
    Return SubStr(out, 1, -1)
}

Spaces(n)
{
    Loop % n
        out .= A_Space
    return out
}